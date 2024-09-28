import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyFormField(),
  ));
}

class MyFormField extends StatefulWidget {
  const MyFormField({super.key});

  @override
  State<MyFormField> createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  void login() {
    formKey.currentState?.validate();
  }

  final formKey = GlobalKey<FormState>();

  final inputUsernameController = TextEditingController();
  final inputPasswordController = TextEditingController();

  final ValueNotifier<int> rxUserCharacter = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    inputUsernameController.addListener(() {
      rxUserCharacter.value = inputUsernameController.text.length;
      print('username is: ${inputUsernameController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_MyFormFieldState build');
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 800,
                color: Colors.red,
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                )),
              ),
              TextField(
                controller: inputUsernameController,
                decoration: const InputDecoration(hintText: 'Username'),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Value must be not empty';
                //   }
                //   return null;
                // },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.shield_outlined,
                      color: Colors.blue,
                    ),
                    hintText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Value must be not empty';
                  }
                  return null;
                },
                obscureText: true,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.shield_outlined,
                      color: Colors.blue,
                    ),
                    hintText: 'Password 111111'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Value must be not empty';
                  }
                  return null;
                },
                obscureText: true,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.shield_outlined,
                      color: Colors.blue,
                    ),
                    hintText: 'Password 222'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Value must be not empty';
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 30),
              TextButton(onPressed: login, child: const Text('Login')),
              const SizedBox(height: 30),
              ValueListenableBuilder(
                valueListenable: rxUserCharacter,
                builder: (context, value, child) {
                  print('rxUserCharacter build');

                  return Text('username character count: $value');
                },
              ),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
