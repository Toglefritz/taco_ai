import 'dart:convert';
import 'dart:io';

import 'count_next_word_occurences.dart';

/// The [trainSimpleModel] method allows the user to enter some training data, uses the [countNextWordOccurrences]
/// function to count the occurrences of each word that follows another word in the input,
/// and prints out the resulting map of word occurrences in a pretty-printed JSON format.
///
/// The function first prints out a prompt for the user to enter the training data.
/// The user is expected to enter a single string of text that represents the training data.
///
/// After the user enters the training data, the function checks if the length of
/// the input string is greater than 2 characters. If it is, the function calls the
/// [countNextWordOccurrences] function with the input string to get a map of
/// word occurrences. The function then pretty-prints the resulting map of
/// word occurrences in JSON format using a JsonEncoder object.
///
/// If the length of the input string is less than or equal to 2 characters,
/// the function prints a message asking the user to provide some training data and then
/// recursively calls itself to start over again.
///
/// Finally, the method returns a [Map<String, Map<String, int>>] of the training result.

Map<String, Map<String, int>>? trainSimpleModel() {
  print('Enter training data, please.');

  // Request that the user input some training data.
  String? trainingData = stdin.readLineSync();

  print('Training TACO model from input data using the simple method.');

  // As long as valid training data was provided, train the TACO model
  // on the input data and print out the result.
  if (trainingData != null && trainingData.length > 2) {
    // Simple training mode

    final nextWordOccurencesCount = countNextWordOccurrences(trainingData);

    print('Simple training TACO completed: ');

    final encoder = JsonEncoder.withIndent('  ');
    final prettyPrint = encoder.convert(nextWordOccurencesCount);
    print(prettyPrint);

    return nextWordOccurencesCount;
  }
  // If no data was entered or if the length of the input is only a single word,
  // repeat the training data collection process.
  else {
    print('Please provide some training data');
    return trainSimpleModel();
  }
}
