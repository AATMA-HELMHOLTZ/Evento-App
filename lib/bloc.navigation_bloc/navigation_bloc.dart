import 'package:bloc/bloc.dart';
import 'package:flutter_app/Screens/homepage.dart';
import 'package:flutter_app/Screens/history.dart';
import 'package:flutter_app/Screens/aboutUs.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  HistoryClickedEvent,
  AboutUsClickedEvent,
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
      case NavigationEvents.HistoryClickedEvent:
        yield HistoryPage();
        break;
      case NavigationEvents.AboutUsClickedEvent:
        yield AboutUs();
        break;
    }
  }
}