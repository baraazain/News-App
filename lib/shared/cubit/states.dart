abstract class NewsStates{}

class NewsIntialState extends NewsStates{}
class NewsChangeNavBarState extends NewsStates{}

class NewsGetBusinessSucsessState extends NewsStates{}
class NewsGetBusinessErorrState extends NewsStates{
   final String error;
  NewsGetBusinessErorrState(this.error);
}

class NewsGetScienceSucsessState extends NewsStates{}
class NewsGetScienceErorrState extends NewsStates{
  final String error;

  NewsGetScienceErorrState(this.error);
}

class NewsGetsportsSucsessState extends NewsStates{}
class NewsGetsportsErorrState extends NewsStates{
  final String error;

  NewsGetsportsErorrState(this.error);
}

class NewsSearchSucsessState extends NewsStates{}
class NewsSearchErorrState extends NewsStates{
  final String error;

  NewsSearchErorrState(this.error);
}


