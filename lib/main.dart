import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/them_cubit.dart';
import 'package:news_app/shared/cubit/them_state.dart';
import 'package:news_app/shared/network/local/shared_preferance.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'layouts/news_layout/news_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  int? isDark = CacheHelper.getMode(key: 'isDark');
  if (isDark == null) {
    isDark = 0;
  }
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final int isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ThemCubit()..changeMode(fromeshared: isDark)),
        BlocProvider(create: (context) => NewsCubit()..getSports()),
      ],
      child: BlocConsumer<ThemCubit, ThemState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var mode = ThemCubit.get(context);
          return MaterialApp(
            home: NewsApp(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    color: Colors.white,
                    elevation: 0.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    )),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20,
                )),
            darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    color: HexColor('333739'),
                    elevation: 0.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    )),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor('333739'),
                  elevation: 20,
                )),
            themeMode: mode.isDark ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
