
import 'package:flutter/material.dart';
import 'package:flutter_base/authentifications.dart';
import 'package:flutter_base/custom.dart';


 

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  final Color primaryColor = const Color(0xFF263B80);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void register() {

    if (_formKey.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration validation successful!'),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Create Account'),
        foregroundColor: primaryColor,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 15),

                Center(
                  child: Icon(
                    Icons.school_rounded,
                    size: 70,
                    color: primaryColor,
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: Text(
                    'Join StudyMate!',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                const Center(
                  child: Text(
                    'Start organizing your study journey.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                CustomInputField(
                  controller: nameController,
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icons.person_outline,
                  validator: Validators.validateName,
                ),

                const SizedBox(height: 20),

                CustomInputField(
                  controller: emailController,
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),

                const SizedBox(height: 20),

                CustomInputField(
                  controller: passwordController,
                  labelText: 'Password',
                  hintText: 'Create a password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: hidePassword,
                  validator: Validators.validatePassword,

                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),

                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 20),

                CustomInputField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: hideConfirmPassword,

                  validator: (value) =>
                      Validators.validateConfirmPassword(
                        value,
                        passwordController.text,
                      ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      hideConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),

                    onPressed: () {
                      setState(() {
                        hideConfirmPassword =
                            !hideConfirmPassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: register,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: const Text(
                      'CREATE ACCOUNT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      'Already have an account? Login',
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
