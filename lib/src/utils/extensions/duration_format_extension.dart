/// Extension to format Duration to a string in the format 00h00m00s.
extension DurationFormatExtension on Duration {
  /// Converts the Duration to a formatted string.
  String toFormattedString() {
    /// Helper function to ensure numbers are two digits.
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    /// Format hours, minutes, and seconds.
    String hours = twoDigits(inHours);
    String minutes = twoDigits(inMinutes.remainder(60));
    String seconds = twoDigits(inSeconds.remainder(60));

    /// Return the formatted string without spaces.
    return '${hours}h${minutes}m${seconds}s';
  }
}
