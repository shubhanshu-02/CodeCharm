import 'package:code_charm/components/custom_text_field.dart';
import 'package:code_charm/components/heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:code_charm/constants/colors.dart';

class AuthScreen extends StatefulWidget {
  final Function(String)? onAuthSuccess;

  const AuthScreen({super.key, this.onAuthSuccess});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isLogin = true;

  Future<void> _submitAuthForm() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final name = _nameController.text;

    if (email.isEmpty || password.isEmpty || (!_isLogin && (name.isEmpty || confirmPassword.isEmpty))) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    if (!_isLogin && password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      String userName = '';
      if (_isLogin) {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        userName = userCredential.user!.displayName ?? '';
      } else {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        userName = name;
        await FirebaseFirestore.instance.collection('auth').doc(userCredential.user!.uid).set({
          'email': email,
          'name': name,
          'createdAt': Timestamp.now(),
        });
        await userCredential.user!.updateDisplayName(name);
      }

      if (widget.onAuthSuccess != null) {
        widget.onAuthSuccess!(userName);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_isLogin ? 'Logged in successfully' : 'Signed up successfully')),
      );

      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      _nameController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication failed')),
      );
    }
  }

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Heading(title: _isLogin ? 'Login' : 'Sign Up'),
            if (!_isLogin)
              CustomTextField(
                controller: _nameController,
                // decoration: const InputDecoration(
                  labelText: 'Name',
                // ),
              ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: _emailController,
              // decoration: const InputDecoration(
                labelText: 'Email',
              // ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: _passwordController,
              // decoration: const InputDecoration(
                labelText: 'Password',
              // ),
              obscureText: true,
            ),
            if (!_isLogin)
              const SizedBox(height: 10),
            if (!_isLogin)
              CustomTextField(
                controller: _confirmPasswordController,
                // decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                // ),
                obscureText: true,
              ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _submitAuthForm,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
              ),
              child: Text(
                _isLogin ? 'Login' : 'Sign Up',
                style: const TextStyle(
                  fontFamily: "ProductSans",
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: _toggleAuthMode,
              child: Text(
                _isLogin ? 'Create an account' : 'Already have an account? Login',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
