/*
 * Copyright 2023 The TensorFlow Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *             http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:python_ki_app/business/game/game_logic.dart';
import 'package:python_ki_app/data/game_move.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'isolate_inference.dart';

class GestureClassificationHelper {
  static const _modelPath = 'assets/rock_paper_scissors.tflite';
  static const _labelsPath = 'assets/labels.txt';
  late final List<String> _labels;
  late Interpreter _interpreter;
  late final IsolateInference _isolateInference;
  late Tensor _inputTensor;
  late Tensor _outputTensor;
  final GameLogic gameLogic;

  GestureClassificationHelper({required this.gameLogic});

  void _loadModel() async {
    final options = InterpreterOptions();
    // Load model from assets
    _interpreter = await Interpreter.fromAsset(_modelPath, options: options);
    _inputTensor = _interpreter
        .getInputTensors()
        .first;
    _outputTensor = _interpreter
        .getOutputTensors()
        .first;
  }

  // load model and labels
  Future<void> init() async {
    _loadModel();
    _loadLabels();
    _isolateInference = IsolateInference();
    await _isolateInference.start();
  }

  Future<void> _loadLabels() async {
    final labelTxt = await rootBundle.loadString(_labelsPath);
    _labels = labelTxt.split(',');
  }

  Future<Iterable<MapEntry<GameMove, double>>> _inference(
      InferenceModel inferenceModel) async {
    ReceivePort responsePort = ReceivePort();
    _isolateInference.sendPort
        .send(inferenceModel..responsePort = responsePort.sendPort);

    // Await the result from the isolate
    var results = await responsePort.first;

    // Assuming `results` is a Map<String, double>
    if (results is Map) {
      var iterable = (results
          .map(
            (key, value) =>
            MapEntry<GameMove, double>(
                stringToGameMove(key as String), value as double),
      )
          .entries
          .toList()
        ..sort(
              (a, b) => a.value.compareTo(b.value),
        ))
          .reversed
          .take(3);
      var userSelection = iterable.first;
      gameLogic.userSelection(userSelection.key);
      return iterable;
    }

    throw Exception(
        "Unexpected data type received from isolate: ${results.runtimeType}");
  }

  // inference camera frame
  Future<Iterable<MapEntry<GameMove, double>>> inferenceCameraFrame(
      CameraImage cameraImage) async {
    var isolateModel = InferenceModel(cameraImage, _interpreter.address,
        _labels, _inputTensor.shape, _outputTensor.shape);

    return _inference(isolateModel);
  }

  Future<void> close() async {
    await _isolateInference.close();
    _interpreter.close();
  }
}
