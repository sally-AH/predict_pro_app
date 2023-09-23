import 'package:predict_pro/chat.dart';
import 'package:predict_pro/chat_main.dart';
import 'package:predict_pro/contacts.dart';
import 'package:predict_pro/dashboard.dart';
import 'package:predict_pro/stock.dart';
import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  var nav;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
        required this.stateMachineName,
        required this.title,
        this.input,
        this.nav
      });
  set setInput(SMIBool status){
    input = status;
  }
}

List<RiveAsset> bottomNavs= [
  RiveAsset("assets/RiveAssets/icons.riv", artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/RiveAssets/icons.riv", artboard: "SEARCH", stateMachineName: "SEARCH_Interactivity", title: "Search"),
  RiveAsset("assets/RiveAssets/icons.riv", artboard: "TIMER", stateMachineName: "TIMER_Interactivity", title: "Chat"),
  RiveAsset("assets/RiveAssets/icons.riv", artboard: "BELL", stateMachineName: "BELL_Interactivity", title: "Notification"),
  RiveAsset("assets/RiveAssets/icons.riv", artboard: "USER", stateMachineName: "USER_Interactivity", title: "Profile"),
];

List<RiveAsset> sideMenu= [
  RiveAsset("assets/RiveAssets/icons.riv", artboard: "HOME", stateMachineName: "HOME_Interactivity", title: "Home", nav: Dashboard()),
  RiveAsset("assets/RiveAssets/iconss.riv", artboard: "RULES", stateMachineName: "State Machine 1", title: "Stock", nav: StockPage()),
  RiveAsset("assets/RiveAssets/iconss.riv", artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat", nav: Contacts()),
  RiveAsset("assets/RiveAssets/iconss.riv", artboard: "USER", stateMachineName: "USER_Interactivity", title: "Profile", nav: Dashboard()),
  RiveAsset("assets/RiveAssets/iconss.riv", artboard: "BELL", stateMachineName: "BELL_Interactivity", title: "Notification", nav: Dashboard()),
  RiveAsset("assets/RiveAssets/iconss.riv", artboard: "SETTINGS", stateMachineName: "SETTINGS_Interactivity", title: "Settings", nav: Dashboard()),
  RiveAsset("assets/RiveAssets/iconss.riv", artboard: "EXIT", stateMachineName: "state_machine", title: "Logout", nav: Dashboard()),

];