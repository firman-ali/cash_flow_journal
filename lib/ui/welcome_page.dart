import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: _nameTextController,
                      decoration: const InputDecoration(hintText: 'Name'),
                    ),
                    TextField(
                      controller: _emailTextController,
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Daftar'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
