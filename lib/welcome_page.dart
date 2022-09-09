import 'dart:math';

import 'package:do_st/app_theme.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppTheme.e2,AppTheme.e3],
                  begin: Alignment.bottomCenter,
                  end:  Alignment(-1.0, -0.25),
              ),
            ),
            width:  MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: -60,
                    right: -60,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      height: MediaQuery.of(context).size.width/1.35,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: AppTheme.e4,
                            spreadRadius: 20,
                            blurRadius: 60,
                            offset: Offset(10,10),
                          ),
                          BoxShadow(
                            color: AppTheme.e4,
                            spreadRadius: 20,
                            blurRadius: 60,
                            offset: Offset(10,10),
                          )
                        ],
                        borderRadius: BorderRadius.circular(120),
                        gradient: const LinearGradient(
                          colors: [AppTheme.e4, AppTheme.e4],
                          begin: Alignment.bottomCenter,
                          end:  Alignment(-1.0, -0.5),
                        ),
                      ),
                      transform: Matrix4.rotationX(pi/4),
                )),
                Positioned(
                  top: MediaQuery.of(context).size.width/2,
                    left: MediaQuery.of(context).size.width/6,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('One-to-one', style: TextStyle(
                            decoration: TextDecoration.none,
                              fontSize: 24,
                              color: Color(0xFF4085EE),
                              overflow: TextOverflow.clip,
                              fontWeight: FontWeight.bold
                          ),),
                          const Text('Student tutoring', style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 24,
                              color: Color(0xFF4085EE),
                              overflow: TextOverflow.clip,
                              fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(
                            height: 40,
                          ),
                          Image.asset('assets/images/welcome.png',
                            width: MediaQuery.of(context).size.width/1.6,
                            height: MediaQuery.of(context).size.width/1.6,)
                        ],
                      ))
              ],
            ),
    );
  }
}
