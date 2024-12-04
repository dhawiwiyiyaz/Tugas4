import 'package:flutter/material.dart';
import 'package:tokokita/ui/registrasi_page.dart';
import 'package:tokokita/ui/produk_page.dart';

class LoginPage extends StatefulWidget {
 const LoginPage({Key? key}) : super(key: key);

 @override
 _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final _formKey = GlobalKey<FormState>();
 bool _isLoading = false;

 final _emailTextboxController = TextEditingController();
 final _passwordTextboxController = TextEditingController();

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   body: Container(
    height: double.infinity,
    decoration: const BoxDecoration(
     gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF6DB3F2), Color(0xFF1E69DE)],
     ),
    ),
    child: SingleChildScrollView(
     child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Form(
       key: _formKey,
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const SizedBox(height: 60),
         const Text(
          "Welcome Back!",
          style: TextStyle(
           fontSize: 28.0,
           fontWeight: FontWeight.bold,
           color: Colors.white,
          ),
         ),
         const SizedBox(height: 8),
         const Text(
          "Login to continue",
          style: TextStyle(
           fontSize: 16.0,
           color: Colors.white,
          ),
         ),
         const SizedBox(height: 40),
         _emailTextField(),
         const SizedBox(height: 16),
         _passwordTextField(),
         const SizedBox(height: 24),
         _buttonLogin(),
         const SizedBox(height: 16),
         _menuRegistrasi(),
        ],
       ),
      ),
     ),
    ),
   ),
  );
 }

 Widget _emailTextField() {
  return TextFormField(
   decoration: InputDecoration(
    labelText: "Email",
    prefixIcon: const Icon(Icons.email, color: Colors.blue),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
     borderRadius: BorderRadius.circular(30.0),
     borderSide: BorderSide.none,
    ),
   ),
   keyboardType: TextInputType.emailAddress,
   controller: _emailTextboxController,
   validator: (value) {
    if (value!.isEmpty) {
     return 'Email harus diisi';
    }
    return null;
   },
  );
 }

 Widget _passwordTextField() {
  return TextFormField(
   decoration: InputDecoration(
    labelText: "Password",
    prefixIcon: const Icon(Icons.lock, color: Colors.blue),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
     borderRadius: BorderRadius.circular(30.0),
     borderSide: BorderSide.none,
    ),
   ),
   keyboardType: TextInputType.text,
   obscureText: true,
   controller: _passwordTextboxController,
   validator: (value) {
    if (value!.isEmpty) {
     return "Password harus diisi";
    }
    return null;
   },
  );
 }

 Widget _buttonLogin() {
  return SizedBox(
   width: double.infinity,
   child: ElevatedButton(
    style: ElevatedButton.styleFrom(
     backgroundColor: Colors.orange,
     padding: const EdgeInsets.symmetric(vertical: 16.0),
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
     ),
    ),
    child: _isLoading
        ? const CircularProgressIndicator(
     color: Colors.white,
    )
        : const Text(
     "Login",
     style: TextStyle(fontSize: 18.0, color: Colors.white),
    ),
    onPressed: _isLoading
        ? null
        : () {
     if (_formKey.currentState!.validate()) {
      setState(() {
       _isLoading = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
       setState(() {
        _isLoading = false;
       });
       Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ProdukPage()), // Replace `ProdukPage` with the actual product page widget
       );
      });
     }
    },
   ),
  );
 }

 Widget _menuRegistrasi() {
  return Center(
   child: InkWell(
    child: const Text(
     "Belum memiliki akun? Registrasi",
     style: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
    onTap: () {
     Navigator.push(
         context,
         MaterialPageRoute(
             builder: (context) => const RegistrasiPage()));
    },
   ),
  );
 }
}
