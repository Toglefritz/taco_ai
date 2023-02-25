import 'package:taco/count_next_word_occurences.dart';
import 'package:test/test.dart';

/// The first test case checks that the function returns the correct map for a given
/// input string with multiple words and punctuation. The second test case checks
/// that the function returns an empty map for an input string with no words. The
/// third test case checks that the function returns a map with one key-value pair
/// for an input string with only one word.
///
void main() {
  test(
      'countNextWordOccurrences returns the correct map for a given input string',
      () {
    String input = 'the cat in the hat the hat on the mat';
    Map<String, Map<String, int>> expectedOutput = {
      'the': {'cat': 1, 'hat': 2, 'mat': 1},
      'cat': {'in': 1},
      'in': {'the': 1},
      'hat': {'the': 1, 'on': 1},
      'on': {'the': 1},
      'mat': {}
    };
    Map<String, Map<String, int>> actualOutput =
        countNextWordOccurrences(input);
    expect(actualOutput, equals(expectedOutput));
  });

  test(
      'countNextWordOccurrences returns an empty map for an input string with no words',
      () {
    String input = '';
    Map<String, Map<String, int>> expectedOutput = {};
    Map<String, Map<String, int>> actualOutput =
        countNextWordOccurrences(input);
    expect(actualOutput, equals(expectedOutput));
  });

  test(
      'countNextWordOccurrences returns a map with one key-value pair for an input string with only one word',
      () {
    String input = 'hello';
    Map<String, Map<String, int>> expectedOutput = {'hello': {}};
    Map<String, Map<String, int>> actualOutput =
        countNextWordOccurrences(input);
    expect(actualOutput, equals(expectedOutput));
  });
}
