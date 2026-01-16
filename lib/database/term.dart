class Term {
  Term({
    required this.id,
    required this.lexeme,
    required this.phonetics,
    this.soundFile,
  });

  final int id;
  final String lexeme;
  final String phonetics;
  final String? soundFile;
}
