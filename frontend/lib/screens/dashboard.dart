import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      drawer: SideMenu(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 149, 255, 100),
        title: Text("Dashboard"),
      ),
    );
  }
}