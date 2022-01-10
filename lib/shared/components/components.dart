import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view.dart';

Widget NewsItems(article,context){
  return InkWell(
    onTap: (){
      NavigateTo(context,WebViewScreen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image:DecorationImage(
                   image: NetworkImage('${article['urlToImage']}'),
                  fit:BoxFit.cover
                ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow:TextOverflow.ellipsis ,
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow:TextOverflow.ellipsis,
                        color: Colors.grey
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
Widget NewsBuilder(list,context,bool isSearch){
  return ConditionalBuilder(
      condition: list.length >0,
      builder:(context)=>ListView.separated(
        physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=>NewsItems(list[index],context),
      separatorBuilder: (context,index)=>Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
      itemCount: list.length),
  fallback:(context)=>isSearch?Center():Center(child:CircularProgressIndicator()));

}
void NavigateTo(context,widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}
