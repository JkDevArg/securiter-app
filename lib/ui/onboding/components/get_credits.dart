
/*import 'package:flutter/material.dart';
import 'package:securiter/api/api.dart';
import 'package:securiter/widgets/WTextCustom.dart';

class CreditsScreen extends StatefulWidget {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  _CreditsScreenState createState() => _CreditsScreenState();
}
class _CreditsScreenState extends State<CreditsScreen> {
  int? credits;

  @override
  void initState() {
    super.initState();
    _getCredits();
  }

  Future<void> _getCredits() async {
    try {
      final response = await Api().getMyCredits();
      print(response);
      if (response != null && response.statusCode == 200) {
        setState(() {
          credits = response.data['credits'];
        });
      } else {
        setState(() {
          credits = 0;
        });
      }
    } catch (e) {
      setState(() {
        credits = 0;
      });
    }
  }
}
*/