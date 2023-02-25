import 'package:taco/remove_punctuation.dart';

/// Returns the most likely next word for a given input word based on a map of next word occurrences.
///
/// This function takes an input word and a map of next word occurrences as parameters. It simplifies the input
/// word by removing punctuation, converting it to lowercase, and splitting it into a list of words. It then
/// checks if the last word in the input is in the occurrences map and, if it is, finds the key in the inner map
/// with the highest occurrence count. If the last word is not in the occurrences map or the inner map is empty,
/// the function returns null.
///
/// Note that this implementation assumes that the inner map contains at least one key-value
/// pair. If the inner map can be empty, you should modify the implementation accordingly
/// to handle that case.

String? getMostLikelyNextWord(
    String input, Map<String, Map<String, int>> occurrencesMap) {
  // A simplified version of the input
  String sanitizedInput = '';

  // Simplify the input by removing periods
  sanitizedInput = removePunctuation(input);

  // Make the entire input in lowercase font
  sanitizedInput = sanitizedInput.toLowerCase();

  // Split the input string into a list of words
  List<String> words = sanitizedInput.split(' ');

  String lastWord = words.last;

  // If the input word is not in the occurrences map, return null
  if (!occurrencesMap.containsKey(lastWord)) {
    return null;
  }

  // Get the inner map for the input word
  Map<String, int>? innerMap = occurrencesMap[lastWord];

  // If the inner map is empty, return null
  if (innerMap == null || innerMap.isEmpty) {
    return null;
  }

  // Find the key in the inner map with the highest value
  String? mostLikelyNextWord;
  int maxCount = -1;

  for (String key in innerMap.keys) {
    int count = innerMap[key]!;
    if (count > maxCount) {
      maxCount = count;
      mostLikelyNextWord = key;
    }
  }

  return mostLikelyNextWord;
}
