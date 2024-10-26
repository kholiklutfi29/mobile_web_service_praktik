import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_minggu_5/screens/home_screen.dart';
import 'package:tugas_minggu_5/services/auth_service.dart';
import 'package:tugas_minggu_5/widgets/snackbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // teks controller untuk kedua text field
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // state yang mengatur terlihat atau tidaknya teks pada password textfield
  // juga mengatur pergantian icon pada suffixIcon
  bool _isObscured = true;

  void _register() async {
    String res = await AuthService().register(
      email: _emailController.text,
      password: _passwordController.text,
      name: _usernameController.text,
    );

    if (res == 'success') {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(
          ),
        ),
      );
    } else {
      showSnackBar(context, res);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50]!.withOpacity(0.95),
      body: SafeArea(
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
                  child: Image.asset('assets/images/register_image.png'),
                ),
                Text(
                  'Welcome!',
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
                  'Join us today! Create your account.',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Username",
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
                    prefixIcon: Icon(CupertinoIcons.mail),
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
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
