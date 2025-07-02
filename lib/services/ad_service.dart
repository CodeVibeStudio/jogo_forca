import 'dart:io' show Platform;
import 'package:flutter/foundation.dart'; // Importe para usar o kDebugMode
import 'package:google_mobile_ads/google_mobile_ads.dart';

// Esta classe centraliza a lógica e os IDs dos seus anúncios.
class AdService {
  // --- GETTERS DE IDs DE BLOCOS DE ANÚNCIOS ---
  // Eles escolhem automaticamente entre teste e produção.

  /// ID para o bloco de anúncios do tipo Banner
  static String get bannerAdUnitId {
    if (kDebugMode) {
      // ID de Teste do Google para Banner (Android). Seguro para usar em desenvolvimento.
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    // Seu ID de Produção para Banner, usado na versão final.
    return 'ca-app-pub-2168036839625903/4687442163'; //
  }

  /// ID para o bloco de anúncios do tipo Premiado
  static String get rewardedAdUnitId {
    if (kDebugMode) {
      // ID de Teste do Google para Premiado (Android).
      return 'ca-app-pub-3940256099942544/5224354917';
    }
    // Seu ID de Produção para Premiado, usado na versão final.
    return 'ca-app-pub-2168036839625903/9150830156'; //
  }

  // Você também criou um Intersticial Premiado. Guardaremos o ID aqui para o futuro:
  // static final String _rewardedInterstitialAdUnitId = "ca-app-pub-2168036839625903/1463911828";

  // --- FUNÇÕES DOS ANÚNCIOS ---

  // Carrega e retorna um BannerAd
  static BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: bannerAdUnitId, // MODIFICADO: Agora usa o getter seguro
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => print('BannerAd carregado com sucesso.'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          print('Falha ao carregar BannerAd: $error');
        },
      ),
    );
  }

  // Carrega um RewardedAd
  static void loadRewardedAd({
    required Function(RewardedAd) onAdLoaded,
    required Function() onAdFailedToLoad,
  }) {
    RewardedAd.load(
      adUnitId: rewardedAdUnitId, // MODIFICADO: Agora usa o getter seguro
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('RewardedAd carregado com sucesso.');
          onAdLoaded(ad);
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Falha ao carregar RewardedAd: $error');
          onAdFailedToLoad();
        },
      ),
    );
  }
}
