enum Char {
  backGround('⣿'),

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

  final String symbol;

  const Char(this.symbol);

  static String colorCode(int color) {
    return "\u001b[38;5;${color}m";
  }
}
