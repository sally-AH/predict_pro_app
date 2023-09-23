import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:predict_pro/menu/side_menu.dart';
import 'package:predict_pro/models/rive_asset.dart';
import 'package:predict_pro/rive_utils.dart';
import 'package:rive/rive.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late SMIBool isMenuClosed;
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

