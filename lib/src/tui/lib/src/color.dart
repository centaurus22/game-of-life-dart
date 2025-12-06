/// Default color numbers for 8-bit colors (256 colors).
enum Color {
  /// Named colors
  box(82),
  cell(20);

  final int number;

  const Color(this.number);

  /// This numbers represent the colors of a rainbow in 256 colors (8 bit)
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

  /// The amount of colors which are used to draw a rainbow colored background.
  static int get numberBackgroundColors => background().length;
}
