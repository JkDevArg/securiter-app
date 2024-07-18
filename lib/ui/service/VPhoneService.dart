import 'package:flutter/material.dart';
import 'package:securiter/ui/onboding/components/get_credits.dart';
import 'package:securiter/ui/onboding/components/validate_phone.dart';
import 'package:securiter/ui/onboding/components/validate_url.dart';
import 'package:securiter/widgets/WGFAppBar.dart';
import 'package:securiter/widgets/WTextCustom.dart';
import 'package:securiter/widgets/GFDrawerWidget.dart';


class VPhoneService extends StatefulWidget {
  const VPhoneService({super.key});

  @override
  State<VPhoneService> createState() => _VPhoneServiceState();
}

class _VPhoneServiceState extends State<VPhoneService> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    //Screen1(),
    //Screen2(),
    //Screen3(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WGFAppBar(),
      drawer: GFDrawerWidget(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WTextCustom(text: '  '),
            const ValidatePhoneForm(),
            //const ValidateUrlForm(),
            //const CreditsScreen()
          ],
        ),
        width: double.infinity,
        color: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // Cambiar la pantalla cuando se toca una opción
        currentIndex: _currentIndex, // Establecer la pantalla actual
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart_rounded),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
