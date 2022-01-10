import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/settings/settings.dart';
import 'package:news_app/modules/sport/sport.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
     BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sport',
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'business',
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',
    ),
     BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'settings',
    ),
  ];

  List<Widget> screens = [
     SportScreen(),
     BusinessScreen(),
     ScienceScreen(),
     SettingsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if(index==0) {
      getSports();
    }
    else if(index==1){
        getBusiness();
    }
    else if(index==2){
      getScience();
    }
    emit(NewsChangeNavBarState());
  }

  List<dynamic> business=[];
  void getBusiness(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'business',
          'apikey':'e713ff9c5dbc4b318fb78093d9334757'
        }).then((value){
          business=value.data['articles'];
          emit(NewsGetBusinessSucsessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErorrState(error.toString()));
    });
  }

  List<dynamic> science=[];
  void getScience(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'science',
          'apikey':'e713ff9c5dbc4b318fb78093d9334757'
        }).then((value){
      science=value.data['articles'];
      emit(NewsGetScienceSucsessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErorrState(error.toString()));
    });
  }

  List<dynamic> sports=[];
  void getSports(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apikey':'e713ff9c5dbc4b318fb78093d9334757'
        }).then((value){
      sports=value.data['articles'];
      emit(NewsGetsportsSucsessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetsportsErorrState(error.toString()));
    });
  }

  List<dynamic> search=[];
  void getSearch(String value){
    DioHelper.getData(
        url: 'v2/everything',
        query:{
          'q':'$value',
          'apikey':'e713ff9c5dbc4b318fb78093d9334757'
        }).then((value){
      search=value.data['articles'];
      emit(NewsSearchSucsessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsSearchErorrState(error.toString()));
    });
  }


}
