import 'package:fic7_multistore/bloc/banners/banners_bloc.dart';
import 'package:fic7_multistore/bloc/categories/categories_bloc.dart';
import 'package:fic7_multistore/bloc/checkout/checkout_bloc.dart';
import 'package:fic7_multistore/bloc/logout/logout_bloc.dart';
import 'package:fic7_multistore/bloc/order/order_bloc.dart';
import 'package:fic7_multistore/bloc/product/products_bloc.dart';
import 'package:fic7_multistore/data/datasources/auth_local_datasource.dart';
import 'package:fic7_multistore/ui/auth/auth_page.dart';
import 'package:fic7_multistore/ui/dashboard/dashboard_page.dart';
// import 'package:fic7_multistore/ui/splash/splash_page.dart';
import 'package:fic7_multistore/utils/light_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/register/register_bloc.dart';
import 'bloc/login/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc(),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) => BannersBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: light,
        home: FutureBuilder<bool>(
            future: AuthLocalDatasource().isLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data == true) {
                return const DashboardPage();
              } else {
                return const AuthPage();
              }
            }),
      ),
    );
  }
}
