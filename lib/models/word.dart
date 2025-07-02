/// Modelo para representar uma palavra no jogo
class Word {
  final String text;
  final String category;
  final String hint;
  final String language;
  
  const Word({
    required this.text,
    required this.category,
    this.hint = '',
    required this.language,
  });
  
  /// Converte a palavra para maiúscula e remove acentos para o jogo
  String get normalizedText => text.toUpperCase();
  
  /// Retorna as letras únicas da palavra
  Set<String> get uniqueLetters => normalizedText.split('').toSet();
  
  /// Verifica se a palavra contém uma letra específica
  bool containsLetter(String letter) {
    return normalizedText.contains(letter.toUpperCase());
  }
  
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'category': category,
      'hint': hint,
      'language': language,
    };
  }
  
  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      text: json['text'],
      category: json['category'],
      hint: json['hint'] ?? '',
      language: json['language'],
    );
  }
}

