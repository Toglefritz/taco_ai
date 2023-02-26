import 'package:taco/complete_text_fancy.dart';
import 'package:taco/complete_text_simple.dart';
import 'package:taco/get_training_mode.dart';
import 'package:taco/list_keyed_map_utilities.dart';
import 'package:taco/n_gram_model.dart';
import 'package:taco/train_n_gram_model.dart';
import 'package:taco/train_simple_model.dart';

void main(List<String> arguments) {
  print('Hello and welcome to TACO AI');
  print(
      'As long as you have a taco to snack on while you work, we can get started.');
  print('');

  // First, prompt the user to select a training mode
  String trainingMode = getTrainingMode();

  // Second, train the model based on the selected training mode.
  if (trainingMode == 's') {
    // Train the simple model
    Map<String, Map<String, int>>? trainedModel = trainSimpleModel();

    // Third, after training is complete, do some text completion in simple mode.
    if (trainedModel == null) {
      print('There was an error with the training process. Aborting.');
    } else {
      completeTextSimple(trainedModel);
    }
  } else {
    // Train the fancy model
    NGramModel nGramModel = trainNGramModel();

    // Third, after training is complete, do some text completion in fancy mode.
    completeTextFancy(nGramModel);
  }
}
