import 'package:taco/remove_punctuation.dart';

/// This function first simplifies the input training data by removing 
/// 
/// Second, this function splits the input string into a list of words using the split method. 
/// It then creates an empty map to hold the results, which will be a map from each word in 
/// the input to a map of the next word and the count of occurrences.

/// The function then loops through each word in the input, except for the last one. For 
/// each word, it gets the current word and the next word, and then checks if the current 
/// word is already a key in the result map. If not, it adds it to the map with an empty 
/// inner map. It then checks if the next word is already a key in the inner map for the 
/// current word. If not, it adds it with a count of 0. Finally, it increments the count 
/// for the next word for the current word.

/// After the loop is finished, the function returns the result map.

Map<String, Map<String, int>> countNextWordOccurrences(String input) {
  // A simplified version of the input
  String sanitizedInput = '';

  // Simplify the input by removing periods
  sanitizedInput = removePunctuation(input);

  // Make the entire input in lowercase font
  sanitizedInput = sanitizedInput.toLowerCase();

  // Split the input string into a list of words
  List<String> words = sanitizedInput.split(' ');

  // Create a map to hold the results
  Map<String, Map<String, int>> result = {};

  // Loop through each word in the input, except the last one
  for (int i = 0; i < words.length - 1; i++) {
    String currentWord = words[i];
    String nextWord = words[i + 1];

    // If the current word is not already a key in the result map, add it
    if (!result.containsKey(currentWord)) {
      result[currentWord] = {};
    }

    // If the next word is not already a key in the inner map for the current word, add it
    if (!result[currentWord]!.containsKey(nextWord)) {
      result[currentWord]![nextWord] = 0;
    }

    // Increment the count for the next word for the current word
    result[currentWord]![nextWord] = result[currentWord]![nextWord]! + 1;
  }

  return result;
}