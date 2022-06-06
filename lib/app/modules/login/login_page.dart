import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff0092b9),
              Color(0xff0167b2),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(
                height: screenSize.height * .1,
              ),
              SizedBox(
                height: 49,
                width: screenSize.width * .8,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/google.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
