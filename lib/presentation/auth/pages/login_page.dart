import 'package:cosmicscans/app/routes/app_routes.dart';
import 'package:cosmicscans/presentation/auth/providers/login_provider.dart';
import 'package:cosmicscans/presentation/shared/styles/app_colors.dart';
import 'package:cosmicscans/presentation/shared/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    final loginProvider = context.read<LoginProvider>();
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    final success = await loginProvider.login(
      username: username,
      password: password,
    );

    if (success) {
      if (mounted) context.go(AppRoutes.homePath);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(loginProvider.errorMessage ?? 'Login gagal'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LoginProvider>();
    final isLoading = loginProvider.isLoading;

    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width > 600 ? size.width * 0.3 : 24.0,
              vertical: isSmallScreen ? 16.0 : 32.0,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/cosmic_toon_logo.png',
                        height: isSmallScreen ? 50 : 60,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 20 : 30),

                    _buildToggleLoginRegister(),

                    SizedBox(height: isSmallScreen ? 20 : 30),

                    // Username
                    TextFormField(
                      controller: _usernameController,
                      decoration: _inputDecoration(
                        label: 'Username',
                        hint: 'Enter your username',
                      ),
                      validator: (value) => value != null && value.isNotEmpty
                          ? null
                          : 'Username tidak boleh kosong',
                    ),
                    SizedBox(height: isSmallScreen ? 12 : 16),

                    // Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: _inputDecoration(
                        label: 'Password',
                        hint: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.textGrey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) => value != null && value.isNotEmpty
                          ? null
                          : 'Password tidak boleh kosong',
                    ),
                    SizedBox(height: isSmallScreen ? 12 : 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (val) {
                                setState(() {
                                  _rememberMe = val ?? false;
                                });
                              },
                              activeColor: AppColors.primary,
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Keep me signed in',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textGrey,
                              ),
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement forgot password
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: isSmallScreen ? 24 : 32),

                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _buildGradientButton(
                      text: 'Sign In',
                      onPressed: () => _handleLogin(context),
                    ),
                    SizedBox(height: isSmallScreen ? 16 : 20),

                    Center(
                      child: GestureDetector(
                        onTap: () => context.go(AppRoutes.registerPath),
                        child: RichText(
                          text: TextSpan(
                            text: 'Belum punya akun? ',
                            style: TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.buttonGradientStart,
            AppColors.buttonGradientEnd
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(text, style: AppTextStyles.buttonText),
      ),
    );
  }

  Widget _buildToggleLoginRegister() {
    return Center(
      child: Container(
        height: 50,
        width: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            // Sign In Active
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.buttonGradientStart,
                      AppColors.buttonGradientEnd
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            // Sign Up
            Expanded(
              child: GestureDetector(
                onTap: () => context.go(AppRoutes.registerPath),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      suffixIcon: suffixIcon,
    );
  }
}
