/// Providing color numbers to use 8-bit colors
enum Color {
  /// the named colors
  box(82),
  cell(20);

  final int number;

  const Color(this.number);

  /// This numbers represent the colors of a rainbow in 256 colors (8 bit)
  ///
  /// The rainbow colors are used for the background of the application.
  static List<int> background() {
    return [
      196,
      202,
      208,
      214,
      220,
      226,
      190,
      154,
      118,
      82,
      46,
      47,
      48,
      49,
      50,
      51,
      45,
      39,
      33,
      27,
      21,
      57,
      93,
      129,
      165,
      201,
      200,
      199,
      198,
      197,
    ];
  }

  /// The number of rainbow colors
  static int get numberBackgroundColors => background().length;
}
