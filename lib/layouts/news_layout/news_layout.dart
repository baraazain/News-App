import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/cubit/them_cubit.dart';


class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            var mode = ThemCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('NEWS APP'),
                actions: [
                  IconButton(
                      onPressed: (){
                        NavigateTo(context,SearchScreen());
                      },
                      icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: (){
                        mode.changeMode();
                      },
                      icon: Icon(Icons.lightbulb))
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                items: cubit.items,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
              ),
            );
          },
        );
  }
}
