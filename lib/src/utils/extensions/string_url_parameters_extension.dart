/// TODO
extension StringUrlParameters on String {
  /// This method parses the string as a URL and returns a map of URL parameters.
  Map<String, String> getUrlParameters() {
    /// Try to parse the string as a Uri
    Uri? uri;

    try {
      /// Parse the string to Uri
      uri = Uri.parse(this);
    } catch (e) {
      /// Return an empty map if parse fails
      return {};
    }

    /// Return the query parameters as a map
    /// Uri's queryParameters returns a map of parameters
    return uri.queryParameters;
  }

  /// This method retrieves the value of a specific URL parameter by its name.
  String? getUrlParameter(String name) {
    /// Parse the string as a Uri
    Uri? uri;

    try {
      /// Attempt to parse the string into a Uri
      uri = Uri.parse(this);
    } catch (e) {
      /// Return null if parsing fails
      return null;
    }

    /// Return the value of the specified parameter, or null if it doesn't exist
    return uri.queryParameters[name];
  }
}
