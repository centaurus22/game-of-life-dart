class Color {
  static final background = [
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

  static int get numberBackgroundColors => background.length;

  static double charsPerColor(int sumChars) {
    if (sumChars <= numberBackgroundColors) {
      return 1;
    }
    return sumChars / numberBackgroundColors;
  }

  static int colorBackground({
    required double charsPerColor,
    required int position,
  }) {
    return background[(position / charsPerColor).floor()];
  }
}
