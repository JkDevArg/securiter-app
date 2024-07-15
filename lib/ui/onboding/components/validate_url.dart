import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:securiter/api/Api.dart';
import 'package:securiter/utils/Pref.dart';

class ValidateUrlForm extends StatefulWidget {
  const ValidateUrlForm({
    super.key,
  });

  @override
  State<ValidateUrlForm> createState() => _ValidateUrlFormState();
}

class _ValidateUrlFormState extends State<ValidateUrlForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  final inputPhone = TextEditingController();

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
    StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;
  }

  void validateURLString(BuildContext context) {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });

    Future.delayed(const Duration(seconds: 1), () async {
      if (_formKey.currentState!.validate()) {
        final urlString = int.tryParse(inputPhone.text);
        if (urlString == null) {
          setState(() {
            isShowLoading = false;
          });
          error.fire();
          return;
        }

        final resp = await Api().verifiedURL(urlString.toString());

        if (resp?.data?['statusCode'] == 401 || resp?.data?['statusCode'] == 400) {
          error.fire();
          Future.delayed(const Duration(seconds: 2), () async {
            setState(() {
              isShowLoading = false;
            });
          });
        } else {
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isShowLoading = false;
            });
          });
          check.fire();
          confetti.fire();
          //Navigator.push(context, MaterialPageRoute(builder: (context) => const VDashboard()));
        }
      } else {
        error.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16, left: 7.0, right: 7.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  controller: inputPhone,
                  onSaved: (stringURL) {},
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.account_tree_outlined),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16, left: 7.0, right: 7.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      validateURLString(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7DE1F7),
                        minimumSize: const Size(double.infinity, 56),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25)))),
                    /*icon: const Icon(
                      CupertinoIcons.arrow_right,
                      color: Color(0xFF00FDFD),
                    ),*/
                    label: const Text("Enviar")),
              )
            ],
          ),
        ),
        isShowLoading
            ? CustomPositioned(
            child: RiveAnimation.asset(
              "assets/RiveAssets/check.riv",
              onInit: (artboard) {
                StateMachineController controller =
                getRiveController(artboard);
                check = controller.findSMI("Check") as SMITrigger;
                error = controller.findSMI("Error") as SMITrigger;
                reset = controller.findSMI("Reset") as SMITrigger;
              },
            ))
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
            child: Transform.scale(
              scale: 6,
              child: RiveAnimation.asset(
                "assets/RiveAssets/confetti.riv",
                onInit: (artboard) {
                  StateMachineController controller =
                  getRiveController(artboard);
                  confetti =
                  controller.findSMI("Trigger explosion") as SMITrigger;
                },
              ),
            ))
            : const SizedBox()
      ],
    );
  }
}
class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}