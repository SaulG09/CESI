import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MaestroPerfil extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  const MaestroPerfil({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo ajustada para verse completa
          Positioned(
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/placeholder.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Contenedor con color y opacidad
          Positioned.fill(
            child: Container(
              color: color1.withOpacity(0.7),
            ),
          ),
          // Contenido encima del fondo
          Positioned(
            top: -60,
            left: 0,
            right: 0,
            bottom: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mi Perfil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25),
                // Imagen de perfil con ícono de edición
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('lib/images/placeholder.webp'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: color2,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                        ),
                        child: Icon(
                          Iconsax.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Contenedor blanco con bordes redondeados y sombra
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48),
                topRight: Radius.circular(48),
              ),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20.0,
                      spreadRadius: 0,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 34),
                        child: Text(
                          'Anne Grethe',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'Tutor',
                          style: TextStyle(
                            color: color1,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Información de contacto en dos columnas con diseño de icono sobre tarjeta
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Número de columnas
                            mainAxisSpacing: 15, // Espacio vertical entre elementos
                            crossAxisSpacing: 20, // Espacio horizontal entre elementos
                            childAspectRatio: 1, // Relación de aspecto de 1 para cuadrado
                          ),
                          children: [
                            _buildContactCard(Iconsax.mobile, '7223023453', color2),
                            _buildContactCard(Iconsax.tag_user, 'AnneTutor01', color2),
                            _buildContactCard(Iconsax.password_check, '1234', color2),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(IconData icon, String text, Color color) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Tarjeta redondeada con información de contacto
        Container(
          height: 200,
          width: 200,
          margin: EdgeInsets.only(top: 30), // Espacio para el ícono encima de la tarjeta
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 102, 102, 102),
                fontSize: 18,
              ),
            ),
          ),
        ),
        
        // Ícono en un contenedor circular sobre la tarjeta
        Positioned(
          top: 0,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
