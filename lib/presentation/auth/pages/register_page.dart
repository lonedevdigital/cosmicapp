// lib/presentation/auth/pages/register_page.dart
// Tidak perlu ada perubahan yang signifikan di sini.
// Kita akan membiarkan Consumer<RegisterProvider> tetap ada.
// Penyediaan provider akan dilakukan di file lain.
import 'package:cosmicscans/app/routes/app_router.dart';
import 'package:cosmicscans/presentation/auth/providers/register_provider.dart';
import 'package:cosmicscans/presentation/shared/styles/app_colors.dart';
import 'package:cosmicscans/presentation/shared/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:cosmicscans/app/routes/app_routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;

    // Hapus ChangeNotifierProvider di sini
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: size.width > 600 ? size.width * 0.3 : 24.0,
              vertical: isSmallScreen ? 16.0 : 32.0,
            ),
            child: Consumer<RegisterProvider>(
              builder: (context, provider, _) => ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Logo
                      Center(
                        child: Image.asset(
                          'assets/images/cosmic_toon_logo.png',
                          height: isSmallScreen ? 50 : 60,
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 20 : 30),

                      // Toggle Sign In / Sign Up
                      Center(
                        child: Container(
                          height: 50,
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              // Sign In Button
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => context.go(AppRoutes.loginPath),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color: AppColors.primary ?? Colors.purple,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Sign Up Button (Active)
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [AppColors.buttonGradientStart, AppColors.buttonGradientEnd],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 20 : 30),

                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                        value != null && value.contains('@')
                            ? null
                            : 'Email tidak valid',
                      ),
                      SizedBox(height: isSmallScreen ? 12 : 16),

                      // Username Field
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) =>
                        value != null && value.length >= 3
                            ? null
                            : 'Minimal 3 karakter',
                      ),
                      SizedBox(height: isSmallScreen ? 12 : 16),

                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
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
                        validator: (value) =>
                        value != null && value.length >= 6
                            ? null
                            : 'Minimal 6 karakter',
                      ),
                      SizedBox(height: isSmallScreen ? 12 : 16),

                      // Confirm Password Field
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.textGrey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) =>
                        value == _passwordController.text
                            ? null
                            : 'Password tidak sama',
                      ),
                      SizedBox(height: isSmallScreen ? 24 : 32),

                      // Register Button
                      provider.isLoading
                          ? const Center(
                        child: CircularProgressIndicator(),
                      )
                          : _buildGradientButton(
                        text: 'Register',
                        onPressed: () async {
                          print("🧪 Tombol REGISTER ditekan");

                          if (_formKey.currentState!.validate()) {
                            print("✅ Form VALID - Memanggil provider.register()");

                            final success = await provider.register(
                              email: _emailController.text.trim(),
                              username: _usernameController.text.trim(),
                              password: _passwordController.text,
                            );

                            if (success && mounted) {
                              print("✅ Register berhasil");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Berhasil daftar!')),
                              );
                              context.go(AppRoutes.loginPath);
                            } else {
                              print("❌ Register gagal: ${provider.errorMessage}");
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      provider.errorMessage ?? 'Terjadi kesalahan',
                                    ),
                                  ),
                                );
                              }
                            }
                          } else {
                            print("❌ Form TIDAK VALID");
                          }
                        },

                      ),
                      SizedBox(height: isSmallScreen ? 16 : 20),

                      // Login Link
                      Center(
                        child: GestureDetector(
                          onTap: () => context.go(AppRoutes.loginPath),
                          child: RichText(
                            text: TextSpan(
                              text: 'Sudah punya akun? ',
                              style: TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign In',
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
          colors: [AppColors.buttonGradientStart, AppColors.buttonGradientEnd],
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
}