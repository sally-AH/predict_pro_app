import 'package:flutter/material.dart';
import 'package:predict_pro/chat_main.dart';
import 'package:predict_pro/contacts.dart';
import 'package:predict_pro/dashboard.dart';
import 'package:predict_pro/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _email='';
  String _password='';
  void _trySubmit(String email, String password) async {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid != null){
      _formKey.currentState?.save();
      print(email);
      print(password);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          "Login to your account",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700]
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextFormField(
                              validator: (value){
                                if(value!=null){
                                  if(value.isEmpty || !value.contains('@')){
                                    return 'Please Enter a valid email.';
                                  }
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: 'Email Address'
                              ),
                              onSaved: (value){
                                _email = value!;
                              },
                            ),
                            TextFormField(
                              validator: (value){
                                if(value!=null){
                                  if(value.isEmpty || value!.length < 7){
                                    return 'Password must be at leat 7 characters.';
                                  }
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Password'
                              ),
                              obscureText: true,
                              onSaved: (value){
                                _password = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 30, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: (){
                            _trySubmit(_email, _password);
                          },
                          color: Color(0xff0095FF),
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
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                        ),
                        TextButton(
                            child: const Text(
                              "sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                            }
                        )

                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 100),
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/background.png")
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}