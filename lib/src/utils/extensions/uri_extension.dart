extension UriExtension on String {
  /// Parses the string as a Uri and retrieves the query parameters.
  ///
  /// Returns a Map<String, String> of query parameters or
  /// an empty map if there are no parameters in the URL.
  Map<String, String> getQueryParameters() {
    // Parse the string into a Uri object
    Uri uri = Uri.parse(this);

    // Return the query parameters as a map
    return uri.queryParameters;
  }

  /// Parses the string as a Uri and retrieves all query parameters.
  ///
  /// This method returns a Map<String, List<String>> to handle cases
  /// where a parameter might have multiple values.
  Map<String, List<String>> getAllQueryParameters() {
    // Parse the string into a Uri object
    Uri uri = Uri.parse(this);

    // Return all query parameters as a map of lists
    return uri.queryParametersAll;
  }
}