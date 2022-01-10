import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    var cubit=NewsCubit.get(context);
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'cant search with empty value';
                    }
                    return null;
                  },
                  onChanged: (value){
                    cubit.getSearch(value);
                  },
                  controller:controller ,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('Search'),
                    prefixIcon: Icon(Icons.search),
                    border:OutlineInputBorder(),
                  ),
                ),
                Expanded(child: NewsBuilder(cubit.search, context,true))
              ],
            ),
          ),
        );
      },
    );
  }
}
