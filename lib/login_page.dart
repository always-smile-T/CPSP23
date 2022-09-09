
import 'package:do_st/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';
import 'login_bloc.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc bloc = LoginBloc();
  bool _showPass = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  void initState() => super.initState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.e2,AppTheme.e3],
              begin: Alignment.bottomCenter,
              end:  Alignment(-1.0, -0.25),
            ),
          ),
          width:  MediaQuery.of(context).size.width,
          height:  MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child:Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    child: doubleCicle(-100, 0, -100, 0, 1.7, 0, 0, -40)),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: doubleCicle(0,-100,0, -100,0, 1.7, -40, 0)),
                Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 120,),
                        Image.asset('assets/images/login.png',
                          width: 100,
                          height: 100,),
                        Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(20),
                          height: 450,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: StreamBuilder(
                                      stream: bloc.emailStream,
                                      builder: (context, snapshot) => TextField(
                                        cursorColor: Colors.black,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.black),
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                            labelText: "USERNAME",
                                            border: const OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Colors.black),
                                            ),
                                            focusedBorder: const OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Colors.black),
                                            ),
                                            errorText: snapshot.hasError
                                                ? snapshot.error.toString()
                                                : null,
                                            labelStyle: const TextStyle(
                                                color: Colors.black, fontSize: 15)),
                                      ))),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                                child: Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: <Widget>[
                                    StreamBuilder(
                                      stream: bloc.passStream,
                                      builder: (context, snapshot) => TextField(
                                        cursorColor: Colors.black,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.black),
                                        controller: _passController,
                                        obscureText: !_showPass,
                                        //cho nay true thi giau pass, con failse thi ...
                                        //cho nay true thi giau pass
                                        decoration: InputDecoration(
                                            labelText: "PASSWORD",
                                            border: const OutlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Colors.black),
                                            ),
                                            focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black),
                                            ),
                                            errorText: snapshot.hasError
                                                ? snapshot.error.toString()
                                                : null,
                                            labelStyle: const TextStyle(
                                                color: Colors.black, fontSize: 15)),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: onToggleShowPass,
                                        child: Image.asset(_showPass ? "assets/images/eye_x.png" : "assets/images/eye.png")
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ElevatedButton(
                                      onPressed: (){},
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            AppTheme.button),
                                        overlayColor: MaterialStateProperty.all<Color>(
                                            AppTheme.button),
                                        foregroundColor:
                                        // MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                                        MaterialStateProperty.all<Color>(
                                            AppTheme.button),
                                      ),
                                      child: const Text('SIGN IN',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                                ),
                              ),
                              const
                              Divider(
                                color: Colors.black,
                                height: 0,
                                thickness: 1.5,
                                // indent: 5,
                                //endIndent: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ElevatedButton.icon(
                                      icon: const Icon(Icons.add),
                                      // icon: const FaIcon(FontAwesomeIcons.google, color: Colors.black,),
                                      label: const Text('Sign Up With Google',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      onPressed: (){
                                        final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                                        provider.googleLogin();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                        overlayColor: MaterialStateProperty.all<Color>(
                                            Colors.white70),
                                        foregroundColor:
                                        // MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                                        MaterialStateProperty.all<Color>(
                                            Colors.white70),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      'Not register yet?',
                                      style: TextStyle(fontSize: 15, color: Colors.black54),
                                    ),
                                    TextButton(onPressed: (){
                                      /*Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegisterPage()));*/
                                    }, child: const Text('Create Account',style: TextStyle(fontSize: 15, color: Color(0xFF185DB7))))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 160,),
                      ],
                    )),
              ],
            ),
          )
      ),
    );
  }

  Widget doubleCicle(double t, double b, double r, double l, double t1, double b1, double r1, double l1){
    // bien k co so(vd: t,b,...) là cua hinh tron lớn. và ngược lại
    return Container(
      color: null,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: t != 0 ? (- MediaQuery.of(context).size.width/1.7) : null,
              left: l1 != 0 ? l1 : null,
              right: r1 != 0 ? r1 : null,
              bottom: b != 0 ? (- MediaQuery.of(context).size.width/1.7) : null,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.c1,
                  borderRadius: BorderRadius.circular(200),
                  gradient: const LinearGradient(
                    colors: [AppTheme.c1, AppTheme.c1],
                    begin: Alignment.bottomCenter,
                    end:  Alignment(-1.0, -0.5),
                  ),
                ),
          )),
          Positioned(
              right: r != 0 ? r : null,
              top: t != 0 ? t : null,
              left: l != 0 ? l : null,
              bottom: b != 0 ? b : null,
              child: Container(
                width: MediaQuery.of(context).size.width/1.4,
                height: MediaQuery.of(context).size.width/1.4,
                decoration: BoxDecoration(
                  color: AppTheme.e4,
                  borderRadius: BorderRadius.circular(200),
                  gradient: const LinearGradient(
                    colors: [AppTheme.e4, AppTheme.e4],
                    begin: Alignment.bottomCenter,
                    end:  Alignment(-1.0, -0.5),
                  ),
                ),
              )),
        ],
      ),
    );
  }
  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
