import 'package:flutter/material.dart';

import '../common/custom_textfield.dart';
import '../common/custome_dropdown.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
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
                const Text("Create your account to access medical services"),
                const SizedBox(height: 20),

                CustomTextField(
                  label: "Full Name",
                  controller: nameCtrl,
                  icon: Icons.person,
                  validator: (val) => val!.isEmpty ? 'Enter your full name' : null,
                ),
                const SizedBox(height: 10),

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
                  validator: (val) => val!.length < 6 ? 'Minimum 6 characters required' : null,
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registration validation successful!')),
                      );
                    }
                  },
                  child: const Text("Create Account"),
                ),

                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  ),
                  child: const Text("Already have an account? Sign in here", style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
