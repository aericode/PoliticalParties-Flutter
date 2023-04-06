import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre nós'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),*/
            Text(
              'Our Company',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'We are a company that specializes in creating innovative and user-friendly mobile applications. Our team consists of experienced developers who are passionate about creating high-quality products that meet the needs of our users.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email: info@ourcompany.com\nPhone: (123) 456-7890\nAddress: 123 Main St, Anytown USA',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
