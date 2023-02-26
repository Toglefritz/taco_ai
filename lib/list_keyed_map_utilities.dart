import 'package:collection/collection.dart';

/// Provides utilities for dealing with [Map]s that use [List]s as keys. These
/// use the type, Map<List<String>,Map<String, int>>.
extension ListKeyedMapUtilities on Map<List<String>, Map<String, int>> {
  /// Attempting to get a value by referencing a List that is a key of the
  /// Map, as one would normally do with Maps, will return a null value. For
  /// example,
  ///   ```
  ///   var test = {
  ///     ['test']: {'test': 1}
  ///   };
  ///   print('This is a test: ${test[['test']]}');
  ///   ```
  /// will output "This is a test: null". The [getByListKey] method will
  /// return the expected value.
  Map<String, int>? getByListKey(List<String> listKey) {
    Function equals = const ListEquality().equals;
    Map<String, int>? returnValue;

    forEach((key, value) {
      if (equals(key, listKey)) {
        returnValue = value;
      }
    });

    return returnValue;
  }
}
