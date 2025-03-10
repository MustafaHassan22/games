import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/feature/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:games/feature/auth/presentation/views/sign_up_view.dart';
import 'package:games/feature/auth/presentation/widgets/custom_text_field.dart';
import 'package:games/feature/games/presentation/views/game_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Minimum 6 characters required';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const GamesView()),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                      controller: _emailController, labelText: 'Email'),
                  const SizedBox(height: 12),
                  CustomTextFormField(
                    controller: _passwordController,
                    labelText: 'Password',
                    obscureText: _obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 20),
                  _buildSubmitButton(context, state),
                  _buildSignUpLink(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, AuthState state) {
    return ElevatedButton(
      onPressed: state is AuthLoading
          ? null
          : () {
              if (_formKey.currentState?.validate() ?? false) {
                context.read<AuthCubit>().login(
                      _emailController.text,
                      _passwordController.text,
                    );
              }
            },
      child: state is AuthLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : const Text('Login'),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignUpScreen()),
      ),
      child: const Text("Don't have an account? Sign Up"),
    );
  }
}
