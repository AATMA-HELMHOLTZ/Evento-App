import 'package:bloc/bloc.dart';
import 'package:flutter_app/Screens/homepage.dart';
import 'package:flutter_app/Screens/myaccountspage.dart';
import 'package:flutter_app/Screens/suggestions.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  SuggestionsClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.SuggestionsClickedEvent:
        yield Suggestions();
        break;
    }
  }
}