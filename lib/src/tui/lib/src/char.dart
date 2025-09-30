enum Char {
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
