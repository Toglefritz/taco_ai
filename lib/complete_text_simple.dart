import 'dart:io';

import 'get_most_likely_next_word.dart';

/// Completes a text prompt by suggesting the most likely next word based on a trained TACO model.
///
/// This function takes a trained TACO model as a parameter and prompts the user to input a text completion prompt.
/// If the prompt is not null and not an empty string, the function uses the `getMostLikelyNextWord` function
/// to get the most likely next word based on the trained model and prints the resulting completion to the console.
/// If the prompt is null or empty, the function prompts the user to enter a valid prompt and recursively calls
/// itself to start over.

void completeTextSimple(Map<String, Map<String, int>> trainedModel) {
  print('Enter a text completion prompt');

  // Request that the user input a prompt for TACO to complete.
  String? prompt = stdin.readLineSync();

// If the prompt is not null and not an empty string, get the most likely
// next word and print it.
  if (prompt != null && prompt != '') {
    String? mostLikelyNextWord = getMostLikelyNextWord(prompt, trainedModel);

    print('Output: ');
    // A null [mostLikelyNextWord] indicates that the last word in the prompt is 
    // not in the training data.
    if (mostLikelyNextWord == null) {
      print('<insufficient training data to complete prompt');
    } else {
      print('$prompt $mostLikelyNextWord');
    }
  }
  // Otherwise, ask the user to enter a valid prompt.
  else {
    print('Please enter some text to complete');
    completeTextSimple(trainedModel);
  }
}
