import 'package:flutter/material.dart';
import '../common/custom_textfield.dart';
import '../common/custome_dropdown.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  String accountType = 'Patient/User';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(Icons.favorite, color: Colors.green, size: 50),
                const SizedBox(height: 10),
                const Text("MediFinder", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text("Sign in to your account to access medical services"),
                const SizedBox(height: 20),

                CustomTextField(
                  label: "Email",
                  controller: emailCtrl,
                  icon: Icons.email,
                  validator: (val) => val!.contains('@') ? null : 'Enter a valid email',
                ),
                const SizedBox(height: 10),

                CustomTextField(
                  label: "Password",
                  controller: passwordCtrl,
                  icon: Icons.lock,
                  isPassword: true,
                  validator: (val) => val!.isEmpty ? 'Enter your password' : null,
                ),
                const SizedBox(height: 10),

                CustomDropdown(
                  label: "Account Type",
                  value: accountType,
                  items: const ['Patient/User', 'Admin'],
                  onChanged: (val) => setState(() => accountType = val!),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Dummy success UI
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login validation successful!')),
                      );
                    }
                  },
                  child: const Text("Sign In"),
                ),

                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  ),
                  child: const Text("Don't have an account? Register here", style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
