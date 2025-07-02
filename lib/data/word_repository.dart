// lib/data/word_repository.dart

import 'dart:math';
import '../models/word.dart';
import '../models/category.dart';

class WordRepository {
  static const String _defaultLanguage = 'pt';

  static final Map<String, Map<String, List<String>>> _wordsData = {
    'pt': {
      'animals': [
        'GATO',
        'CACHORRO',
        'ELEFANTE',
        'LEÃO',
        'GIRAFA',
        'ZEBRA',
        'TIGRE',
        'URSO',
        'LOBO',
        'RAPOSA',
        'COELHO',
        'CAVALO',
        'VACA',
        'PORCO',
        'GALINHA',
        'PATO',
        'PEIXE',
        'TUBARÃO',
        'BALEIA',
        'GOLFINHO',
        'ÁGUIA',
        'PAPAGAIO',
        'CORUJA',
        'PINGUIM',
        'CANGURU',
        'KOALA',
        'MACACO',
        'CAMELO',
        'JACARÉ',
        'TARTARUGA',
        'SERPENTE',
        'ARANHA',
        'FORMIGA',
        'ABELHA',
        'BORBOLETA',
        'MORCEGO',
        'ESQUILO',
        'HAMSTER',
        'PAVÃO',
        'CISNE',
        'FLAMINGO',
        'TUCANO',
        'PELICANO',
        'LEOPARDO',
        'HIENA',
        'POLVO',
        'LULA',
        'FOCA',
        'VEADO',
        'SAPO',
        'VESPA',
        'GAIVOTA',
        'CORVO',
        'POMBO',
        'PANDA',
        'GUEPARDO',
        'SALMÃO',
        'CARPA',
        'SURICATO',
        'CAPIVARA'
      ],
      'fruits': [
        'MAÇÃ',
        'BANANA',
        'LARANJA',
        'UVA',
        'MORANGO',
        'ABACAXI',
        'MANGA',
        'PÊRA',
        'PÊSSEGO',
        'MELANCIA',
        'MELÃO',
        'KIWI',
        'LIMÃO',
        'CEREJA',
        'AMEIXA',
        'FIGO',
        'COCO',
        'MAMÃO',
        'GOIABA',
        'AÇAÍ',
        'CAJU',
        'PITANGA',
        'CUPUAÇU',
        'BACURI',
        'BURITI',
        'ABACATE',
        'ACEROLA',
        'GRAVIOLA',
        'LICHIA',
        'MARACUJÁ',
        'CARAMBOLA',
        'ROMÃ',
        'TAMARINDO',
        'FRAMBOESA',
        'AMORA',
        'MIRTILO',
        'TANGERINA',
        'JACA',
        'NECTARINA',
        'DAMASCO',
        'CAQUI',
        'LIMA',
        'PITAIA',
        'JAMBO',
        'SAPOTI',
        'SERIGUELA',
        'UMBU',
        'NONI',
        'CIRIGUELA'
      ],
      'objects': [
        'MESA',
        'CADEIRA',
        'TELEFONE',
        'LIVRO',
        'CANETA',
        'LÁPIS',
        'PAPEL',
        'FOGÃO',
        'CAMA',
        'SOFÁ',
        'ESPELHO',
        'RELÓGIO',
        'CHAVE',
        'PORTA',
        'JANELA',
        'CARRO',
        'BICICLETA',
        'ÓCULOS',
        'SAPATO',
        'CAMISA',
        'GARFO',
        'FACA',
        'PRATO',
        'COPO',
        'VASO',
        'BOLA',
        'PENTE',
        'ESCOVA',
        'SABONETE',
        'TOALHA',
        'LENÇOL',
        'CHINELO',
        'BONÉ',
        'CHAPÉU',
        'CINTO',
        'CARTEIRA',
        'MOEDA',
        'NOTA',
        'ANEL',
        'BRINCO',
        'COLAR',
        'PULSEIRA',
        'QUADRO',
        'ABAJUR',
        'VENTILADOR',
        'MARTELO',
        'PREGO',
        'SERROTE',
        'PARAFUSO',
        'CHAVE',
        'FITA',
        'CORDA'
      ],
      'professions': [
        'MÉDICO',
        'ARTISTA',
        'DENTISTA',
        'ADVOGADO',
        'POLICIAL',
        'BOMBEIRO',
        'PILOTO',
        'ATOR',
        'ESCRITOR',
        'ARQUITETO',
        'DESIGNER',
        'ATOR',
        'CANTOR',
        'DANÇARINO',
        'PINTOR',
        'SOLDADO',
        'MARINHEIRO',
        'JUIZ',
        'PROMOTOR',
        'REPORTER',
        'ÂNCORA',
        'LOCUTOR',
        'RADIALISTA',
        'ATOR',
        'ATRIZ',
        'DIRETOR',
        'PRODUTOR',
        'ROTEIRISTA',
        'EDITOR',
        'MODELO',
        'ESTILISTA',
        'COSTUREIRA',
        'CABELEIREIRO',
        'BARBEIRO',
        'MAQUIADOR',
        'MANICURE',
        'PEDICURE',
        'MASSAGISTA',
        'TERAPEUTA',
        'PSICÓLOGO',
        'PSIQUIATRA',
        'PADEIRO',
        'PASTOR',
        'SACERDOTE',
        'MONGE',
        'FREIRA'
      ],
      'verbs': [
        'CORRER',
        'PULAR',
        'NADAR',
        'VOAR',
        'DANÇAR',
        'CANTAR',
        'ESTUDAR',
        'DORMIR',
        'COMER',
        'BEBER',
        'ANDAR',
        'FALAR',
        'ESCUTAR',
        'VER',
        'PENSAR',
        'SENTIR',
        'AMAR',
        'SORRIR',
        'CHORAR',
        'ABRIR',
        'FECHAR',
        'COMEÇAR',
        'TERMINAR',
        'IR',
        'VIR',
        'FAZER',
        'DIZER',
        'SABER',
        'QUERER',
        'PODER',
        'DEVER',
        'LER',
        'ESCREVER',
        'JOGAR',
        'BRINCAR',
        'TRABALHAR',
        'DESCANSAR',
        'VIAJAR',
        'CONHECER',
        'AJUDAR',
        'ATRAPALHAR',
        'GANHAR',
        'PERDER',
        'COMPRAR',
        'VENDER',
        'PAGAR',
        'RECEBER',
        'DAR',
        'TIRAR',
        'COLOCAR',
        'PEGAR'
      ],
      'countries': [
        'BRASIL',
        'FRANÇA',
        'JAPÃO',
        'CANADÁ',
        'ALEMANHA',
        'ITÁLIA',
        'ESPANHA',
        'PORTUGAL',
        'ARGENTINA',
        'CHILE',
        'PERU',
        'MÉXICO',
        'CHINA',
        'ÍNDIA',
        'RÚSSIA',
        'EGITO',
        'MARROCOS',
        'SUÉCIA',
        'NORUEGA',
        'SUÍÇA',
        'BÉLGICA',
        'HOLANDA',
        'ÁUSTRIA',
        'GRÉCIA',
        'TURQUIA',
        'ISRAEL',
        'VIETNAME',
        'TAILÂNDIA',
        'IRLANDA',
        'POLÓNIA',
        'CUBA',
        'JAMAICA',
        'PANAMÁ',
        'COREIA',
        'GANA',
        'SENEGAL',
        'ANGOLA',
        'MOÇAMBIQUE',
        'NIGÉRIA',
        'QUÉNIA',
        'LÍBANO',
        'SÍRIA',
        'IRÃ',
        'IRAQUE',
        'MALÁSIA',
        'INDONÉSIA',
        'FILIPINAS'
      ]
    },
    'en': {
      'animals': [
        'CAT',
        'DOG',
        'LION',
        'TIGER',
        'BEAR',
        'WOLF',
        'FOX',
        'RABBIT',
        'HORSE',
        'COW',
        'PIG',
        'CHICKEN',
        'DUCK',
        'FISH',
        'SHARK',
        'WHALE',
        'EAGLE',
        'OWL',
        'PENGUIN',
        'KOALA',
        'MONKEY',
        'CAMEL',
        'SNAKE',
        'TURTLE',
        'SQUIRREL',
        'BAT'
      ],
      'fruits': [
        'APPLE',
        'BANANA',
        'ORANGE',
        'GRAPE',
        'MANGO',
        'PEAR',
        'PEACH',
        'MELON',
        'KIWI',
        'LEMON',
        'CHERRY',
        'PLUM',
        'FIG',
        'COCONUT',
        'PAPAYA',
        'GUAVA',
        'LIME',
        'APRICOT'
      ],
      'objects': [
        'TABLE',
        'CHAIR',
        'PHONE',
        'BOOK',
        'PEN',
        'PENCIL',
        'PAPER',
        'STOVE',
        'BED',
        'SOFA',
        'MIRROR',
        'CLOCK',
        'KEY',
        'DOOR',
        'WINDOW',
        'CAR',
        'SHOE',
        'SHIRT'
      ],
      'professions': [
        'DOCTOR',
        'TEACHER',
        'ARTIST',
        'CHEF',
        'LAWYER',
        'POLICE',
        'NURSE',
        'PILOT',
        'DRIVER',
        'ACTOR',
        'WRITER',
        'DESIGNER'
      ],
      'verbs': [
        'RUN',
        'JUMP',
        'SWIM',
        'FLY',
        'DANCE',
        'SING',
        'STUDY',
        'WORK',
        'SLEEP',
        'EAT',
        'DRINK',
        'WALK',
        'TALK',
        'SEE',
        'THINK',
        'FEEL',
        'LOVE',
        'SMILE',
        'CRY'
      ],
      'countries': [
        'BRAZIL',
        'FRANCE',
        'JAPAN',
        'CANADA',
        'GERMANY',
        'ITALY',
        'SPAIN',
        'PORTUGAL',
        'ARGENTINA',
        'MEXICO',
        'CHINA',
        'INDIA',
        'RUSSIA',
        'EGYPT',
        'SWEDEN',
        'NORWAY',
        'GREECE',
        'TURKEY',
        'IRELAND'
      ]
    },
    'es': {
      'animals': [
        'GATO',
        'PERRO',
        'LEÓN',
        'TIGRE',
        'OSO',
        'LOBO',
        'ZORRO',
        'CONEJO',
        'CABALLO',
        'VACA',
        'CERDO',
        'POLLO',
        'PATO',
        'PEZ',
        'TIBURÓN',
        'BALLENA',
        'ÁGUILA',
        'LORO',
        'BÚHO',
        'PINGÜINO',
        'CANGURO',
        'KOALA',
        'MONO',
        'CAMELLO',
        'COCODRILO',
        'SERPIENTE',
        'TORTUGA',
        'ARDILLA'
      ],
      'fruits': [
        'MANZANA',
        'PLÁTANO',
        'NARANJA',
        'UVA',
        'FRESA',
        'PIÑA',
        'MANGO',
        'PERA',
        'SANDÍA',
        'MELÓN',
        'KIWI',
        'LIMÓN',
        'CEREZA',
        'CIRUELA',
        'HIGO',
        'COCO',
        'PAPAYA',
        'GUAYABA',
        'ARÁNDANO',
        'LIMA',
        'GRANADA'
      ],
      'objects': [
        'MESA',
        'SILLA',
        'TELÉFONO',
        'LIBRO',
        'LÁPIZ',
        'PAPEL',
        'ESTUFA',
        'CAMA',
        'SOFÁ',
        'ARMARIO',
        'ESPEJO',
        'RELOJ',
        'LLAVE',
        'PUERTA',
        'VENTANA',
        'COCHE',
        'GAFAS',
        'ZAPATO',
        'CAMISA'
      ],
      'professions': [
        'MÉDICO',
        'MAESTRO',
        'ARTISTA',
        'COCINERO',
        'DENTISTA',
        'ABOGADO',
        'POLICÍA',
        'BOMBERO',
        'ENFERMERO',
        'VETERINARIO',
        'PILOTO',
        'CONDUCTOR',
        'PERIODISTA',
        'MÚSICO',
        'ACTOR',
        'ESCRITOR',
        'DISEÑADOR'
      ],
      'verbs': [
        'CORRER',
        'SALTAR',
        'NADAR',
        'VOLAR',
        'BAILAR',
        'CANTAR',
        'ESTUDIAR',
        'TRABAJAR',
        'DORMIR',
        'COMER',
        'BEBER',
        'CAMINAR',
        'HABLAR',
        'ESCUCHAR',
        'VER',
        'PENSAR',
        'SENTIR',
        'AMAR',
        'SONREÍR',
        'LLORAR'
      ],
      'countries': [
        'BRASIL',
        'FRANCIA',
        'JAPÓN',
        'CANADÁ',
        'ALEMANIA',
        'ITALIA',
        'ESPAÑA',
        'PORTUGAL',
        'ARGENTina',
        'CHILE',
        'PERÚ',
        'MÉXICO',
        'CHINA',
        'INDIA',
        'RUSIA',
        'EGIPTO',
        'MARRUECOS',
        'SUECIA',
        'SUIZA',
        'GRECIA',
        'TURQUÍA'
      ]
    },
  };

  static final Map<String, Map<String, Category>> _categoriesData = {
    'pt': {
      'animals': Category(
          id: 'animals',
          name: 'Animais',
          icon: '🐾',
          description: 'Feras do mundo todo',
          words: _wordsData['pt']!['animals']!),
      'fruits': Category(
          id: 'fruits',
          name: 'Frutas',
          icon: '🍎',
          description: 'Sabor e doçura',
          words: _wordsData['pt']!['fruits']!),
      'objects': Category(
          id: 'objects',
          name: 'Objetos',
          icon: '🔧',
          description: 'Coisas do dia a dia',
          words: _wordsData['pt']!['objects']!),
      'professions': Category(
          id: 'professions',
          name: 'Profissões',
          icon: '👨‍💼',
          description: 'Diferentes ocupações',
          words: _wordsData['pt']!['professions']!),
      'verbs': Category(
          id: 'verbs',
          name: 'Verbos',
          icon: '🏃',
          description: 'Ações e movimentos',
          words: _wordsData['pt']!['verbs']!),
      'countries': Category(
          id: 'countries',
          name: 'Países',
          icon: '🌍',
          description: 'Nações do planeta',
          words: _wordsData['pt']!['countries']!),
    },
    'en': {
      'animals': Category(
          id: 'animals',
          name: 'Animals',
          icon: '🐾',
          description: 'Animals from around the world',
          words: _wordsData['en']!['animals']!),
      'fruits': Category(
          id: 'fruits',
          name: 'Fruits',
          icon: '🍎',
          description: 'Delicious fruits',
          words: _wordsData['en']!['fruits']!),
      'objects': Category(
          id: 'objects',
          name: 'Objects',
          icon: '🔧',
          description: 'Everyday objects',
          words: _wordsData['en']!['objects']!),
      'professions': Category(
          id: 'professions',
          name: 'Professions',
          icon: '👨‍💼',
          description: 'Different professions',
          words: _wordsData['en']!['professions']!),
      'verbs': Category(
          id: 'verbs',
          name: 'Verbs',
          icon: '🏃',
          description: 'Actions and verbs',
          words: _wordsData['en']!['verbs']!),
      'countries': Category(
          id: 'countries',
          name: 'Countries',
          icon: '🌍',
          description: 'Countries of the world',
          words: _wordsData['en']!['countries']!),
    },
    'es': {
      'animals': Category(
          id: 'animals',
          name: 'Animales',
          icon: '🐾',
          description: 'Animales de todo el mundo',
          words: _wordsData['es']!['animals']!),
      'fruits': Category(
          id: 'fruits',
          name: 'Frutas',
          icon: '🍎',
          description: 'Frutas deliciosas',
          words: _wordsData['es']!['fruits']!),
      'objects': Category(
          id: 'objects',
          name: 'Objetos',
          icon: '🔧',
          description: 'Objetos cotidianos',
          words: _wordsData['es']!['objects']!),
      'professions': Category(
          id: 'professions',
          name: 'Profesiones',
          icon: '👨‍💼',
          description: 'Diferentes profesiones',
          words: _wordsData['es']!['professions']!),
      'verbs': Category(
          id: 'verbs',
          name: 'Verbos',
          icon: '🏃',
          description: 'Acciones y verbos',
          words: _wordsData['es']!['verbs']!),
      'countries': Category(
          id: 'countries',
          name: 'Países',
          icon: '🌍',
          description: 'Países del mundo',
          words: _wordsData['es']!['countries']!),
    },
  };

  static List<Category> getCategories({String language = _defaultLanguage}) {
    final categoriesMap =
        _categoriesData[language] ?? _categoriesData[_defaultLanguage]!;
    final categories = categoriesMap.values.toList();
    categories.add(Category(
        id: 'random',
        name: 'Aleatório',
        icon: '🎲',
        description: 'Um desafio surpresa!',
        words: []));
    return categories;
  }

  static Category? getCategory(String categoryId,
      {String language = _defaultLanguage}) {
    final categories = _categoriesData[language];
    if (categories == null) {
      return getCategory(categoryId, language: _defaultLanguage);
    }
    return categories[categoryId];
  }

  static List<Word> getWordsFromCategory(String categoryId,
      {String language = _defaultLanguage}) {
    final langData = _wordsData[language] ?? _wordsData[_defaultLanguage]!;

    // CORRIGIDO: Lógica para a categoria "Aleatório"
    if (categoryId == 'random') {
      final List<Word> allWords = [];
      // Itera sobre cada categoria e suas palavras
      langData.forEach((originalCategoryId, wordList) {
        // Para cada palavra, cria um objeto Word com sua categoria original
        for (var wordText in wordList) {
          allWords.add(Word(
              text: wordText,
              category: originalCategoryId, // Preserva a categoria de origem
              language: language));
        }
      });
      return allWords;
    }

    final words = langData[categoryId];
    if (words == null) {
      return [];
    }

    return words
        .map((word) =>
            Word(text: word, category: categoryId, language: language))
        .toList();
  }

  static Word? getRandomWordFromCategory(String categoryId,
      {String language = _defaultLanguage}) {
    final words = getWordsFromCategory(categoryId, language: language);
    if (words.isEmpty) return null;

    final random = Random().nextInt(words.length);
    return words[random];
  }

  static bool isLanguageSupported(String language) {
    return _wordsData.containsKey(language);
  }

  static List<String> getSupportedLanguages() {
    return _wordsData.keys.toList();
  }

  static Map<String, dynamic> getCategoryStats(String categoryId,
      {String language = _defaultLanguage}) {
    final words = getWordsFromCategory(categoryId, language: language);

    if (words.isEmpty) {
      return {
        'totalWords': 0,
        'averageLength': 0.0,
        'shortestWord': '',
        'longestWord': '',
        'uniqueLetters': 0,
      };
    }

    final lengths = words.map((w) => w.text.length).toList();
    final allLetters = words.expand((w) => w.uniqueLetters).toSet();

    return {
      'totalWords': words.length,
      'averageLength': lengths.reduce((a, b) => a + b) / lengths.length,
      'shortestWord':
          words.reduce((a, b) => a.text.length < b.text.length ? a : b).text,
      'longestWord':
          words.reduce((a, b) => a.text.length > b.text.length ? a : b).text,
      'uniqueLetters': allLetters.length,
    };
  }

  static void addWordToCategory(String categoryId, String word,
      {String language = _defaultLanguage}) {
    if (!_wordsData.containsKey(language)) _wordsData[language] = {};
    if (!_wordsData[language]!.containsKey(categoryId))
      _wordsData[language]![categoryId] = [];
    if (!_wordsData[language]![categoryId]!.contains(word.toUpperCase())) {
      _wordsData[language]![categoryId]!.add(word.toUpperCase());
    }
  }

  static void removeWordFromCategory(String categoryId, String word,
      {String language = _defaultLanguage}) {
    _wordsData[language]?[categoryId]?.remove(word.toUpperCase());
  }
}
