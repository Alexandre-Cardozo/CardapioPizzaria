import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizza_hut/components/carrinho/carrinho_com_conteudo.dart';
import 'package:pizza_hut/components/carrinho/carrinho_vazio.dart';
import 'package:pizza_hut/components/gerenciar_pedidos/gerenciar_pedidos_widget.dart';
import 'package:pizza_hut/components/historico_pedidos/historico_pedidos_widget.dart';
import 'package:pizza_hut/components/login_administrador/login_administrador_widget.dart';
import 'package:pizza_hut/components/menu_gerenciamento/menu_gerenciamento_widget.dart';
import 'package:pizza_hut/components/menu_mesas/menu_mesas_widget.dart';
import 'package:pizza_hut/components/menu_produtos/menu_produtos_widget.dart';
import 'package:pizza_hut/components/pix/pix.dart';
import 'package:pizza_hut/components/menu/menu.dart';
import 'package:pizza_hut/components/registrar_produto/registrar_produto_widget.dart';
import 'package:provider/provider.dart';

import '../../components/pedido/pedido.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;

  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => Menu(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => Menu(),
        ),
        FFRoute(
          name: 'Menu',
          path: '/Menu',
          builder: (context, params) => Menu(),
        ),
        FFRoute(
          name: 'CarrinhoComConteudo',
          path: '/carrinhoComConteudo',
          builder: (context, params) => CarrinhoComConteudo(),
        ),
        FFRoute(
          name: 'Pedido',
          path: '/Pedido',
          builder: (context, params) => Pedido(),
        ),
        FFRoute(
          name: 'PagamentoPorPix',
          path: '/pagamentoPorPix',
          builder: (context, params) => Pix(),
        ),
        FFRoute(
          name: 'GerenciarPedidos',
          path: '/gerenciarPedidos',
          builder: (context, params) => GerenciarPedidosWidget(),
        ),
        FFRoute(
          name: 'HistoricoPedidos',
          path: '/historicoPedidos',
          builder: (context, params) => HistoricoPedidosWidget(),
        ),
        FFRoute(
          name: 'MenuProdutos',
          path: '/menuProdutos',
          builder: (context, params) => MenuProdutosWidget(),
        ),
        FFRoute(
          name: 'RegistrarProduto',
          path: '/registrarProduto',
          builder: (context, params) => RegistrarProdutoWidget(),
        ),
        FFRoute(
          name: 'MenuMesas',
          path: '/menuMesas',
          builder: (context, params) => MenuMesasWidget(),
        ),
        FFRoute(
          name: 'LoginAdministrador',
          path: '/loginAdministrador',
          builder: (context, params) => LoginAdministradorWidget(),
        ),
        FFRoute(
          name: 'CarrinhoVazio',
          path: '/carrinhoVazio',
          builder: (context, params) => const CarrinhoVazio(),
        ),
        FFRoute(
          name: 'MenuGerenciamento',
          path: '/menuGerenciamento',
          builder: (context, params) => MenuGerenciamentoWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};

  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);

  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));

  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;

  bool get hasFutures => state.allParams.entries.any(isAsyncParam);

  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);

  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
