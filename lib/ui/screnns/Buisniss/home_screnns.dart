import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummly/bloc/cubit/app_cubit_cubit.dart';
import 'package:yummly/reusibale_widgets/resu_widgets.dart';

class Buisniss extends StatefulWidget {
  const Buisniss({Key? key}) : super(key: key);

  @override
  State<Buisniss> createState() => _BuisnissState();
}

class _BuisnissState extends State<Buisniss> {
  @override
  Widget build(BuildContext context) {
  return BlocConsumer<AppCubitCubit,AppCubitState>(
      listener: (context, state) { },
      builder: (context, state) {

        var list = AppCubitCubit.get(context).business;
        //return body with data

        if(state is! AppGetBusinessLodedState){
           return ListView.separated(
              physics:BouncingScrollPhysics(),
              itemCount: list.length,
              separatorBuilder: (context, index) {
                return ReusDivider();
              },
              itemBuilder: (context, index){
                return buildArticalItems(list[index],context);
              }
          );
        }
        else{
          //feedBack
          return Center(
            child:  CircularProgressIndicator(color: Colors.deepOrangeAccent),
            // child: Text("hgffxafguiumhlhvcv"),
          );
        }
      },
    );
  }





}


