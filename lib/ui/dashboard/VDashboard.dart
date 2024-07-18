import 'package:flutter/material.dart';
import 'package:securiter/ui/dashboard/VDashboardCategories.dart';
import 'package:securiter/ui/dashboard/VDashboardHeader.dart';
import 'package:securiter/ui/onboding/components/CBottom.dart';
import 'package:securiter/ui/onboding/components/get_credits.dart';
import 'package:securiter/ui/onboding/components/validate_phone.dart';
import 'package:securiter/ui/onboding/components/validate_url.dart';
import 'package:securiter/widgets/WGFAppBar.dart';
import 'package:securiter/widgets/WTextCustom.dart';
import 'package:securiter/widgets/GFDrawerWidget.dart';


class VDashboard extends StatefulWidget {
  const VDashboard({super.key});

  @override
  State<VDashboard> createState() => _VDashboardState();
}

class _VDashboardState extends State<VDashboard> {
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
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WTextCustom(text: '  '),
                    //const CategoriesGrid(),
                    const ValidatePhoneForm(),
                    const ValidateUrlForm(),
                    //const CreditsScreen()


                    SizedBox(
                      width: MediaQuery.of(context).size.width * (100 / 100),
                      child: Container(
                          width: MediaQuery.of(context).size.width * (90 / 100),
                          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildBottomNavigationBarItemNoChecked(icon: Icon(Icons.home)),
                                _buildBottomNavigationBarItemNoChecked(icon: Icon(Icons.bar_chart)),
                                _buildBottomNavigationBarItemNoChecked(icon: Icon(Icons.person)),
                              ],
                            ),
                          )
                      ),
                    ),
                  ],
                ),
                width: double.infinity,
                color: Colors.white,
              ),
            ],
          ),

          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * (100 / 100),
              child: Container(
                width: MediaQuery.of(context).size.width * (90 / 100),
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildBottomNavigationBarItemChecked(text: 'Home', icon: Icons.home),
                      _buildBottomNavigationBarItemChecked(text: 'Analytics', icon: Icons.bar_chart),
                      _buildBottomNavigationBarItemChecked(text: 'Profile', icon: Icons.person),
                    ],
                  ),
                )
              ),
            ),
          ),

        ],
      ),
    );
  }


  Widget _buildBottomNavigationBarItemChecked({String? text, IconData? icon}){
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xFFD8F7FE),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xFF12D1F8),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                if(icon != null)
                Icon(icon, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Text(text ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBarItemNoChecked({String? text, Widget? icon}){
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3FDFF),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          if(icon != null)
            icon,
          Text(text ?? ''),
        ],
      ),
    );
  }

}
