part of 'app_cubit_cubit.dart';

@immutable
abstract class AppCubitState {}

class AppCubitInitial extends AppCubitState {}

//For Bootom Navigation Bar
class AppCubitBottomNavState extends AppCubitState{}

//For business
class AppGetBusinessLodedState extends AppCubitState{}
class AppGetBusinessSuccessState extends AppCubitState{}
class AppGetBusinessErrorState extends AppCubitState{
  final String errro;
  AppGetBusinessErrorState(this.errro);
}

//For Sports
class AppGetSportsLodedState extends AppCubitState{}
class AppGetSportsSuccessState extends AppCubitState{}
class AppGetSportsErrorState extends AppCubitState{
  final String errro;
  AppGetSportsErrorState(this.errro);
}

//For Science

class AppGetScienceLodedState extends AppCubitState{}
class AppGetScienceSuccessState extends AppCubitState{}
class AppGetScienceErrorState extends AppCubitState{
  final String Error ;
  AppGetScienceErrorState(this.Error);
}

//For Mode Theme
class AppGetChangeModeTheme extends AppCubitState{}

//For Search Section

class AppGetSearchLodedState extends AppCubitState{}
class AppGetSearchSuccessState extends AppCubitState{}
class AppGetSearchErrorState extends AppCubitState{
  final String Error;
  AppGetSearchErrorState(this.Error);
}