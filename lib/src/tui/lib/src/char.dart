class Char {
  final mainBox = {
    'hBorder': '═',
    'vBorder': '║',
    'uLCorner': '╔',
    'uRCorner': '╗',
    'lLCorner': '╚',
    'lrCorner': '╝',
  };

  final secondaryBox = {
    'hBorder': '─',
    'vBorder': '│',
    'uLCorner': '┌',
    'uRCorner': '┐',
    'lLCorner': '└',
    'lRCorner': '┘',
    'lLRoundCorner': '╰',
    'lRRoundCorner': '╯'
  };

  final boxConnector = {
    'downSingleHorizontalDouble': '╤',
    'downDoubleHorizontalDouble': '╦',
    'upDoubleHorizontalSingle': '╨'
  };

  static final backGround = '⣿';

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

  static String colorCode(int color) {
    return "\u001b[38;5;${color}m";
  }
}
