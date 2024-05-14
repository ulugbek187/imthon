import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imthon/bloc/basket/basket_bloc.dart';
import 'package:imthon/bloc/evos_bloc/evos_bloc.dart';
import 'package:imthon/data/repositories/evos_repositories.dart';
import 'package:imthon/screens/routes.dart';
import 'package:imthon/utils/colors/app_colors.dart';

import '../data/repositories/basket_repo.dart';

class App extends StatelessWidget {
  App({
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(
      BuildContext context,
      ) {


    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => ProductRepo(),
        ),
        RepositoryProvider(
          create: (_) => BasketRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductBloc(
              context.read<ProductRepo>(),
            ),
          ),
          BlocProvider(
            create: (context) => BasketBloc(
              context.read<BasketRepo>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.white,
            ),
            scaffoldBackgroundColor: AppColors.white,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
            ),
          ),
          initialRoute: RouteNames.splashScreen,
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
