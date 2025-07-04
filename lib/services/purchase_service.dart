// Arquivo: lib/services/purchase_service.dart (VERSÃO COMPLETA E CORRIGIDA)

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'game_service.dart';

// O ID exato que você criou no Google Play Console para o produto "premium"
const String _premiumProductId = 'wordrope_premium_no_ads';

class PurchaseService extends ChangeNotifier {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  
  GameService? _gameService; // Variável para guardar a referência do GameService
  List<ProductDetails> _products = [];

  PurchaseService() {
    final Stream<List<PurchaseDetails>> purchaseUpdated = _inAppPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      print("Erro no stream de compras: $error");
    });

    loadProducts();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  // >>> MÉTODO QUE ESTAVA FALTANDO <<<
  // Este método permite que o main.dart nos dê acesso ao GameService.
  void setGameService(GameService gameService) {
    _gameService = gameService;
  }

  Future<void> loadProducts() async {
    final bool available = await _inAppPurchase.isAvailable();
    if (!available) {
      print("A loja não está disponível.");
      return;
    }

    const Set<String> productIds = {_premiumProductId};
    final ProductDetailsResponse response = await _inAppPurchase.queryProductDetails(productIds);

    if (response.error != null) {
      print("Falha ao buscar produtos: ${response.error}");
      return;
    }

    _products = response.productDetails;
  }

  Future<void> buyPremium() async {
    if (_products.isEmpty) {
      print("Nenhum produto para comprar. Verifique a conexão com a loja.");
      return;
    }
    
    final ProductDetails productDetails = _products.firstWhere((product) => product.id == _premiumProductId);
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
    
    _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        print("Compra pendente...");
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          print("Erro na compra: ${purchaseDetails.error}");
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
                   purchaseDetails.status == PurchaseStatus.restored) {
          
          print("Compra bem-sucedida ou restaurada!");
          
          // Chamando o método para ativar o premium no GameService
          _gameService?.activatePremium();
        }
        
        if (purchaseDetails.pendingCompletePurchase) {
          _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }
}