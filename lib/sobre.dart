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
              'Nossa Companhia',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Somos uma companhia que preza pela qualidade dos produtos entregues. Temos um time de alta qualidade que busca oferecer o melhor atendimento ao usuário e que busca continua aprimorando a qualidade de serviço.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Entre em contato conosco',
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
