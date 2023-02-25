/// Removes punctuation characters from a string.
///
/// This function takes the input string as an argument and creates a list of punctuation 
/// characters to remove. It then loops through each character in the input string, 
/// checks if it is in the list of punctuation  characters, and if not, adds it to the 
/// result string. The function then returns the result string with no punctuation.
// Define a list of punctuation characters to remove.

List<String> punctuation = [
  '.',
  ',',
  ';',
  ':',
  '!',
  '?',
  '(',
  ')',
  '[',
  ']',
  '{',
  '}',
  '<',
  '>',
  '/',
  '\\',
  '|',
  '@',
  '#',
  '%',
  '^',
  '&',
  '*',
  '-',
  '_',
  '+',
  '=',
  '~',
  '`'
];

String removePunctuation(String input) {
  // Create a new string with no punctuation
  String result = '';

  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    if (!punctuation.contains(char)) {
      result += char;
    }
  }

  return result;
}
