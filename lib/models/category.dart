/// Modelo para representar uma categoria de palavras
class Category {
  final String id;
  final String name;
  final String icon;
  final String description;
  final List<String> words;
  
  const Category({
    required this.id,
    required this.name,
    required this.icon,
    this.description = '',
    required this.words,
  });
  
  /// Retorna o número de palavras na categoria
  int get wordCount => words.length;
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'description': description,
      'words': words,
    };
  }
  
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      description: json['description'] ?? '',
      words: List<String>.from(json['words']),
    );
  }
}

