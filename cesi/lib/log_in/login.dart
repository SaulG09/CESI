import 'package:cesi/maestro_widgets/navegacion_maestro.dart';
import 'package:cesi/responsable_widgets/navegacion_responsable.dart';
import 'package:cesi/tutor_widgets/navegacion_tutor.dart';
import 'package:cesi/log_in/acercade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Validación del formato del email
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email)) {
      Get.snackbar(
        "Datos no válidos",
        " ",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      _emailController.clear();
      _passwordController.clear(); // Limpia ambos campos
      return;
    }

    // Validación de longitud de contraseña
    if (password.length < 8) {
      Get.snackbar(
        "Contraseña no válida",
        " ",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      _emailController.clear();
      _passwordController.clear(); // Limpia ambos campos
      return;
    }

    // Verificación de credenciales
    if (email == "padre01@gmail.com" && password == "padre1234") {
      Get.to(() => NavegacionMenuTutor(
            color1: const Color.fromARGB(255, 3, 69, 11),
            color2: const Color.fromARGB(255, 182, 142, 0),
            color3: const Color.fromARGB(255, 223, 232, 140),
          ));
    } else if (email == "maestro01@gmail.com" && password == "maestro1234") {
      Get.to(() => NavegacionMenuMaestro(
            color1: const Color.fromARGB(255, 3, 69, 11),
            color2: const Color.fromARGB(255, 182, 142, 0),
            color3: const Color.fromARGB(255, 223, 232, 140),
          ));
    } else if (email == "responsable01@gmail.com" &&
        password == "responsable1234") {
      Get.to(() => NavegacionMenuResponsable(
            color1: const Color.fromARGB(255, 3, 69, 11),
            color2: const Color.fromARGB(255, 182, 142, 0),
            color3: const Color.fromARGB(255, 223, 232, 140),
          ));
    } else {
      Get.snackbar(
        "Ingreso no válido",
        "Correo o contraseña incorrectos",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }

    // Limpieza de campos después de cualquier intento
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      const Color.fromARGB(255, 255, 108, 10)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/cesiLogo.png',
                    height: 180,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  _buildTextFieldWithIcon(
                      Icons.email, 'Usuario', _emailController),
                  _buildTextFieldWithIcon(Iconsax.password_check, 'Contraseña',
                      isPassword: true, _passwordController),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 95, 41),
                          ),
                          child: const Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const Acercade());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 62, 62, 62),
                          ),
                          child: const Text(
                            'Acerca De',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Image.asset(
                    'lib/images/quantum_logo.jpeg',
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon(IconData icon, String hintText,
      TextEditingController metodo,
      {bool isPassword = false, bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 86, 64),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: metodo,
              obscureText: isPassword,
              keyboardType:
                  isNumeric ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.amberAccent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.amberAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.amberAccent, width: 2),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height - 20,
    );
    path.quadraticBezierTo(
      (size.width * 3) / 4,
      size.height - 60,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
