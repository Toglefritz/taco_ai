import 'package:taco/remove_punctuation.dart';
import 'package:test/test.dart';

/// The first test case checks that the removePunctuation function removes all punctuation 
/// from an input string. The second test case checks that the function returns an empty 
/// string when given a string with only punctuation. The third test case checks that the 
/// function returns the input string when given a string with no punctuation.

void main() {
  test('removePunctuation returns empty string for input with only punctuation', () {
    for (var element in punctuation) {
      expect(removePunctuation(element), '');
    }
    expect(removePunctuation('.,;:!?'), '');
  });

   test('removePunctuation removes all punctuation', () {
    String input = "Hello, World! How are you today?";
    String expectedOutput = "Hello World How are you today";
    String actualOutput = removePunctuation(input);
    expect(actualOutput, equals(expectedOutput));
  });

  test('removePunctuation returns input for input with no punctuation', () {
    String input = "This is a test string";
    String expectedOutput = "This is a test string";
    String actualOutput = removePunctuation(input);
    expect(actualOutput, equals(expectedOutput));
  });
}
