import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummly/bloc/cubit/app_cubit_cubit.dart';
import 'package:yummly/constants/theme_constat.dart';
import 'package:yummly/data/cache_helper.dart';
import 'package:yummly/data/services.dart';

import 'package:yummly/ui/navigation_bottom_bar/navigation_screnns.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RecipeApi.init();
  await CachHelper.init();

  bool? isDark = CachHelper.getBoolData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  // const MyApp({super.key});
  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context)
            => AppCubitCubit()..getChangeModeTheme(darkfromShared: isDark)..getBusiness()..getScience()..getSports() ,
          ),

        ],
        child:  BlocConsumer<AppCubitCubit, AppCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              // theme: ligth,
             theme: ligthTheme,

              darkTheme: darkTheme,

              debugShowCheckedModeBanner: false,
              themeMode: AppCubitCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: Directionality(
                  textDirection: TextDirection.rtl,
                  child: NavigationBottomScrenns()),
            );
          },
        ),
    );
  }
}

