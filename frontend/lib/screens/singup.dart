import 'package:flutter/material.dart';
import 'package:frontend/screens/contacts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create an account, It's free ",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          validator: (value) {
                            if (value != null) {
                              if (value.length < 5) {
                                return 'Please Enter a valid username.';
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'Username'),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Please Enter a valid email.';
                              }
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(labelText: 'Email Address'),
                        ),

                        TextFormField(
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty || value!.length < 7) {
                                return 'Password must be at leat 7 characters.';
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                    
                    },
                    color: Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Contacts()));
                        },
                        child: Text(
                          " Login",
                          style:
                          TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
