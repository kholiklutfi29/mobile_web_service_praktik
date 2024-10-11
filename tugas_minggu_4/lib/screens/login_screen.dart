import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_minggu_4/data/dummy_user.dart';
import 'package:tugas_minggu_4/models/user.dart';
import 'package:tugas_minggu_4/screens/home_screen.dart';
import 'package:tugas_minggu_4/screens/widget/failed_dialog_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // teks controller untuk kedua text field
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // state yang mengatur terlihat atau tidaknya teks pada password textfield
  // juga mengatur pergantian icon pada suffixIcon
  bool _isObscured = true;

  // fungsi yang me return User sebagai object jika email dan password ada yang sesuai
  // dengan dummy data
  User? _login(String inputEmail, String inputPassword) {
    try {
      return dummyUsers.firstWhere(
        (user) => user.email == inputEmail && user.password == inputPassword,
      );
    } catch (e) {
      return null;
    }
  }

  // fungsi ketika login
  // jika berhasil maka masuk ke home screen
  // jika salah akan muncul show dialog
  void _onLogin(String inputEmail, String inputPassword) {
    final User? loginUser = _login(inputEmail, inputPassword);

    if (loginUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => HomeScreen(
            user: loginUser,
          ),
        ),
      );
      // reset text field
      _emailController.clear();
      _passwordController.clear();
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const FailedDialogContent(),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Ok"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 350,
                child: Image.asset('assets/login_2.png'),
              ),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'We missed you! Login to your account.',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  // icon pada awal text field
                  prefixIcon: Icon(CupertinoIcons.profile_circled),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: _isObscured, // teks disembunyikan
                decoration: InputDecoration(
                  hintText: "Password",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  prefixIcon: const Icon(CupertinoIcons.lock),
                  // icon pada akhir text field
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        // mengubah nilai state dari obsecure text
                        // dan icon yang digunakan untuk suffix icon
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: Icon(
                      _isObscured
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // login function
                    _onLogin(_emailController.text, _passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.all(12)),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
