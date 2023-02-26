import 'dart:io';

import 'package:taco/remove_punctuation.dart';

import 'n_gram_model.dart';

/// Given an input string `prompt`, returns a completion of the prompt using the
/// `ngramModel`. The completion consists of the most likely next word for each
/// n-gram of the prompt, as predicted by the model. The function returns the
/// completed prompt as a single string.
void completeTextFancy(NGramModel ngramModel) {
  print('Enter a text completion prompt');

  // Request that the user input a prompt for TACO to complete.
  String? prompt = stdin.readLineSync();

// If the prompt is not null and not an empty string, get the most likely
// next word and print it.
  if (prompt != null && prompt != '') {
    final sanitizedPrompt = removePunctuation(prompt).toLowerCase();
    final words = sanitizedPrompt.split(' ');

    String nextWord = ngramModel.predictNextWord(context: words);

    print('Output: ');
    print('$prompt $nextWord');
  } else {
    print('Please provide a prompt');
    completeTextFancy(ngramModel);
  }
}
