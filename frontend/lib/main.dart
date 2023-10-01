import 'package:flutter/material.dart';
import 'package:predict_pro/contacts.dart';
import 'package:predict_pro/dashboard.dart';
import 'package:predict_pro/firebase_api.dart';
import 'package:predict_pro/item.dart';
import 'package:predict_pro/login.dart';
import 'package:predict_pro/menu/side_menu.dart';
import 'package:predict_pro/services/local_services/providers/items_provider.dart';
import 'package:predict_pro/signup.dart';
import 'package:predict_pro/chat.dart';
import 'package:predict_pro/services/user_service.dart';
// Import the generated file
import 'package:firebase_core/firebase_core.dart';
import 'package:predict_pro/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:predict_pro/stock.dart';
import 'package:provider/provider.dart';
import 'package:predict_pro/services/local_services/providers/categories_provider.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();



  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=> CategoriesProvider(categories: [])),
        ChangeNotifierProvider(create: (ctx)=> ItemsProvider(items: [])),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: StockPage(),
        // home: ItemPage(),
        // home: ChatPage(),
        // home: HomePage(),
        // home: Contacts(),
        // home: SideMenu(),
        home: Dashboard(),
        routes: {
          "/items": (context) =>  ItemPage(),
        },
      ),
    )
  );
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});


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
