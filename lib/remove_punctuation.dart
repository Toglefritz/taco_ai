/// Removes punctuation characters from a string.
///
/// This function takes the input string as an argument and creates a list of punctuation
/// characters to remove. It then loops through each character in the input string,
/// checks if it is in the list of punctuation  characters, and if not, adds it to the
/// result string. The function then returns the result string with no punctuation.
// Define a list of punctuation characters to remove.

final RegExp punctuation = RegExp(r'[^\w\s]');

/// Removes all punctuation characters from the input [text] and returns 
/// the resulting string.
String removePunctuation(String text) {
  return text.replaceAll(punctuation, '');
}
