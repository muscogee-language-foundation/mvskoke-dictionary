class Term {
  Term({
    required this.id,
    required this.word,
    required this.definition,
    required this.phonetics,
    this.soundFile,
  });

  final String id;
  final String word;
  final String definition;
  final String phonetics;
  final String? soundFile;

  factory Term.fromJson(Map<String, dynamic> json) {
    return Term(
      id: json['entryID'],
      word: json['word'],
      definition: json['definition'],
      phonetics: '',
      soundFile: '',
    );
  }
}
