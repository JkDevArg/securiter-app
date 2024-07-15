import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show AnimatedPositioned, BackdropFilter, BuildContext, Column, CrossAxisAlignment, EdgeInsets, Image, MaterialPageRoute, MediaQuery, Padding, Positioned, SafeArea, Scaffold, SizedBox, Spacer, Stack, State, StatefulWidget, Text, TextStyle, Widget;
import 'package:rive/rive.dart';
import 'package:securiter/ui/dashboard/VDashboard.dart';
import 'package:securiter/ui/onboding/components/animated_btn.dart';
import 'package:securiter/ui/onboding/components/custom_sign_in.dart';
import 'package:securiter/utils/Pref.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    super.initState();
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    //_checkToken();
  }

  Future<void> _checkToken() async {
    String token = await Pref().getToken();
    if (token.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VDashboard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                width: MediaQuery.of(context).size.width * 1.7,
                bottom: 200,
                left: 100,
                child: Image.asset('assets/Backgrounds/Spline.png')),
            Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                )),
            const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
            Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                  child: const SizedBox(),
                )),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 240),
              top: isSignInDialogShown ? -50 : 0,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        const SizedBox(
                          width: 260,
                          child: Column(children: [
                            Text(
                              "Securiter",
                              style: TextStyle(
                                  fontSize: 55, fontFamily: "Poppins", height: 1.2),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                                "Stay safe with our app that blocks those annoying SPAMS!.")
                          ]),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        AnimatedBtn(
                          btnAnimationController: _btnAnimationController,
                          press: () {
                            _btnAnimationController.isActive = true;
                            Future.delayed(const Duration(milliseconds: 800), () {
                              setState(() {
                                isSignInDialogShown = true;
                              });
                              customSigninDialog(context, onClosed: (_) {
                                setState(() {
                                  isSignInDialogShown = false;
                                });
                              });
                            });
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.0),
                          child: Text(
                            "Application that protects you against fraud, spam and identity theft!",
                            style: TextStyle(),
                          ),
                        )
                      ]),
                ),
              ),
            )
          ],
        ));
  }
}
