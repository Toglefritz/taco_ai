import 'dart:io';

import 'package:taco/n_gram_model.dart';

import 'n_gram_size.dart';

NGramModel trainNGramModel() {
  print('Enter training data, please.');

  // Request that the user input some training data.
  String? trainingData = stdin.readLineSync();

  print('Training TACO model from input data using the fancy method.');

// If valid training data as provided, create the NGramModel with tri-grams
  if (trainingData != null) {
    NGramModel nGramModel =
        NGramModel(n: nGramSize, corpus: trainingData.split(' '));

    print('Fancy training TACO completed: ');
    print(nGramModel.ngrams);

    return nGramModel;
  }
  // Otherwise, prompt the user to provide valid training data
  else {
    print('Please provide some training data');
    return trainNGramModel();
  }
}
