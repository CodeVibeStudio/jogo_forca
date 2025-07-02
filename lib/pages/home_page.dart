import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/theme_service.dart';
import '../utils/app_theme.dart';
import '../widgets/category_card.dart';
import '../models/category.dart';
import '../services/game_service.dart';
import 'game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _soundButtonKey = GlobalKey();
  final _themeButtonKey = GlobalKey();
  final _faqButtonKey = GlobalKey();
  final _categoryKey = GlobalKey();
  final _scoreKey = GlobalKey();

  final List<String> _motivationalMessages = [
    "Conheça seu inimigo e conheça a si mesmo, e vencerá cem batalhas. Sun Tzu",
    "A maior vitória é aquela que não exige luta. Sun Tzu",
    "A estratégia sem tática é o caminho mais lento para a vitória. Sun Tzu",
    "O líder sábio planeja no silêncio e age na tempestade. Sun Tzu",
    "A força não está no ataque, mas na defesa impenetrável. Sun Tzu",
    "Adapte-se ao terreno, e o terreno lutará por você. Sun Tzu",
    "A confusão do inimigo é a sua maior arma. Sun Tzu",
    "A paciência transforma o impossível em inevitável. Sun Tzu",
    "Quem avança sem recuar perece; quem recua sem avançar sobrevive. Sun Tzu",
    "O verdadeiro guerreiro vence antes de lutar. Sun Tzu",
    "O caos é apenas uma oportunidade disfarçada. Sun Tzu",
    "A disciplina é a ponte entre o plano e a vitória. Sun Tzu",
    "Não ataque a força, explore a fraqueza. Sun Tzu",
    "O segredo da vitória está em prever o imprevisível. Sun Tzu",
    "A guerra é ganha na mente antes de ser travada no campo. Sun Tzu",
    "Um líder fraco teme o fracasso; um líder forte o usa. Sun Tzu",
    "A velocidade surpreende, mas a preparação vence. Sun Tzu",
    "A ilusão é mais poderosa que a espada. Sun Tzu",
    "O terreno molda a batalha, mas a mente molda o destino. Sun Tzu",
    "Quem domina o tempo domina o resultado. Sun Tzu",
    "A fraqueza do inimigo é a sua força oculta. Sun Tzu",
    "A vitória pertence a quem sabe esperar. Sun Tzu",
    "Um exército unido é mais forte que mil guerreiros solitários. Sun Tzu",
    "O medo é uma arma que corta quem a empunha. Sun Tzu",
    "O plano perfeito é aquele que o inimigo nunca vê. Sun Tzu",
    "A verdadeira força está em saber quando não lutar. Sun Tzu",
    "A batalha perdida ensina mais que a vitória fácil. Sun Tzu",
    "O general sábio faz o inimigo lutar em seus termos. Sun Tzu",
    "A informação é o escudo que protege o futuro. Sun Tzu",
    "A guerra é um jogo de paciência e precisão. Sun Tzu",
    "Quem não planeja, já planejou a derrota. Sun Tzu",
    "A força bruta cede ao intelecto afiado. Sun Tzu",
    "A vitória começa onde o medo termina. Sun Tzu",
    "O terreno é seu aliado se você o compreender. Sun Tzu",
    "A desordem do inimigo é o seu momento de atacar. Sun Tzu",
    "O líder sábio inspira sem forçar. Sun Tzu",
    "A batalha é ganha na preparação, não na luta. Sun Tzu",
    "O silêncio é a arma dos sábios. Sun Tzu",
    "A fraqueza aparente pode ser a maior fortaleza. Sun Tzu",
    "O caminho da vitória é tortuoso, mas claro para quem o vê. Sun Tzu",
    "O verdadeiro poder está em controlar sem ser visto. Sun Tzu",
    "A guerra é uma dança de equilíbrio e ousadia. Sun Tzu",
    "A mente calma vence o coração agitado. Sun Tzu",
    "O inimigo mais perigoso é aquele que você subestima. Sun Tzu",
    "A vitória não é o fim, mas o começo de um novo plano. Sun Tzu",
    "O líder forte adapta-se; o fraco resiste. Sun Tzu",
    "A batalha mais difícil é contra a própria impaciência. Sun Tzu",
    "A força do exército está na unidade, não no número. Sun Tzu",
    "O sábio vence com a mente, não com a força. Sun Tzu",
    "A guerra é um espelho da alma do estrategista. Sun Tzu",
    "O terreno muda, mas a estratégia permanece. Sun Tzu",
    "Quem domina o fluxo da batalha controla o destino. Sun Tzu",
    "A vitória é filha da preparação e da oportunidade. Sun Tzu",
    "O líder sábio faz do inimigo seu aliado. Sun Tzu",
    "A paciência é a armadura do estrategista. Sun Tzu",
    "O fracasso é apenas um mestre disfarçado. Sun Tzu",
    "O verdadeiro guerreiro sabe quando recuar. Sun Tzu",
    "A força está em conhecer o momento certo. Sun Tzu",
    "A batalha mais importante é contra suas dúvidas. Sun Tzu",
    "O sábio transforma fraqueza em oportunidade. Sun Tzu",
    "A guerra é ganha com olhos abertos e coração firme. Sun Tzu",
    "O líder que não escuta, já perdeu. Sun Tzu",
    "A vitória é o eco de um plano bem executado. Sun Tzu",
    "O inimigo mais forte é aquele que você cria. Sun Tzu",
    "A estratégia é a arte de vencer sem lutar. Sun Tzu",
    "O sábio vê o campo antes de entrar na batalha. Sun Tzu",
    "A força está na união, a fraqueza na divisão. Sun Tzu",
    "O tempo é o aliado do estrategista paciente. Sun Tzu",
    "A vitória não é o objetivo, mas o caminho. Sun Tzu",
    "O líder sábio faz da derrota uma lição. Sun Tzu",
    "A guerra é uma escola de humildade e astúcia. Sun Tzu",
    "O verdadeiro poder está em prever o próximo passo. Sun Tzu",
    "A batalha é ganha antes do primeiro golpe. Sun Tzu",
    "O sábio usa o erro do inimigo como sua arma. Sun Tzu",
    "A força não está na multidão, mas na estratégia. Sun Tzu",
    "O líder forte guia sem impor. Sun Tzu",
    "A vitória é o fruto da mente preparada. Sun Tzu",
    "O caos é o palco do estrategista habilidoso. Sun Tzu",
    "A guerra é um teste de paciência e visão. Sun Tzu",
    "O sábio vence o inimigo sem derramar sangue. Sun Tzu",
    "A estratégia é o mapa, a ação é o caminho. Sun Tzu",
    "O líder sábio faz do fracasso um degrau. Sun Tzu",
    "A batalha é decidida na mente do estrategista. Sun Tzu",
    "O tempo revela o plano do sábio. Sun Tzu",
    "A vitória pertence a quem domina o inesperado. Sun Tzu",
    "O líder forte é aquele que aprende com o erro. Sun Tzu",
    "A guerra é um jogo de sombras e luzes. Sun Tzu",
    "O sábio transforma o obstáculo em vantagem. Sun Tzu",
    "A vitória é o silêncio após a tempestade. Sun Tzu",
    "O líder sábio faz do inimigo seu professor. Sun Tzu",
    "A estratégia é a arte de vencer sem esforço. Sun Tzu",
    "O terreno é o aliado do estrategista atento. Sun Tzu",
    "A batalha é ganha na mente antes do campo. Sun Tzu",
    "O sábio usa a força do inimigo contra ele. Sun Tzu",
    "A vitória é o prêmio da paciência estratégica. Sun Tzu",
    "O líder forte é aquele que planeja no silêncio. Sun Tzu",
    "A guerra é uma dança de equilíbrio e coragem. Sun Tzu",
    "O sábio transforma o caos em oportunidade. Sun Tzu",
    "A vitória é o reflexo de um plano perfeito. Sun Tzu",
    "O líder sábio vence antes de lutar. Sun Tzu",
    "É melhor ser temido que amado, se não puder ser ambos. Nicolau Maquiavel",
    "O poder é mantido por quem entende a natureza humana. Nicolau Maquiavel",
    "A oportunidade favorece o audacioso, mas pune o imprudente. Nicolau Maquiavel",
    "O governante sábio nunca confia apenas na sorte. Nicolau Maquiavel",
    "A desconfiança é a armadura do líder prudente. Nicolau Maquiavel",
    "O poder é conquistado com astúcia, não com força. Nicolau Maquiavel",
    "A lealdade é comprada, mas a traição com gratuita. Nicolau Maquiavel",
    "O governante forte parece justo, mas age com firmeza. Nicolau Maquiavel",
    "A aparência de virtude é mais útil que a virtude em si. Nicolau Maquiavel",
    "O líder sábio adapta-se ao tempo, não ao ideal. Nicolau Maquiavel",
    "A política é a arte de controlar o caos. Nicolau Maquiavel",
    "O poder é mantido por quem sabe manipular a verdade. Nicolau Maquiavel",
    "A fraqueza é um convite à derrota. Nicolau Maquiavel",
    "O governante sábio faz da necessidade uma virtude. Nicolau Maquiavel",
    "A traição é o preço do poder mal vigiado. Nicolau Maquiavel",
    "O líder forte usa o medo como ferramenta, não como fim. Nicolau Maquiavel",
    "A estabilidade vem da força, não da bondade. Nicolau Maquiavel",
    "O governante sábio nunca revela suas intenções. Nicolau Maquiavel",
    "O poder é um jogo de sombras e espelhos. Nicolau Maquiavel",
    "A lealdade do povo é conquistada com resultados. Nicolau Maquiavel",
    "O líder sábio faz do inimigo um aliado temporário. Nicolau Maquiavel",
    "A política é a arte de prometer sem cumprir. Nicolau Maquiavel",
    "O governante forte controla o presente e planeja o futuro. Nicolau Maquiavel",
    "A fraqueza é perdoada, mas nunca esquecida. Nicolau Maquiavel",
    "O poder é mantido por quem sabe calar. Nicolau Maquiavel",
    "A astúcia é a arma do governante sábio. Nicolau Maquiavel",
    "O líder forte usa a bondade como máscara. Nicolau Maquiavel",
    "A política é um jogo de interesses, não de virtudes. Nicolau Maquiavel",
    "O governante sábio nunca subestima o inimigo. Nicolau Maquiavel",
    "O poder é mantido pela ilusão de controle. Nicolau Maquiavel",
    "A traição é o eco da confiança mal colocada. Nicolau Maquiavel",
    "O líder sábio faz do medo um aliado. Nicolau Maquiavel",
    "A política é a arte de transformar fraqueza em força. Nicolau Maquiavel",
    "O governante forte nunca mostra dúvida. Nicolau Maquiavel",
    "O poder é um equilíbrio entre temor e admiração. Nicolau Maquiavel",
    "A astúcia vence onde a força falha. Nicolau Maquiavel",
    "O líder sábio sabe quando sacrificar um peão. Nicolau Maquiavel",
    "A política é a dança do interesse próprio. Nicolau Maquiavel",
    "O governante sábio faz da necessidade uma oportunidade. Nicolau Maquiavel",
    "O poder é mantido por quem controla a narrativa. Nicolau Maquiavel",
    "A lealdade é frágil; o interesse é eterno. Nicolau Maquiavel",
    "O líder sábio usa a verdade como arma, não como guia. Nicolau Maquiavel",
    "A política é a arte de prometer o impossível. Nicolau Maquiavel",
    "O governante forte faz do caos sua ferramenta. Nicolau Maquiavel",
    "O poder é conquistado com paciência e audácia. Nicolau Maquiavel",
    "A fraqueza é o veneno do governante descuidado. Nicolau Maquiavel",
    "O líder sábio nunca confia em promessas. Nicolau Maquiavel",
    "A política é o jogo de quem sabe mentir melhor. Nicolau Maquiavel",
    "O governante forte faz da traição uma lição. Nicolau Maquiavel",
    "O poder é mantido por quem domina o silêncio. Nicolau Maquiavel",
    "A astúcia é a chave para o trono duradouro. Nicolau Maquiavel",
    "O líder sábio faz do inimigo um espelho. Nicolau Maquiavel",
    "A política é a arte de vencer sem lutar. Nicolau Maquiavel",
    "O governante forte usa o povo como escudo. Nicolau Maquiavel",
    "O poder é mantido por quem sabe dividir. Nicolau Maquiavel",
    "A lealdade é comprada com favores, não com ideais. Nicolau Maquiavel",
    "O líder sábio faz da derrota uma lição. Nicolau Maquiavel",
    "A política é o campo onde a verdade é moldada. Nicolau Maquiavel",
    "O governante forte nunca revela seu próximo passo. Nicolau Maquiavel",
    "O poder é um jogo de paciência e traição. Nicolau Maquiavel",
    "A astúcia é a armadura do líder prudente. Nicolau Maquiavel",
    "O líder sábio faz do medo um conselheiro. Nicolau Maquiavel",
    "A política é a arte de transformar inimigos em aliados. Nicolau Maquiavel",
    "O governante forte usa a fraqueza como isca. Nicolau Maquiavel",
    "O poder é mantido por quem sabe fingir. Nicolau Maquiavel",
    "A lealdade é um contrato, não uma promessa. Nicolau Maquiavel",
    "O líder sábio faz do erro um degrau. Nicolau Maquiavel",
    "A política é a arte de controlar sem ser visto. Nicolau Maquiavel",
    "O governante forte faz da necessidade uma arma. Nicolau Maquiavel",
    "O poder é mantido por quem domina o tempo. Nicolau Maquiavel",
    "A astúcia é a luz que guia o líder sábio. Nicolau Maquiavel",
    "O líder forte faz do povo seu exército. Nicolau Maquiavel",
    "A política é o jogo de quem sabe esperar. Nicolau Maquiavel",
    "O governante sábio usa a verdade como ferramenta. Nicolau Maquiavel",
    "O poder é conquistado por quem entende o coração humano. Nicolau Maquiavel",
    "A lealdade é frágil, mas o medo é eterno. Nicolau Maquiavel",
    "O líder sábio faz da traição um aprendizado. Nicolau Maquiavel",
    "A política é a arte de moldar o futuro. Nicolau Maquiavel",
    "O governante forte nunca confunde bondade com fraqueza. Nicolau Maquiavel",
    "O poder é mantido por quem sabe calar a tempo. Nicolau Maquiavel",
    "A astúcia é o escudo do líder prudente. Nicolau Maquiavel",
    "O líder sábio faz do caos um aliado. Nicolau Maquiavel",
    "A política é a dança de interesses e promessas. Nicolau Maquiavel",
    "O governante forte usa o medo como alavanca. Nicolau Maquiavel",
    "O poder é conquistado por quem sabe planejar. Nicolau Maquiavel",
    "A lealdade é um meio, não um fim. Nicolau Maquiavel",
    "O líder sábio faz do erro uma oportunidade. Nicolau Maquiavel",
    "A política é a arte de vencer sem lutar. Nicolau Maquiavel",
    "O governante forte faz do povo sua força. Nicolau Maquiavel",
    "O poder é mantido por quem controla a narrativa. Nicolau Maquiavel",
    "A astúcia é a arma do líder eterno. Nicolau Maquiavel",
    "O líder sábio faz da traição uma lição. Nicolau Maquiavel",
    "A política é o jogo de quem sabe mentir com verdade. Nicolau Maquiavel",
    "O governante forte usa a fraqueza como estratégia. Nicolau Maquiavel",
    "O poder é mantido por quem domina o silêncio. Nicolau Maquiavel",
    "A lealdade é comprada com resultados, não com palavras. Nicolau Maquiavel",
    "O líder sábio faz do inimigo um professor. Nicolau Maquiavel",
    "A política é a arte de transformar o caos em ordem. Nicolau Maquiavel",
    "O governante forte nunca mostra sua dúvida. Nicolau Maquiavel",
    "O poder é o reflexo da mente astuta. Nicolau Maquiavel",
    "O primeiro passo é o mais difícil, mas também o mais poderoso. Autor Desconhecido",
    "Acredite em você, e o mundo acreditará. Autor Desconhecido",
    "O sucesso é a soma de pequenos esforços diários. Autor Desconhecido",
    "Não espere o momento perfeito, crie-o. Autor Desconhecido",
    "Cada dia é uma nova chance de ser melhor. Autor Desconhecido",
    "A força vem de dentro, não de fora. Autor Desconhecido",
    "O fracasso é apenas um degrau para o sucesso. Autor Desconhecido",
    "Sonhe grande, trabalhe duro, vença sempre. Autor Desconhecido",
    "A motivação começa com um propósito claro. Autor Desconhecido",
    "Você é mais forte do que imagina. Autor Desconhecido",
    "O medo é apenas uma sombra; enfrente-o. Autor Desconhecido",
    "O sucesso não é sorte, é trabalho. Autor Desconhecido",
    "Cada obstáculo é uma chance de crescer. Autor Desconhecido",
    "A persistência transforma sonhos em realidade. Autor Desconhecido",
    "Você não precisa ser perfeito, apenas começar. Autor Desconhecido",
    "O futuro pertence a quem o constrói hoje. Autor Desconhecido",
    "A motivação é o fogo que acende a ação. Autor Desconhecido",
    "Não pare, mesmo que o caminho seja longo. Autor Desconhecido",
    "O sucesso é a coragem de tentar novamente. Autor Desconhecido",
    "Acredite no impossível, e ele se tornará possível. Autor Desconhecido",
    "O esforço de hoje é a vitória de amanhã. Autor Desconhecido",
    "A motivação vem de acreditar no seu propósito. Autor Desconhecido",
    "Você é o autor da sua história; escreva-a bem. Autor Desconhecido",
    "O fracasso é uma lição, não um fim. Autor Desconhecido",
    "A força está em continuar, mesmo com medo. Autor Desconhecido",
    "O sucesso é construído com paciência e trabalho. Autor Desconhecido",
    "A motivação é a chave que abre o futuro. Autor Desconhecido",
    "Não espere por oportunidades, crie-as. Autor Desconhecido",
    "Cada passo conta, por menor que seja. Autor Desconhecido",
    "Acredite em você, e o mundo seguirá. Autor Desconhecido",
    "O sucesso é a soma de pequenas vitórias. Autor Desconhecido",
    "A motivação é o combustível da mudança. Autor Desconhecido",
    "Não tema o fracasso, tema não tentar. Autor Desconhecido",
    "O futuro é moldado pelas ações de hoje. Autor Desconhecido",
    "A força está em nunca desistir. Autor Desconhecido",
    "O sucesso vem para quem persiste. Autor Desconhecido",
    "A motivação é a chama que nunca apaga. Autor Desconhecido",
    "Você é maior que seus medos. Autor Desconhecido",
    "O caminho para o sucesso é pavimentado com esforço. Autor Desconhecido",
    "Acredite no seu potencial, e ele se revelará. Autor Desconhecido",
    "O fracasso é apenas um convite para tentar de novo. Autor Desconhecido",
    "A motivação nasce do desejo de ser melhor. Autor Desconhecido",
    "O sucesso é a recompensa da persistência. Autor Desconhecido",
    "Não espere o perfeito, comece com o possível. Autor Desconhecido",
    "A força está em acreditar em si mesmo. Autor Desconhecido",
    "O futuro pertence a quem ousa sonhar. Autor Desconhecido",
    "A motivação é a ponte entre o sonho e a realidade. Autor Desconhecido",
    "Cada obstáculo é uma chance de provar sua força. Autor Desconhecido",
    "O sucesso é construído com coragem e paciência. Autor Desconhecido",
    "Acredite que você pode, e você fará. Autor Desconhecido",
    "O fracasso é apenas um degrau para a vitória. Autor Desconhecido",
    "A motivação é o que transforma sonhos em metas. Autor Desconhecido",
    "Não pare, mesmo que o caminho seja incerto. Autor Desconhecido",
    "O sucesso é a soma de pequenos passos firmes. Autor Desconhecido",
    "A força está em continuar, apesar de tudo. Autor Desconhecido",
    "A motivação é a luz que guia seus passos. Autor Desconhecido",
    "Você é mais forte que suas dúvidas. Autor Desconhecido",
    "O sucesso vem para quem nunca desiste. Autor Desconhecido",
    "Acredite no seu sonho, e ele se tornará realidade. Autor Desconhecido",
    "O fracasso é apenas um professor exigente. Autor Desconhecido",
    "A motivação é a energia que move montanhas. Autor Desconhecido",
    "Não tema o erro, tema a inação. Autor Desconhecido",
    "O sucesso é construído com trabalho e fé. Autor Desconhecido",
    "A força está em acreditar no impossível. Autor Desconhecido",
    "A motivação é a chave para abrir novas portas. Autor Desconhecido",
    "Cada passo te aproxima do seu objetivo. Autor Desconhecido",
    "O sucesso é a recompensa da coragem. Autor Desconhecido",
    "Acredite em você, e o mundo te seguirá. Autor Desconhecido",
    "O fracasso é apenas um teste de resiliência. Autor Desconhecido",
    "A motivação é o que faz o impossível possível. Autor Desconhecido",
    "Não espere o momento certo, faça agora. Autor Desconhecido",
    "O sucesso é construído com pequenos esforços. Autor Desconhecido",
    "A força está em nunca desistir de si. Autor Desconhecido",
    "A motivação é o fogo que aquece seus sonhos. Autor Desconhecido",
    "Você é maior que qualquer obstáculo. Autor Desconhecido",
    "O sucesso vem para quem persiste com paixão. Autor Desconhecido",
    "Acredite no seu potencial, e ele brilhará. Autor Desconhecido",
    "O fracasso é apenas uma pausa, não o fim. Autor Desconhecido",
    "A motivação é a energia que transforma vidas. Autor Desconhecido",
    "Não pare, mesmo que o caminho seja árduo. Autor Desconhecido",
    "O sucesso é a soma de coragem e esforço. Autor Desconhecido",
    "A força está em acreditar no seu propósito. Autor Desconhecido",
    "A motivação é a chama que nunca se apaga. Autor Desconhecido",
    "Você é mais forte que qualquer dúvida. Autor Desconhecido",
    "O sucesso vem para quem ousa tentar. Autor Desconhecido",
    "Acredite no seu sonho, e ele te guiará. Autor Desconhecido",
    "O fracasso é apenas um degrau para o topo. Autor Desconhecido",
    "A motivação é a força que move o mundo. Autor Desconhecido",
    "Não tema o erro, tema não tentar. Autor Desconhecido",
    "O sucesso é construído com paciência e fé. Autor Desconhecido",
    "A força está em continuar, mesmo com medo. Autor Desconhecido",
    "A motivação é a luz que ilumina o caminho. Autor Desconhecido",
    "Você é maior que seus desafios. Autor Desconhecido",
    "O sucesso vem para quem nunca desiste. Autor Desconhecido",
    "Acredite em você, e o impossível será possível. Autor Desconhecido",
    "O fracasso é apenas uma lição disfarçada. Autor Desconhecido",
    "A motivação é o que transforma sonhos em realidade. Autor Desconhecido",
    "Não pare, mesmo que o caminho seja longo. Autor Desconhecido",
    "O sucesso é a recompensa da persistência. Autor Desconhecido",
    "A força está em acreditar no seu potencial. Autor Desconhecido",
    "A dor é temporária, a superação é eterna. Autor Desconhecido",
    "Cada queda é uma chance de se levantar mais forte. Autor Desconhecido",
    "O obstáculo é grande, mas sua coragem é maior. Autor Desconhecido",
    "A superação começa quando você decide não desistir. Autor Desconhecido",
    "As cicatrizes são provas da sua força. Autor Desconhecido",
    "O fracasso é apenas o começo da vitória. Autor Desconhecido",
    "Supere o medo, e o mundo se abrirá para você. Autor Desconhecido",
    "A força está em continuar, mesmo exausto. Autor Desconhecido",
    "Cada desafio é um convite para crescer. Autor Desconhecido",
    "A superação é a arte de transformar dor em força. Autor Desconhecido",
    "Você é mais forte que suas maiores dificuldades. Autor Desconhecido",
    "O caminho da superação é pavimentado com coragem. Autor Desconhecido",
    "Não há obstáculo que sua determinação não vença. Autor Desconhecido",
    "A dor é um mestre, a superação é sua lição. Autor Desconhecido",
    "Cada passo difícil te aproxima do topo. Autor Desconhecido",
    "A superação é a vitória sobre si mesmo. Autor Desconhecido",
    "O fracasso é apenas um teste de resiliência. Autor Desconhecido",
    "A força está em se levantar após a queda. Autor Desconhecido",
    "Supere o impossível, e ele se tornará possível. Autor Desconhecido",
    "As dificuldades são degraus para o sucesso. Autor Desconhecido",
    "A superação é a chama que nunca se apaga. Autor Desconhecido",
    "Você é maior que qualquer adversidade. Autor Desconhecido",
    "O caminho da superação é feito de pequenos passos. Autor Desconhecido",
    "A dor molda, mas a coragem transforma. Autor Desconhecido",
    "Cada obstáculo é uma chance de provar sua força. Autor Desconhecido",
    "A superação é a arte de vencer o medo. Autor Desconhecido",
    "O fracasso é apenas um degrau para o topo. Autor Desconhecido",
    "A força está em continuar, apesar de tudo. Autor Desconhecido",
    "Supere suas dúvidas, e o mundo te seguirá. Autor Desconhecido",
    "As dificuldades são apenas testes de sua vontade. Autor Desconhecido",
    "A superação é a ponte entre o sonho e a realidade. Autor Desconhecido",
    "Você é mais forte que suas maiores lutas. Autor Desconhecido",
    "O caminho da superação é trilhado com paciência. Autor Desconhecido",
    "A dor é temporária, mas a vitória é eterna. Autor Desconhecido",
    "Cada queda te ensina a voar mais alto. Autor Desconhecido",
    "A superação é a força que nasce da adversidade. Autor Desconhecido",
    "O fracasso é apenas uma pausa, não o fim. Autor Desconhecido",
    "A força está em acreditar, mesmo na escuridão. Autor Desconhecido",
    "Supere o obstáculo, e ele se tornará uma lição. Autor Desconhecido",
    "As dificuldades são o fogo que forja o aço. Autor Desconhecido",
    "A superação é a vitória do espírito sobre a matéria. Autor Desconhecido",
    "Você é maior que qualquer tempestade. Autor Desconhecido",
    "O caminho da superação é feito de coragem. Autor Desconhecido",
    "A dor é um professor, a superação é o aluno. Autor Desconhecido",
    "Cada obstáculo é uma chance de se reinventar. Autor Desconhecido",
    "A superação é a arte de transformar o impossível. Autor Desconhecido",
    "O fracasso é apenas um convite para tentar de novo. Autor Desconhecido",
    "A força está em nunca desistir de si. Autor Desconhecido",
    "Supere o medo, e o futuro será seu. Autor Desconhecido",
    "As dificuldades são apenas degraus para o sucesso. Autor Desconhecido",
    "A superação é a chama que ilumina o caminho. Autor Desconhecido",
    "Você é mais forte que qualquer desafio. Autor Desconhecido",
    "O caminho da superação é pavimentado com fé. Autor Desconhecido",
    "A dor é temporária, a força é eterna. Autor Desconhecido",
    "Cada queda te ensina a caminhar com mais firmeza. Autor Desconhecido",
    "A superação é a vitória sobre o impossível. Autor Desconhecido",
    "O fracasso é apenas uma lição disfarçada. Autor Desconhecido",
    "A força está em continuar, apesar da dor. Autor Desconhecido",
    "Supere o medo, e o futuro será seu. Autor Desconhecido",
    "As dificuldades são o fogo que forja a alma. Autor Desconhecido",
    "A superação é a arte de transformar o caos em ordem. Autor Desconhecido",
    "Você é maior que qualquer adversidade. Autor Desconhecido",
    "O caminho da superação é pavimentado com esperança. Autor Desconhecido",
    "A dor é um mestre, a superação é o aluno. Autor Desconhecido",
    "Cada obstáculo é uma chance de se tornar melhor. Autor Desconhecido",
    "A superação é a força que move montanhas. Autor Desconhecido",
    "O fracasso é apenas um convite para crescer. Autor Desconhecido",
    "A força está em nunca desistir de seus sonhos. Autor Desconhecido",
    "Supere o impossível, e ele se tornará realidade. Autor Desconhecido",
    "As dificuldades são apenas degraus para o topo. Autor Desconhecido",
    "A superação é a chama que nunca se apaga. Autor Desconhecido",
    "Você é mais forte que qualquer tempestade. Autor Desconhecido",
    "O caminho da superação é trilhado com coragem. Autor Desconhecido",
    "A dor é temporária, a vitória é eterna. Autor Desconhecido",
    "Cada queda é uma chance de voar mais alto. Autor Desconhecido",
    "A superação é a vitória sobre suas dúvidas. Autor Desconhecido",
    "O fracasso é apenas um teste de sua força. Autor Desconhecido",
    "A força está em acreditar, mesmo na escuridão. Autor Desconhecido",
    "Supere o obstáculo, e ele se tornará uma lição. Autor Desconhecido",
    "As dificuldades são o teste da sua resiliência. Autor Desconhecido",
    "A superação é a arte de transformar a dor em luz. Autor Desconhecido",
    "Você é maior que qualquer barreira. Autor Desconhecido",
    "O caminho da superação é trilhado com determinação. Autor Desconhecido",
    "A dor é um guia, a superação é o destino. Autor Desconhecido",
    "Cada obstáculo é uma chance de crescer mais forte. Autor Desconhecido",
    "A superação é a força que nasce do coração. Autor Desconhecido",
    "O fracasso é apenas um degrau para a vitória. Autor Desconhecido",
    "A força está em acreditar no impossível. Autor Desconhecido",
    "Supere suas dúvidas, e o mundo se abrirá. Autor Desconhecido",
    "As dificuldades são apenas testes de sua coragem. Autor Desconhecido",
    "A superação é a ponte entre o medo e a vitória. Autor Desconhecido",
    "Você é mais forte que qualquer tormenta. Autor Desconhecido",
    "O caminho da superação é feito de paciência. Autor Desconhecido",
    "A dor é temporária, a superação é eterna. Autor Desconhecido",
    "Cada queda te ensina a caminhar com mais firmeza. Autor Desconhecido",
    "A superação é a vitória sobre o impossível. Autor Desconhecido",
    "O fracasso é apenas uma lição disfarçada. Autor Desconhecido",
    "A força está em continuar, apesar da dor. Autor Desconhecido",
    "Supere o medo, e o futuro será seu. Autor Desconhecido",
    "As dificuldades são o fogo que forja a alma. Autor Desconhecido",
    "A superação é a arte de transformar a dor em força. Autor Desconhecido",
    "A fé é a luz que guia na escuridão. Autor Desconhecido",
    "Com fé, o impossível se torna possível. Autor Desconhecido",
    "Acredite, e Deus abrirá o caminho. Autor Desconhecido",
    "A fé é a força que move montanhas. Autor Desconhecido",
    "Confie no plano divino, mesmo sem entender. Autor Desconhecido",
    "A fé é a ponte entre o coração e o milagre. Autor Desconhecido",
    "Deus nunca te dá um fardo maior que sua força. Autor Desconhecido",
    "A fé transforma o medo em esperança. Autor Desconhecido",
    "Com fé, cada dia é uma nova promessa. Autor Desconhecido",
    "Acredite no invisível, e o visível se revelará. Autor Desconhecido",
    "A fé é o escudo contra as tempestades da vida. Autor Desconhecido",
    "Confie em Deus, e o caminho se abrirá. Autor Desconhecido",
    "A fé é a chama que nunca se apaga. Autor Desconhecido",
    "Com fé, o coração encontra paz. Autor Desconhecido",
    "Acredite, e o milagre acontecerá. Autor Desconhecido",
    "A fé é a força que sustenta a alma. Autor Desconhecido",
    "Deus está com você, mesmo nos dias mais escuros. Autor Desconhecido",
    "A fé é a luz que ilumina o caminho. Autor Desconhecido",
    "Confie no tempo de Deus, ele nunca falha. Autor Desconhecido",
    "A fé é a certeza do que ainda não se vê. Autor Desconhecido",
    "Com fé, nenhum obstáculo é grande demais. Autor Desconhecido",
    "Acredite no amor divino, e ele te guiará. Autor Desconhecido",
    "A fé é a força que transforma vidas. Autor Desconhecido",
    "Deus te dá asas quando você confia. Autor Desconhecido",
    "A fé é a ponte entre o hoje e o amanhã. Autor Desconhecido",
    "Com fé, o impossível se torna realidade. Autor Desconhecido",
    "Acredite, e Deus fará o resto. Autor Desconhecido",
    "A fé é a luz que nunca se apaga. Autor Desconhecido",
    "Confie no plano de Deus, ele é perfeito. Autor Desconhecido",
    "A fé é a força que vence o medo. Autor Desconhecido",
    "Com fé, cada passo é guiado por Deus. Autor Desconhecido",
    "Acredite, e o milagre se manifestará. Autor Desconhecido",
    "A fé é o alicerce de uma vida plena. Autor Desconhecido",
    "Deus nunca te abandona, mesmo na dor. Autor Desconhecido",
    "A fé é a chama que aquece o coração. Autor Desconhecido",
    "Com fé, o futuro é sempre promissor. Autor Desconhecido",
    "Acredite, e Deus abrirá as portas. Autor Desconhecido",
    "A fé é a força que sustenta o espírito. Autor Desconhecido",
    "Confie em Deus, e ele te levará além. Autor Desconhecido",
    "A fé é a luz que guia na escuridão. Autor Desconhecido",
    "Com fé, o impossível se torna possível. Autor Desconhecido",
    "Acredite, e Deus transformará sua vida. Autor Desconhecido",
    "A fé é a força que move o coração. Autor Desconhecido",
    "Deus está contigo, mesmo quando não vês. Autor Desconhecido",
    "A fé é a ponte entre o sonho e a realidade. Autor Desconhecido",
    "Com fé, cada dia é uma nova bênção. Autor Desconhecido",
    "Acredite no plano divino, ele é perfeito. Autor Desconhecido",
    "A fé é a luz que ilumina o futuro. Autor Desconhecido",
    "Confie em Deus, e ele te sustentará. Autor Desconhecido",
    "A fé é a força que vence qualquer batalha. Autor Desconhecido",
    "Com fé, o coração encontra paz eterna. Autor Desconhecido",
    "Acredite, e o milagre se manifestará. Autor Desconhecido",
    "A fé é o alicerce de uma vida abençoada. Autor Desconhecido",
    "Deus te guia, mesmo nos caminhos tortuosos. Autor Desconhecido",
    "A fé é a chama que nunca se extingue. Autor Desconhecido",
    "Com fé, o impossível se torna realidade. Autor Desconhecido",
    "Acredite, e Deus fará o impossível. Autor Desconhecido",
    "A fé é a força que transforma o coração. Autor Desconhecido",
    "Confie no tempo de Deus, ele é perfeito. Autor Desconhecido",
    "A fé é a luz que guia na tempestade. Autor Desconhecido",
    "Com fé, cada obstáculo é uma lição. Autor Desconhecido",
    "Acredite, e Deus abrirá o caminho. Autor Desconhecido",
    "A fé é a força que sustenta a alma. Autor Desconhecido",
    "Deus está contigo, mesmo na escuridão. Autor Desconhecido",
    "A fé é a ponte entre a dor e a esperança. Autor Desconhecido",
    "Com fé, o futuro é sempre brilhante. Autor Desconhecido",
    "Acredite no amor de Deus, ele nunca falha. Autor Desconhecido",
    "A fé é a luz que ilumina o coração. Autor Desconhecido",
    "Confie em Deus, e ele te levará ao topo. Autor Desconhecido",
    "A fé é a força que vence o impossível. Autor Desconhecido",
    "Com fé, cada dia é uma nova promessa. Autor Desconhecido",
    "Acredite, e o milagre acontecerá. Autor Desconhecido",
    "A fé é o alicerce de uma vida com propósito. Autor Desconhecido",
    "Deus te sustenta, mesmo na fraqueza. Autor Desconhecido",
    "A fé é a chama que aquece a alma. Autor Desconhecido",
    "Com fé, o impossível se torna possível. Autor Desconhecido",
    "Acredite, e Deus transformará sua vida. Autor Desconhecido",
    "A fé é a força que move montanhas. Autor Desconhecido",
    "Confie no plano de Deus, ele é perfeito. Autor Desconhecido",
    "A fé é a luz que guia na escuridão. Autor Desconhecido",
    "Com fé, cada passo é uma vitória. Autor Desconhecido",
    "Acredite, e Deus fará o resto. Autor Desconhecido",
    "A fé é a força que sustenta o coração. Autor Desconhecido",
    "Deus está contigo, mesmo nos dias mais difíceis. Autor Desconhecido",
    "A fé é a ponte entre o medo e a coragem. Autor Desconhecido",
    "Com fé, o futuro é sempre promissor. Autor Desconhecido",
    "Acredite no amor divino, e ele te guiará. Autor Desconhecido",
    "A fé é a luz que nunca se apaga. Autor Desconhecido",
    "Confie em Deus, e ele te levará além. Autor Desconhecido",
    "A fé é a força que vence qualquer obstáculo. Autor Desconhecido",
    "Com fé, o coração encontra paz eterna. Autor Desconhecido",
    "Acredite, e o milagre se manifestará. Autor Desconhecido",
    "A fé é o alicerce de uma vida com propósito. Autor Desconhecido",
    "Deus te guia, mesmo nos caminhos mais difíceis. Autor Desconhecido",
    "A fé é a chama que nunca se extingue. Autor Desconhecido",
    "Com fé, o impossível se torna realidade. Autor Desconhecido",
    "Acredite, e Deus fará o impossível. Autor Desconhecido",
    "A fé é a força que transforma a vida. Autor Desconhecido",
    "Confie no tempo de Deus, ele nunca falha. Autor Desconhecido",
    "A fé é a luz que guia o coração. Autor Desconhecido"
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleWelcomeSequence(context);
    });
  }

  Future<void> _handleWelcomeSequence(BuildContext context) async {
    final settingsService = context.read<ThemeService>();
    final isFirstLaunch = await settingsService.isFirstLaunch();

    if (isFirstLaunch && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Boas-vindas ao WordRope! 👋'),
        duration: Duration(seconds: 3),
      ));

      ShowCaseWidget.of(context).startShowCase([
        _soundButtonKey,
        _themeButtonKey,
        _faqButtonKey,
        _scoreKey,
        _categoryKey,
      ]);
      await settingsService.markFirstLaunchDone();
    } else if (mounted) {
      final random = Random();
      final message =
          _motivationalMessages[random.nextInt(_motivationalMessages.length)];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Bem-vindo(a) de Volta!',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(message),
          ],
        ),
        // Duração aumentada e botão para fechar
        duration: const Duration(seconds: 8),
        action: SnackBarAction(
          label: 'FECHAR',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: isDarkMode
              ? AppColorsDark.backgroundGradient
              : AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Showcase(
                key: _scoreKey,
                description: 'Acompanhe aqui sua pontuação e seu recorde!',
                child: _buildScoreDisplay(context),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Escolha uma categoria para começar',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.textTheme.titleMedium?.color
                              ?.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // O GridView agora ficará dentro de um Expanded para preencher o espaço restante.
                      Expanded(
                        child: _buildCategoriesGrid(context),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, settingsService, child) {
        final theme = Theme.of(context);
        final isDarkMode = settingsService.themeMode == ThemeMode.dark;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          // MODIFICADO: Trocado Stack por Row com Spacers para um alinhamento mais robusto
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Botão de Tema à Esquerda
              Showcase(
                key: _themeButtonKey,
                description: 'Alterne entre o modo claro e escuro.',
                child: IconButton(
                  icon: Icon(isDarkMode
                      ? Icons.wb_sunny_outlined
                      : Icons.nightlight_round_outlined),
                  color: theme.colorScheme.onBackground,
                  onPressed: () => settingsService.toggleTheme(),
                ),
              ),

              // Título Centralizado
              Column(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => (isDarkMode
                            ? AppColorsDark.primaryGradient
                            : AppColors.primaryGradient)
                        .createShader(bounds),
                    child: const Text('WordRope',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Text('Jogo da Forca Moderno',
                      style: theme.textTheme.bodySmall),
                ],
              ),

              // Botões de Som e FAQ à Direita
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Showcase(
                    key: _soundButtonKey,
                    description: 'Ligue ou desligue os sons do jogo aqui.',
                    child: IconButton(
                      icon: Icon(settingsService.soundEnabled
                          ? Icons.volume_up_outlined
                          : Icons.volume_off_outlined),
                      color: theme.colorScheme.onBackground,
                      onPressed: () => settingsService.toggleSound(),
                    ),
                  ),
                  Showcase(
                    key: _faqButtonKey,
                    description:
                        'Tem dúvidas? Toque aqui para ver as perguntas frequentes.',
                    child: IconButton(
                      icon: const Icon(Icons.quiz_outlined),
                      color: theme.colorScheme.onBackground,
                      onPressed: () => _showFaqDialog(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFaqDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Perguntas Frequentes (FAQ)'),
        content: const SingleChildScrollView(
          child: Text(
              "1. Como funcionam as dicas?\nVocê pode usar até 3 dicas por jogo, mas cada uma custa uma tentativa.\n\n"
              "2. Como a pontuação é calculada?\nVocê ganha 50 pontos por vitória, mais bônus por letras na palavra e tentativas restantes.\n\n"
              "3. O jogo salva meu progresso?\nSim! Sua pontuação total e seu recorde são salvos automaticamente."),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Entendi'))
        ],
      ),
    );
  }

  Widget _buildScoreDisplay(BuildContext context) {
    return Consumer<GameService>(
      builder: (context, gameService, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Row(
            children: [
              _buildScoreCard(context, 'Pontuação Total',
                  gameService.totalScore, Icons.star_rounded),
              const SizedBox(width: 16),
              _buildScoreCard(context, 'Recorde', gameService.highScore,
                  Icons.emoji_events_rounded),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScoreCard(
      BuildContext context, String title, int score, IconData icon) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.dividerColor.withOpacity(0.5)),
        ),
        child: Column(
          children: [
            Icon(icon, color: theme.colorScheme.primary, size: 28),
            const SizedBox(height: 4),
            Text(title, style: theme.textTheme.bodyMedium),
            Text(
              score.toString(),
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final theme = Theme.of(context);
    final footerTextStyle = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onBackground.withOpacity(0.6),
    );
    final linkTextStyle = theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: [
              _buildFooterLink(
                  icon: FontAwesomeIcons.whatsapp,
                  iconColor: const Color(0xFF25D366),
                  text: "Desenvolvedor",
                  style: linkTextStyle,
                  onTap: () => _launchURL('https://wa.me/5532998111973')),
              _buildFooterLink(
                  icon: FontAwesomeIcons.instagram,
                  iconColor: const Color(0xFFE4405F),
                  text: "Instagram",
                  style: linkTextStyle,
                  onTap: () =>
                      _launchURL('https://www.instagram.com/codevibestudio/')),
            ],
          ),
          const SizedBox(height: 12),
          Text("Versão 1.0.2", style: footerTextStyle),
          const SizedBox(height: 4),
          Text("© 2024 CodeVibe Studio. Todos os direitos reservados.",
              style: footerTextStyle),
        ],
      ),
    );
  }

  Widget _buildFooterLink(
      {required IconData icon,
      required Color iconColor,
      required String text,
      TextStyle? style,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, color: iconColor, size: 14),
            const SizedBox(width: 6),
            Text(text, style: style),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    final gameService = Provider.of<GameService>(context, listen: false);
    final categories = gameService.getAvailableCategories();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        // MODIFICADO: Aumentando a proporção para dar mais altura aos cards
        childAspectRatio: 1.0,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final bool isFirstCard = index == 0;

        if (isFirstCard) {
          return Showcase(
            key: _categoryKey,
            description: 'Toque em uma categoria para começar a jogar!',
            child: CategoryCard(
              category: category,
              onTap: () => _navigateToGame(context, category),
            ),
          );
        }

        return CategoryCard(
          category: category,
          onTap: () => _navigateToGame(context, category),
        );
      },
    );
  }

  void _navigateToGame(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GamePage(category: category)),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // ignore: avoid_print
      print('Não foi possível abrir $url');
    }
  }
}
