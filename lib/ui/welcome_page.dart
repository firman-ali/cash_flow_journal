import 'package:cash_flow_journal/provider/preference_provider.dart';
import 'package:cash_flow_journal/ui/home_page.dart';
import 'package:cash_flow_journal/widget/biodata_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/undraw_judge.svg',
                height: size.height * 0.6,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width,
                  height: 320,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Register',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                'Enter Your Name and Email Address',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          BioTextField(
                            controller: _nameTextController,
                            label: 'Name',
                            hint: 'Sugi',
                            action: TextInputAction.next,
                          ),
                          BioTextField(
                            controller: _emailTextController,
                            hint: 'youremail@email.com',
                            label: 'Email',
                          ),
                          SizedBox(
                            width: size.width,
                            child: ElevatedButton(
                                onPressed: () {
                                  final formState = _formKey.currentState!;
                                  if (_nameTextController.text.isNotEmpty &&
                                      _emailTextController.text.isNotEmpty) {
                                    Provider.of<PreferencesProvider>(context,
                                            listen: false)
                                        .registerData(_nameTextController.text,
                                            _emailTextController.text);
                                    Navigator.pushReplacementNamed(
                                        context, HomePage.routeName);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Silahkan Isi Semua Form Field'),
                                      ),
                                    );
                                  }
                                },
                                child: const Text('Daftar')),
                          )
                        ],
                      ),
                    ),
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
