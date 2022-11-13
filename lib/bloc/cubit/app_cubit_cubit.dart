import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:yummly/data/cache_helper.dart';
import 'package:yummly/data/services.dart';
import 'package:yummly/ui/screnns/Buisniss/home_screnns.dart';
import 'package:yummly/ui/screnns/social/social_screnns.dart';
import 'package:yummly/ui/screnns/sports/sports.dart';

part 'app_cubit_state.dart';

class AppCubitCubit extends Cubit<AppCubitState> {
  AppCubitCubit() : super(AppCubitInitial());

  static AppCubitCubit get(context) => BlocProvider.of(context);

  //For Bootom Navigation Bar
  int currentIndex = 0;

  void changeScreenIndex(int index) {
    currentIndex = index;
    emit(AppCubitBottomNavState());
  }

//list Of BottomNavigationBar
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "business"),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_rounded), label: "Science"),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball_rounded), label: "sports"),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
  ];

//List Of Screens
  List<Widget> Screnns = [
    Buisniss(),
    ScienceScrenns(),
    SportsScrenns(),
    // SettingScrenns(),
  ];

//business call data(net)

  List<dynamic> business = [];

  void getBusiness() {

    emit(AppGetBusinessLodedState());
    RecipeApi.getData(url: "v2/top-headlines",
        query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '5acf45f1abff4cc983f2fe09a08c698b',
      }
    ).then((value) {
      // print(value.data['articles']);
      return business = value.data['articles'];
      // print(business[0]['content']);

      emit(AppGetBusinessSuccessState());

    }).catchError((onError) {
      print(onError.toString());
      emit(AppGetBusinessErrorState(onError.toString()));

    });
  }

//Sports call data(net)

List<dynamic> sports = [];
  void getSports(){
    emit(AppGetSportsLodedState());
    RecipeApi.getData(
        url: "v2/top-headlines",
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '5acf45f1abff4cc983f2fe09a08c698b',
        }).then((sport) {
          return sports = sport.data['articles'];
          print(sports[0]['content']);
          emit(AppGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetSportsErrorState(error));
    });
  }

//Science call data(net)
  List<dynamic> science = [];

  void getScience(){

    emit(AppGetScienceLodedState());

    RecipeApi.getData(
        url: "v2/top-headlines",
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '5acf45f1abff4cc983f2fe09a08c698b',
        }
    ).then((value) {
      return science = value.data['articles'];
      //print(science.length);

      emit(AppGetScienceSuccessState());

    }).catchError((onError){
      print(onError.toString());
      emit(AppGetScienceErrorState(onError));
    });
  }


//For Mode Theme
  var isDark = false;

  getChangeModeTheme({bool? darkfromShared}){
    if(darkfromShared != null){
      isDark =darkfromShared;
      emit(AppGetChangeModeTheme());
    }
     else{
      isDark =! isDark;
      CachHelper.putBoolData(key: 'isDark', value: isDark).then((value) {
        emit(AppGetChangeModeTheme());
      });
    }

  }


//for Search section

List<dynamic> search = [];

  void getSearch(String value){
     search = [];
    emit(AppGetSearchLodedState());
    RecipeApi.getData(
        url: 'v2/everything',
        query: {
          'd': '$value',
          'apiKey': '5acf45f1abff4cc983f2fe09a08c698b',
        }).then((value) {
          return search = value.data['articles'];
         // print(search[0]['title']);
          emit(AppGetSearchSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(AppGetSearchErrorState(onError));
    });
  }


}
