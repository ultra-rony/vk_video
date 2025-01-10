extension TimeRoundingExtension on num? {
  /// Rounds the number safely.
  /// If the number is null, it defaults to 0 before rounding.
  int roundOrDefault() {
    /// Use the null-aware operator to return 0 if the number is null,
    /// and then round it to the nearest integer.
    return (this ?? 0).round();
  }
}
