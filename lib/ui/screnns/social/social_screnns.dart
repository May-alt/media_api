import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummly/bloc/cubit/app_cubit_cubit.dart';
import 'package:yummly/reusibale_widgets/resu_widgets.dart';

class ScienceScrenns extends StatefulWidget {
  const ScienceScrenns({Key? key}) : super(key: key);

  @override
  State<ScienceScrenns> createState() => _ScienceScrennsState();
}

class _ScienceScrennsState extends State<ScienceScrenns> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubitCubit,AppCubitState>(
        listener: (context, state) {},
        builder: (context, state) {

          var list = AppCubitCubit.get(context).science;

          if(state is !AppGetScienceLodedState){
            return ListView.separated(
              physics:BouncingScrollPhysics(),
              itemCount: list.length,
              separatorBuilder: (context, index) => ReusDivider(),
                itemBuilder: (context, index) {
                  return buildArticalItems(list[index],context);
                },
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(color: Colors.deepOrange,),
            );
          }
        },
    );
  }
}

