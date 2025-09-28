/// Providing color numbers to display 8-bit colors
enum Color {
  box(82),
  cell(20);

  final int num;

  const Color(this.num);

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

  static int get numberBackgroundColors => background().length;
}
