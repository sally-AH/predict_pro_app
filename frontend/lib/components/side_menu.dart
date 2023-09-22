import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          width: 288,
          height: double.infinity,
          color: Color.fromRGBO(124, 167, 197, 100),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoCard(
                  name: 'Sally AH',
                  position: 'Manager',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, top: 32, bottom: 16),
                  child: Text(
                    "Browse".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white70),
                  ),
                ),
               
                      (menu) => SideMenuItems(
                    menu: menu,
                    riveonInit: (artboard) {
                      StateMachineController controller =
                      RiveUtils.getRiveControoler(artboard,
                          stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI("active") as SMIBool;
                    },
                    press: () async {
                      menu.input?.change(true);
                      await Future.delayed(Duration(seconds: 2), () {
                        menu.input?.change(false);
                      });
                      setState(() {
                        selectedMenu = menu;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> menu.nav));
                    },
                    isActive: selectedMenu == menu,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
    required this.position,
  }) : super(key: key);
  final String name, position;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        position,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}