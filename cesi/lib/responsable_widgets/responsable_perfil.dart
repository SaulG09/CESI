import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';


class ResponsablePerfil extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  const ResponsablePerfil({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  _ResponsablePerfilState createState() => _ResponsablePerfilState();
}

class _ResponsablePerfilState extends State<ResponsablePerfil> {
  File? _selectedImage; // Variable para almacenar la imagen seleccionada

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

Future<void> _requestPermissions(ImageSource source) async {
  if (source == ImageSource.camera) {
    if (await Permission.camera.request().isGranted) {
      _pickImage(source);
    } else {
      print('Permiso para usar la cámara denegado');
    }
  } else if (source == ImageSource.gallery) {
    if (await Permission.photos.request().isGranted || 
        await Permission.storage.request().isGranted) {
      _pickImage(source);
    } else {
      print('Permiso para acceder a la galería denegado');
    }
  }
}


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
                  image: _selectedImage != null
            ? FileImage(_selectedImage!)
            : AssetImage('lib/images/placeholder.webp') as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Contenedor con color y opacidad
          Positioned.fill(
            child: Container(
              color: widget.color1.withOpacity(0.6),
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
                          image: _selectedImage != null
                              ? FileImage(_selectedImage!)
                              : AssetImage('lib/images/placeholder.webp') as ImageProvider,
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
                      child: GestureDetector(
                        onTap: () {
                          // Mostrar opciones para abrir cámara o galería
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => _buildImagePickerOptions(),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: widget.color2,
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
                          'Responsable',
                          style: TextStyle(
                            color: widget.color1,
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
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 20,
                            childAspectRatio: 1,
                          ),
                          children: [
                            _buildContactCard(Iconsax.mobile, '7223023453', widget.color2),
                            _buildContactCard(Iconsax.tag_user, 'AnneTutor01', widget.color2),
                            _buildContactCard(Iconsax.password_check, '1234', widget.color2),
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

  Widget _buildImagePickerOptions() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ListTile(
        leading: Icon(Icons.camera),
        title: Text('Tomar foto'),
        onTap: () {
          Navigator.of(context).pop();
          _requestPermissions(ImageSource.camera);
        },
      ),
      ListTile(
        leading: Icon(Icons.photo),
        title: Text('Seleccionar de la galería'),
        onTap: () {
          Navigator.of(context).pop();
          _requestPermissions(ImageSource.gallery);
        },
      ),
    ],
  );
}

  Widget _buildContactCard(IconData icon, String text, Color color) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 200,
          width: 200,
          margin: EdgeInsets.only(top: 30),
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
