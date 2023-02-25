import 'package:taco/get_most_likely_next_word.dart';
import 'package:test/test.dart';

/// This test defines a test occurrences map that is used for all test cases. The map has several 
/// words as keys, and each key has an inner map with the next words and their occurrence counts.

/// The test then defines four test cases for the getMostLikelyNextWord function. The first 
/// test case checks that the function returns the most likely next word for a given 
/// input word. The second test case checks that the function returns null if the input 
/// word is not in the occurrences map. The third test case checks that the function 
/// returns null if the inner map for the input word is empty. The fourth test case 
/// checks that the function returns the only key in the inner map when it has only one 
/// key-value pair.

void main() {
  Map<String, Map<String, int>> testOccurrencesMap = {
    'the': {'cat': 3, 'dog': 2, 'house': 1},
    'cat': {'in': 2, 'on': 1},
    'in': {'the': 2},
    'dog': {'and': 1, 'cat': 1, 'house': 1},
    'and': {'the': 1},
    'on': {'the': 1}
  };

  test('getMostLikelyNextWord returns the most likely next word for a given input word', () {
    String input = 'the';
    String expectedOutput = 'cat';
    String? actualOutput = getMostLikelyNextWord(input, testOccurrencesMap);
    expect(actualOutput, equals(expectedOutput));
  });

  test('getMostLikelyNextWord returns null if the input word is not in the occurrences map', () {
    String input = 'fish';
    String? expectedOutput;
    String? actualOutput = getMostLikelyNextWord(input, testOccurrencesMap);
    expect(actualOutput, equals(expectedOutput));
  });

  test('getMostLikelyNextWord returns null if the inner map for the input word is empty', () {
    String input = 'on';
    String? expectedOutput;
    String? actualOutput = getMostLikelyNextWord(input, testOccurrencesMap);
    expect(actualOutput, equals(expectedOutput));
  });

  test('getMostLikelyNextWord returns the only key in the inner map when it has only one key-value pair', () {
    String input = 'in';
    String expectedOutput = 'the';
    String? actualOutput = getMostLikelyNextWord(input, testOccurrencesMap);
    expect(actualOutput, equals(expectedOutput));
  });
}