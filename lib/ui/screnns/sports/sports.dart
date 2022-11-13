import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummly/bloc/cubit/app_cubit_cubit.dart';
import 'package:yummly/data/services.dart';
import 'package:yummly/reusibale_widgets/resu_widgets.dart';

class SportsScrenns extends StatefulWidget {
  const SportsScrenns({Key? key}) : super(key: key);

  @override
  State<SportsScrenns> createState() => _SportsScrennsState();
}

class _SportsScrennsState extends State<SportsScrenns> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitCubit,AppCubitState>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = AppCubitCubit.get(context).sports;

        if(state is ! AppGetSportsLodedState){
          return ListView.separated(
            physics:BouncingScrollPhysics(),
            itemCount: list.length,
            separatorBuilder: (context, index) {
              return ReusDivider();
            },
            itemBuilder: (context, index) {
              return buildArticalItems(list[index],context);
            },
          );
        }
        else{
          return Center(
            child: CircularProgressIndicator(color: Colors.deepOrangeAccent),
          );
        }
      },
    );
  }
}
