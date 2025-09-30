/// Providing chars for boxes, background and cells
enum Char {
  /// The named symbols
  background('⣿'),

  mainHBorder('═'),
  mainVBorder('║'),
  mainULCorner('╔'),
  mainURCorner('╗'),
  mainLLCorner('╚'),
  mainLRCorner('╝'),

  secondaryHBorder('─'),
  secondaryVBorder('│'),
  secondaryULCorner('┌'),
  secondaryURCorner('┐'),
  secondaryLLCorner('└'),
  secondaryLRCorner('┘'),
  secondaryLLRoundCorner('╰'),
  secondaryLRRoundCorner('╯'),

  downSingleHorizontalDouble('╤'),
  downDoubleHorizontalDouble('╦'),
  upDoubleHorizontalSingle('╨');

  final String symbol;

  const Char(this.symbol);

  /// Returns a unicode symbol for a number
  ///
  /// @return The unicode symbol
  ///
  /// The number represents a combination of dead and living cells on a 2x3 grid.
  /// It is calculated by using the grid as a binary number by reading from right
  /// to left and bottom to top.
  /// This binary number ist then converted to a decimal number which functions
  /// as the input for this method.
  ///
  /// Example: If the cell in the upper left and in the right center is alive it
  /// represents the binary number 001001. This is converted to the decimal number 9.
  ///
  static String grid(int number) {
    final grid = [
      ' ',
      '🬀',
      '🬁',
      '🬂',
      '🬃',
      '🬄',
      '🬅',
      '🬆',
      '🬇',
      '🬈',
      '🬉',
      '🬊',
      '🬋',
      '🬌',
      '🬍',
      '🬎',
      '🬏', //15
      '🬐',
      '🬑',
      '🬒',
      '🬓',
      '▌',
      '🬔',
      '🬕',
      '🬖',
      '🬗',
      '🬘',
      '🬙',
      '🬚',
      '🬛',
      '🬜',
      '🬝', //31
      '🬞',
      '🬟',
      '🬠',
      '🬡',
      '🬢',
      '🬣',
      '🬤',
      '🬥',
      '🬦',
      '🬧',
      '▐',
      '🬨',
      '🬩',
      '🬪',
      '🬫',
      '🬬', //47
      '🬭',
      '🬮',
      '🬯',
      '🬰',
      '🬱',
      '🬲',
      '🬳',
      '🬴',
      '🬵',
      '🬶',
      '🬷',
      '🬸',
      '🬹',
      '🬺',
      '🬻',
      '█', //63
    ];
    return grid[number];
  }
}
