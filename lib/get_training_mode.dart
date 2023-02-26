import 'dart:io';

/// Prompts the user to select a training mode and returns the selected mode as a [String].
///
/// This function prints a message to the console that asks the user to select a training mode by entering "s" for simple or "f" for fancy. It then reads a line of input from the console using the `stdin.readLineSync()` method and returns the input as a [String]. If the user enters an empty string or `null`, the function recursively calls itself to prompt the user again.
///
/// Returns the selected training mode as a [String].

String getTrainingMode() {
  print('Select a training mode:');
  print('     Enter "s" for simple.');
  print('     Enter "f" for fancy');

  // Request that the user input some training data.
  String? trainingMode = stdin.readLineSync();

  if (trainingMode == null) {
    print('Please enter a training mode');
    return getTrainingMode();
  } else {
    return trainingMode;
  }
}
