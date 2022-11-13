import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummly/bloc/cubit/app_cubit_cubit.dart';
import 'package:yummly/data/services.dart';
import 'package:yummly/reusibale_widgets/resu_widgets.dart';
import 'package:yummly/ui/screnns/search/search_screens.dart';

class NavigationBottomScrenns extends StatefulWidget {
  const NavigationBottomScrenns({Key? key}) : super(key: key);

  @override
  State<NavigationBottomScrenns> createState() =>
      _NavigationBottomScrennsState();
}

class _NavigationBottomScrennsState extends State<NavigationBottomScrenns> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubitCubit, AppCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubitCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text("News-API"),
              centerTitle: false,
              actions: [
                IconButton(
                  onPressed: () {

                    ReusNavigationToPage(context, SearchScreens());
                  },
                  icon: Icon(Icons.search),
                ),

                IconButton(
                  onPressed: () {
                    AppCubitCubit.get(context).getChangeModeTheme();
                  },
                  icon: Icon(Icons.settings),
                ),

              ],
            ),
            body: cubit.Screnns[cubit.currentIndex],

            // floatingActionButton: FloatingActionButton(
            //   onPressed: (){
            //     RecipeApi.getData(url: "v2/top-headlines", query: {
            //     'country': 'eg',
            //     'category': 'business',
            //     'apiKey': '5acf45f1abff4cc983f2fe09a08c698b',
            //   }).then((value) {
            //     print(value.data['articles'][0]['title']);
            //     // return business = value.data['articles'];
            //     // print(business[0]['title']);
            //
            //
            //   }).catchError((onError) {
            //     print(onError.toString());
            //
            //
            //
            //   });},
            //   child: Icon(Icons.add),
            // ),

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index) {
                cubit.changeScreenIndex(index);
              },
            ),
          );
        },

    );
  }
}
