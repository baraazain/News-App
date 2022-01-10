import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/them_state.dart';
import 'package:news_app/shared/network/local/shared_preferance.dart';

class ThemCubit extends Cubit<ThemState>{
  ThemCubit() : super(ThemModeInitialState());

  static ThemCubit get(context)=>BlocProvider.of(context);

  bool isDark=false;
  void changeMode({ int? fromeshared})
  {
    if (fromeshared ==0) {}
    else if(fromeshared==1){
      isDark = false;
      emit(ThemModeState());
    }
   else if(fromeshared==2){
      isDark = true;
      emit(ThemModeState());

    }

    else{
      isDark=!isDark;
      if(isDark==false)
      CacheHelper.putMode(key: 'isDark', value: 1);
      if(isDark==true)
        CacheHelper.putMode(key: 'isDark', value: 2);
      emit(ThemModeState());
    }

  }
}