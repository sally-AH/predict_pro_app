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
                  ...sideMenu.map(
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
class SideMenuItems extends StatelessWidget {
  const SideMenuItems({
    Key? key,
    required this.menu,
    required this.press,
    required this.riveonInit,
    required this.isActive,
  }) : super(key: key);

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            height: 56,
            width: isActive ? 288 : 0,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 149, 255, 100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          ListTile(
            onTap: press,
            leading: SizedBox(
              height: 34,
              width: 34,
              child: RiveAnimation.asset(
                menu.src,
                artboard: menu.artboard,
                onInit: riveonInit,
              ),
            ),
            title: Text(
              menu.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ],
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