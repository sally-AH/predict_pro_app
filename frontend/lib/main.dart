import 'package:flutter/material.dart';
import 'package:predict_pro/contacts.dart';
import 'package:predict_pro/dashboard.dart';
import 'package:predict_pro/firebase_api.dart';
import 'package:predict_pro/login.dart';
import 'package:predict_pro/menu/side_menu.dart';
import 'package:predict_pro/signup.dart';
import 'package:predict_pro/chat.dart';
import 'package:predict_pro/services/user_service.dart';
// Import the generated file
import 'package:firebase_core/firebase_core.dart';
import 'package:predict_pro/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:predict_pro/stock.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();


  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');
  //
  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //   }
  // });


  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: StockPage(),
        // home: ChatPage(),
        // home: HomePage(),
        // home: Contacts(),
        // home: SideMenu(),
        home: Dashboard(),
      )
  );
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _loadUserInfo() async {
    String token = await getToken();
    if(token == ""){
      // Navigator.of(context as BuildContext).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route)=> false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Welcome",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Predict Pro Application",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height/3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome.png")
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    },
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                    },
                    color: const Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
