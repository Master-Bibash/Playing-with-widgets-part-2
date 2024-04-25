import 'dart:isolate';

void main() {
  Isolate.spawn<IsolateModel>(
      heavytask, IsolateModel(iteration: 35500, multiplier: 500));
}

void heavytask(IsolateModel model) {
  int total = 0;
  for (int i = 1; i < model.iteration; i++) {
    total += (i * model.multiplier);
  }
}

class IsolateModel {
  final int iteration;
  final int multiplier;

  IsolateModel({required this.iteration, required this.multiplier});
}
