import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamuhack/globals/app_colors.dart';

import '../../backend/User/login.dart';
import '../../backend/User/company_login.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/citybg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.30),
        body: Padding(
          padding: const EdgeInsets.only(left: 43.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Friendscape',
                style: TextStyle(
                    color: AppColors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              //const Divider(),
              //const SizedBox(width: 120, height: 120, child:Image(image: AssetImage('assets/graphics/logo.png'))),
              Container(
                child: const Image(
                    image: AssetImage('images/logo.png'),
                    width: 110,
                    height: 110),
              ),
              //const Divider(),
              Container(
                  alignment: Alignment.center,
                  width: 325,
                  height: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(199, 208, 215, 1.0),
                      border: Border.all(
                        color: const Color.fromRGBO(199, 208, 215, 1.0),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: const CompanyLoginInfo()),
              //const Divider(),
              Container(
                  alignment: Alignment.center,
                  width: 325,
                  height: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(199, 208, 215, 1.0),
                      border: Border.all(
                        color: const Color.fromRGBO(199, 208, 215, 1.0),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: const IndividualLoginInfo()),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyLoginInfo extends StatefulWidget {
  const CompanyLoginInfo({Key? key}) : super(key: key);

  @override
  State<CompanyLoginInfo> createState() => _CompanyLoginInfoState();
}

class _CompanyLoginInfoState extends State<CompanyLoginInfo> {
  //final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  final controllerUserSignIn = TextEditingController();
  final controllerPassSignIn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Company Login',
              style: TextStyle(
                  color: Color.fromRGBO(182, 31, 35, 1.0),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            //const Divider(),
            SizedBox(
              width: 300,
              //height: 35,
              child: CupertinoTextField(
                controller: controllerUserSignIn,
                placeholder: 'Username',
                placeholderStyle: TextStyle(color: AppColors.steelblue),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            //const Divider(),
            SizedBox(
              width: 300,
              //height: 35,
              child: CupertinoTextField(
                controller: controllerPassSignIn,
                placeholder: 'Password',
                placeholderStyle: TextStyle(color: AppColors.steelblue),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            //const Divider(),
            SizedBox(
              width: 250,
              child: CupertinoButton(
                  color: AppColors.lightblue,
                  child: const Text("Sign In",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    List tryLogin = await companyLogin(
                        controllerUserSignIn.text, controllerPassSignIn.text);
                    if (tryLogin[0]) {
                      await rootBundle
                          .load('images/emptyProfile.jpg')
                          .then((value) => value.buffer.asUint8List());
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacementNamed('/Home');
                    }
                  }),
            ),
          ]),
    );
  }
}

class IndividualLoginInfo extends StatefulWidget {
  const IndividualLoginInfo({Key? key}) : super(key: key);

  @override
  State<IndividualLoginInfo> createState() => _IndividualLoginInfoState();
}

class _IndividualLoginInfoState extends State<IndividualLoginInfo> {
  //final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  final controllerUserSignIn = TextEditingController();
  final controllerPassSignIn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Individual Login',
              style: TextStyle(
                  color: Color.fromRGBO(182, 31, 35, 1.0),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            //const Divider(),
            SizedBox(
              width: 300,
              //height: 35,
              child: CupertinoTextField(
                controller: controllerUserSignIn,
                placeholder: 'Username',
                placeholderStyle: TextStyle(color: AppColors.steelblue),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            //const Divider(),
            SizedBox(
              width: 300,
              //height: 35,
              child: CupertinoTextField(
                controller: controllerPassSignIn,
                placeholder: 'Password',
                placeholderStyle: TextStyle(color: AppColors.steelblue),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            //const Divider(),
            SizedBox(
              width: 250,
              child: CupertinoButton(
                  color: AppColors.lightblue,
                  child: const Text("Sign In",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    List tryLogin = await login(
                        controllerUserSignIn.text, controllerPassSignIn.text);
                    if (tryLogin[0]) {
                      await rootBundle
                          .load('images/emptyProfile.jpg')
                          .then((value) => value.buffer.asUint8List());
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacementNamed('/Home');
                    }
                  }),
            ),
          ]),
    );
  }
}
