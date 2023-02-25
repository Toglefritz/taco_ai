import 'package:taco/complete_text.dart';
import 'package:taco/train.dart';

void main(List<String> arguments) {
  print('Hello and welcome to TACO');

  // First train the model.
  Map<String, Map<String, int>>? trainedModel = train();

  // After training is complete, do some text completion.
  if (trainedModel == null) {
    print('There was an error with the training process. Aborting.');
  } else {
    completeText(trainedModel);
  }
}
