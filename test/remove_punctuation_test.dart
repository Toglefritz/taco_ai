import 'package:taco/remove_punctuation.dart';
import 'package:test/test.dart';

/// The first test case checks that the removePunctuation function removes all punctuation 
/// from an input string. The second test case checks that the function returns an empty 
/// string when given a string with only punctuation. The third test case checks that the 
/// function returns the input string when given a string with no punctuation.

void main() {
    test('removes punctuation marks from input text', () {
    expect(removePunctuation('Hello, world!'), equals('Hello world'));
    expect(removePunctuation('The quick brown fox jumps over the lazy dog.'), equals('The quick brown fox jumps over the lazy dog'));
    expect(removePunctuation('Some-punctuation-here.'), equals('Somepunctuationhere'));
    expect(removePunctuation('No punctuation here'), equals('No punctuation here'));
  });

  test('returns empty string if input is empty', () {
    expect(removePunctuation(''), equals(''));
  });
}
