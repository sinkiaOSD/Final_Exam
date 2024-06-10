import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainScreen.dart';
import 'package:flutter_application_1/models/loginUser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String userName = '';
  late String email = '';
  late String password = '';

  late String userNameError = '';

  Future<void> handleLoginPress() async {
    //await
    print('email: $email');
    print('password : $password');
    if (!EmailValidator.validate(email)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Warning!!'),
            icon: Icon(Icons.warning),
            content: Container(
              child: Text('Invalid Email!! PLease check your email '),
            ),
          );
        },
      );
      return;
    }
    print('Sending login request....');

    Uri uri = Uri.parse(
        'https://task-management-backend-vhcq.onrender.com/api/v1/registration');

    var payload = {
      'email': email,
      'password': password,
    };

    http.Response response = await http.post(uri, body: payload);
    print("login status code: ${response.statusCode}");
    print("login response body: ${response.body}");
    dynamic decoded = json.decode(response.body);
    print(decoded['data']);

    LoginUser loginUser = LoginUser.fromJson(decoded['data']);
    print(loginUser.email);
    print(loginUser.firstName);
    print(loginUser.lastName);
    print(loginUser.mobile);
    print(loginUser.photo);
    print(loginUser.password);

    print('token: ${decoded['token']}');

    //Navigator.of(context).pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text(
          'Welcome to Login Form!!',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Login Form',
              style: GoogleFonts.concertOne(
                textStyle: TextStyle(fontSize: 45, color: Colors.blueGrey),
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
              ),
            ),

            TextFormField(
                style: TextStyle(fontSize: 16),
                onChanged: (value) {
                  print('First Name : $value');
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                    label: Text('Email'),
                    icon: Icon(Icons.email),
                    hintText: 'Enter email',
                    hintStyle: TextStyle(color: Colors.grey))),
            TextFormField(
                style: TextStyle(fontSize: 16),
                onChanged: (value) {},
                decoration: InputDecoration(
                    label: Text('First Name'),
                    icon: Icon(Icons.person),
                    hintText: 'Enter first name',
                    hintStyle: TextStyle(color: Colors.grey))),
            TextFormField(
                style: TextStyle(fontSize: 16),
                onChanged: (value) {},
                decoration: InputDecoration(
                    label: Text('Last Name'),
                    icon: Icon(Icons.person),
                    hintText: 'Enter Last name',
                    hintStyle: TextStyle(color: Colors.grey))),
            TextFormField(
                style: TextStyle(fontSize: 16),
                onChanged: (value) {},
                decoration: InputDecoration(
                    label: Text('Mobile'),
                    icon: Icon(Icons.mobile_screen_share),
                    hintText: 'Enter mobile no',
                    hintStyle: TextStyle(color: Colors.grey))),
            TextFormField(
                style: TextStyle(fontSize: 16),
                onChanged: (value) {},
                decoration: InputDecoration(
                    label: Text('Roll'),
                    icon: Icon(Icons.picture_in_picture_outlined),
                    hintText: 'Enter photo',
                    hintStyle: TextStyle(color: Colors.grey))),
            TextFormField(
                style: TextStyle(fontSize: 16),
                onChanged: (value) {
                  print('password : $value');
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                  label: Text('Password'),
                  icon: Icon(Icons.key),
                  hintText: 'Enter password',
                  hintStyle: TextStyle(color: Colors.grey),
                )),
            //Text(userName)
            SizedBox(
              height: 30,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //    Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => const ShowScreen()));

            //   },
            //   child: Text('Register'),
            // ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainScreen()));
                  //Navigator.of(context).pop();
                },
                child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
