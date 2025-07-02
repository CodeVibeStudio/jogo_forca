# WordRope - Jogo da Forca Moderno

<div align="center">
  <img src="assets/images/hangman_0.png" alt="WordRope Logo" width="200"/>
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.24.5-blue.svg)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-3.5.4-blue.svg)](https://dart.dev/)
  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
  [![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey.svg)](https://flutter.dev/)
</div>

## 📖 Sobre o Projeto

WordRope é um jogo da forca moderno e educativo desenvolvido em Flutter, oferecendo uma experiência multiplataforma completa com suporte a 10 idiomas, interface minimalista e centenas de palavras organizadas por categorias.

### ✨ Características Principais

- 🌍 **10 Idiomas Suportados**: Português (BR/PT), Inglês, Espanhol, Francês, Alemão, Italiano, Árabe, Japonês, Chinês, Russo
- 📱 **Multiplataforma**: Android, iOS e Web
- 🎨 **Design Moderno**: Interface minimalista com paleta roxa suave
- 🔊 **Sistema de Áudio**: Sons de feedback e efeitos sonoros
- 📚 **6 Categorias**: Animais, Frutas, Objetos, Profissões, Verbos, Países
- 🌐 **Funciona Offline**: Jogo completo sem necessidade de internet
- ♿ **Acessível**: Suporte a leitura por voz e controles de acessibilidade
- 🎯 **Educativo**: Ideal para aprender vocabulário e novos idiomas

## 🚀 Começando

### Pré-requisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versão 3.24.5 ou superior)
- [Dart SDK](https://dart.dev/get-dart) (versão 3.5.4 ou superior)
- Android Studio / VS Code com extensões Flutter
- Para iOS: Xcode (apenas macOS)

### Instalação

1. **Clone o repositório**
   ```bash
   git clone https://github.com/wordrope/wordrope.git
   cd wordrope
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Execute o projeto**
   ```bash
   # Para desenvolvimento
   flutter run
   
   # Para web
   flutter run -d chrome
   
   # Para dispositivo específico
   flutter devices
   flutter run -d <device_id>
   ```

### Build para Produção

```bash
# Android (APK)
flutter build apk --release

# Android (App Bundle)
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 📁 Estrutura do Projeto

```
wordrope/
├── lib/
│   ├── data/                 # Repositórios de dados
│   │   └── word_repository.dart
│   ├── localization/         # Arquivos de tradução (.arb)
│   │   ├── app_pt.arb
│   │   ├── app_en.arb
│   │   └── ...
│   ├── models/              # Modelos de dados
│   │   ├── category.dart
│   │   ├── game_state.dart
│   │   └── word.dart
│   ├── pages/               # Telas do aplicativo
│   │   ├── game_page.dart
│   │   └── home_page.dart
│   ├── services/            # Serviços e lógica de negócio
│   │   ├── audio_service.dart
│   │   └── game_service.dart
│   ├── utils/               # Utilitários e constantes
│   │   └── app_theme.dart
│   ├── widgets/             # Componentes reutilizáveis
│   │   ├── category_card.dart
│   │   ├── game_result_dialog.dart
│   │   ├── hangman_drawing.dart
│   │   ├── virtual_keyboard.dart
│   │   └── word_display.dart
│   └── main.dart           # Ponto de entrada
├── assets/
│   ├── images/             # Imagens do jogo
│   └── sounds/             # Arquivos de áudio
├── docs/                   # Documentação
├── test/                   # Testes unitários
└── pubspec.yaml           # Dependências e configurações
```

## 🎮 Como Jogar

1. **Escolha uma Categoria**: Selecione entre Animais, Frutas, Objetos, Profissões, Verbos ou Países
2. **Adivinhe as Letras**: Toque nas letras do teclado virtual para fazer suas tentativas
3. **Complete a Palavra**: Descubra a palavra antes de cometer 6 erros
4. **Ganhe Pontos**: Acerte palavras para melhorar suas estatísticas

## 🌍 Idiomas Suportados

| Idioma | Código | Status | Palavras |
|--------|--------|--------|----------|
| Português (Brasil) | pt | ✅ Completo | 500+ |
| Inglês | en | ✅ Completo | 500+ |
| Espanhol | es | ✅ Completo | 500+ |
| Francês | fr | 🔄 Em desenvolvimento | 300+ |
| Alemão | de | 🔄 Em desenvolvimento | 300+ |
| Italiano | it | 🔄 Em desenvolvimento | 300+ |
| Árabe | ar | 🔄 Em desenvolvimento | 200+ |
| Japonês | ja | 🔄 Em desenvolvimento | 200+ |
| Chinês (Simplificado) | zh | 🔄 Em desenvolvimento | 200+ |
| Russo | ru | 🔄 Em desenvolvimento | 200+ |

## 🛠️ Tecnologias Utilizadas

### Framework e Linguagem
- **Flutter**: Framework de desenvolvimento multiplataforma
- **Dart**: Linguagem de programação

### Dependências Principais
- **provider**: Gerenciamento de estado
- **flutter_localizations**: Internacionalização
- **google_fonts**: Tipografia moderna
- **audioplayers**: Sistema de áudio
- **shared_preferences**: Armazenamento local

### Ferramentas de Desenvolvimento
- **flutter_lints**: Análise de código
- **flutter_test**: Testes unitários

## 📱 Plataformas Suportadas

### Android
- **Versão mínima**: Android 5.0 (API 21)
- **Versão alvo**: Android 14 (API 34)
- **Arquiteturas**: arm64-v8a, armeabi-v7a, x86_64

### iOS
- **Versão mínima**: iOS 12.0
- **Dispositivos**: iPhone, iPad
- **Arquiteturas**: arm64, x86_64 (simulador)

### Web
- **Navegadores**: Chrome, Firefox, Safari, Edge
- **Recursos**: PWA (Progressive Web App)
- **Responsivo**: Desktop, tablet, mobile

## 🎨 Design System

### Paleta de Cores
```dart
// Cores principais
Primary: #8B5CF6 (Purple 500)
Secondary: #A78BFA (Purple 400)
Background: #F8FAFC (Slate 50)
Surface: #FFFFFF (White)
Error: #EF4444 (Red 500)
Success: #10B981 (Emerald 500)
```

### Tipografia
- **Fonte principal**: Google Fonts (Poppins)
- **Tamanhos**: 12px, 14px, 16px, 18px, 24px, 32px
- **Pesos**: Light (300), Regular (400), Bold (700)

## 🔊 Sistema de Áudio

O WordRope inclui um sistema completo de feedback sonoro:

- **Som de acerto**: Feedback positivo para letras corretas
- **Som de erro**: Feedback neutro para letras incorretas
- **Som de vitória**: Celebração ao completar a palavra
- **Som de derrota**: Feedback ao perder o jogo
- **Som de clique**: Feedback tátil para botões

### Configuração de Áudio
```dart
// Habilitar/desabilitar sons
AudioService().setSoundEnabled(true);

// Reproduzir sons específicos
AudioService().playCorrectSound();
AudioService().playWrongSound();
AudioService().playVictorySound();
AudioService().playDefeatSound();
```

## 🧪 Testes

### Executar Testes
```bash
# Todos os testes
flutter test

# Testes específicos
flutter test test/models/
flutter test test/services/
flutter test test/widgets/
```

### Cobertura de Testes
```bash
# Gerar relatório de cobertura
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 📈 Performance

### Métricas de Performance
- **Tempo de inicialização**: <2 segundos
- **Uso de memória**: <100MB
- **Tamanho do APK**: ~15MB
- **Tamanho do IPA**: ~20MB
- **Bundle web**: ~2MB (gzipped)

### Otimizações Implementadas
- Tree-shaking de ícones
- Compressão de imagens
- Lazy loading de recursos
- Cache de fontes
- Minificação de código

## 🚀 Publicação

### Lojas de Aplicativos
- **Google Play Store**: [Em breve]
- **Apple App Store**: [Em breve]
- **Web**: [wordrope.com](https://wordrope.com)

### Versioning
O projeto segue [Semantic Versioning](https://semver.org/):
- **MAJOR**: Mudanças incompatíveis
- **MINOR**: Novas funcionalidades compatíveis
- **PATCH**: Correções de bugs

## 🤝 Contribuindo

Contribuições são bem-vindas! Por favor, leia nosso [Guia de Contribuição](CONTRIBUTING.md) antes de submeter pull requests.

### Como Contribuir
1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 👥 Equipe

- **Desenvolvedor Principal**: [Seu Nome]
- **Design**: [Nome do Designer]
- **Tradução**: [Equipe de Tradução]

## 📞 Contato

- **Email**: contato@wordrope.com
- **Website**: [wordrope.com](https://wordrope.com)
- **GitHub**: [github.com/wordrope/wordrope](https://github.com/wordrope/wordrope)

## 🙏 Agradecimentos

- [Flutter Team](https://flutter.dev/) pelo framework incrível
- [Google Fonts](https://fonts.google.com/) pelas fontes gratuitas
- [Material Design](https://material.io/) pelas diretrizes de design
- Comunidade Flutter pelo suporte e recursos

---

<div align="center">
  <p>Feito com ❤️ usando Flutter</p>
  <p>© 2024 WordRope. Todos os direitos reservados.</p>
</div>

