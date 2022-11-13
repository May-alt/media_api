import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummly/bloc/cubit/app_cubit_cubit.dart';
import 'package:yummly/data/services.dart';
import 'package:yummly/reusibale_widgets/resu_widgets.dart';



class SearchScreens extends StatelessWidget {
  const SearchScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return BlocConsumer<AppCubitCubit, AppCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubitCubit.get(context).search;

        return  Scaffold(
          appBar: AppBar(
            title: Text("Search"),
          ),
          body: Column(
            children: [

              Padding(
                padding: EdgeInsets.all(20.0),
                child: ReusTextFormFiled(
                    controller: searchController,
                    hintText: "Search ...",
                    prefixIcon: Icon(Icons.search),
                    onChanged: (value) {

                      AppCubitCubit.get(context).getSearch(value);

                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez saisir une adresse e-mail.";
                      }
                      return null;
                    }),
              ),


              Expanded(
                child:  ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: list.length,
                    separatorBuilder: (context, index) {
                      return ReusDivider();
                    },
                    itemBuilder: (context, index) {
                      return buildArticalItems(list[index], context);
                    }),
              ),

           ],
          ),






        );
      },
    );
  }
}

