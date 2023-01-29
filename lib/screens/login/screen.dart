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
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //const SizedBox(width: 120, height: 120, child:Image(image: AssetImage('assets/graphics/logo.png'))),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Container(
              width: 325,
              height: 100,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(199, 208, 215, 1.0),
                  border: Border.all(
                    color: const Color.fromRGBO(199, 208, 215, 1.0),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              //color: Colors.grey,
              child: Column(
                children: [
                  Container(
                    height: 10,
                  ),
                  const Text(
                    'AppName TBD',
                    style: TextStyle(
                        color: Color.fromRGBO(182, 31, 35, 1.0), fontSize: 20),
                  ),
                  Container(
                    height: 20,
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),

            Container(
                width: 325,
                height: 220,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(199, 208, 215, 1.0),
                    border: Border.all(
                      color: const Color.fromRGBO(199, 208, 215, 1.0),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: const CompanyLoginInfo()),
            Container(height: 20),
            Container(
                width: 325,
                height: 220,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(199, 208, 215, 1.0),
                    border: Border.all(
                      color: const Color.fromRGBO(199, 208, 215, 1.0),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: const IndividualLoginInfo()),
          ],
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Company Login',
              style: TextStyle(
                  color: Color.fromRGBO(182, 31, 35, 1.0), fontSize: 20),
            ),
            Container(
              height: 25,
            ),
            SizedBox(
              width: 300,
              height: 35,
              child: CupertinoTextField(
                controller: controllerUserSignIn,
                placeholder: 'Username',
                placeholderStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
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
            Container(
              height: 15,
            ),
            SizedBox(
              width: 300,
              height: 35,
              child: CupertinoTextField(
                controller: controllerPassSignIn,
                placeholder: 'Password',
                placeholderStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
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
            Container(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: CupertinoButton(
                  color: Theme.of(context).colorScheme.background,
                  child: const Text("Sign In",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    List tryLogin = await companyLogin(
                        controllerUserSignIn.text, controllerPassSignIn.text);
                    if (tryLogin[0]) {
                      await rootBundle
                          .load('images/emptyProfile.jpg')
                          .then((value) => value.buffer.asUint8List());
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacementNamed('/Friend');
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Individual Login',
              style: TextStyle(
                  color: Color.fromRGBO(182, 31, 35, 1.0), fontSize: 20),
            ),
            Container(
              height: 25,
            ),
            SizedBox(
              width: 300,
              height: 35,
              child: CupertinoTextField(
                controller: controllerUserSignIn,
                placeholder: 'Username',
                placeholderStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
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
            Container(
              height: 15,
            ),
            SizedBox(
              width: 300,
              height: 35,
              child: CupertinoTextField(
                controller: controllerPassSignIn,
                placeholder: 'Password',
                placeholderStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
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
            Container(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: CupertinoButton(
                  color: Theme.of(context).colorScheme.background,
                  child: const Text("Sign In",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    List tryLogin = await login(
                        controllerUserSignIn.text, controllerPassSignIn.text);
                    if (tryLogin[0]) {
                      await rootBundle
                          .load('images/emptyProfile.jpg')
                          .then((value) => value.buffer.asUint8List());
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacementNamed('/Friend');
                    }
                  }),
            ),
          ]),
    );
  }
}
