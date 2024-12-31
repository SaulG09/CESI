import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeTutor extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  const HomeTutor({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  _HomeTutorState createState() => _HomeTutorState();
}

class _HomeTutorState extends State<HomeTutor> {
  int tipoVista = 0;

  void cambiarVista() {
    setState(() {
      tipoVista = 1;
    });
  }

  void cambiarVista2() {
    setState(() {
      tipoVista = 2;
    });
  }

  void cambiarVista3() {
    setState(() {
      tipoVista = 3;
    });
  }

  void cambiarVista4() {
    setState(() {
      tipoVista = 4;
    });
  }

  void cambiarVista5() {
    setState(() {
      tipoVista = 5;
    });
  }

    void cambiarVista6() {
    setState(() {
      tipoVista = 0;
    });
  }

  // Lista de elementos para el GridView
  final List<Map<String, String>> items = [
    {
      'image': 'lib/images/placeholder.webp',
      'text1': 'Juan Garcia Desales',
    },
    {
      'image': 'lib/images/placeholder.webp',
      'text1': 'Texto A',
    },
    {
      'image': 'lib/images/placeholder.webp',
      'text1': 'Texto X',
    },
    // Agrega más elementos según sea necesario
  ];

  List<Map<String, dynamic>> items2 = [
    {
      'image': 'lib/images/placeholder.webp',
      'text1': 'Alumno 1',
      'checked': false, // Asegúrate de que exista y esté inicializado
    },
    {
      'image': 'lib/images/placeholder.webp',
      'text1': 'Alumno 2',
      'checked': false,
    },
    {
      'image': 'lib/images/placeholder.webp',
      'text1': 'Alumno 2',
      'checked': false,
    },
    {
      'image': 'lib/images/placeholder.webp',
      'text1': 'Alumno 2',
      'checked': false,
    },
    // Más elementos...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: tipoVista == 0
            ? _buildSeleccion()
            : tipoVista == 1
                ? _buildGridView()
                : tipoVista == 2
                    ? _buildAlumno()
                    : tipoVista == 3
                        ? _buildGridResponsables()
                        : tipoVista == 4
                            ? _buildResponsable()
                            : _buildResponsableRegistro());
  }

  Widget _buildSeleccion() {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.color2, widget.color1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
        
        // Imagen de fondo con color sobrepuesto
        Positioned(
          top: 110,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/logo.png'), // Imagen de fondo
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                'Bienvenido',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 160),
              // Tarjetas en formato de grilla
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildCard(
                      'lib/images/recoger.png',
                      widget.color1,
                      'Recoger',
                      cambiarVista,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  SizedBox(width: 0),
                  Expanded(
                    child: _buildCard(
                      'lib/images/listas.png',
                      widget.color2,
                      'Reportes',
                      cambiarVista2, // Función de acción del tercer card
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String imagePath, Color backgroundColor, String text,
      VoidCallback? onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(38),
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38),
        ),
        elevation: 5,
        child: Container(
          height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(38),
                child: Image.asset(
                  imagePath,
                  height: 210,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 210,
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(38),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  imagePath,
                  height: 180,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlumno() {
    List<String> fechas = [
      '01/11/2024',
      '02/11/2024',
      '03/11/2024'
    ]; // Lista de fechas

    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.color1, widget.color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
         
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30), // Espacio para el encabezado
              Center(
                child: Text(
                  'Recogidas',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                  height: 100), // Espacio entre el título y los dropdowns
              const SizedBox(
                  height: 20), // Espacio entre los dropdowns y el grid

              // GridView con Cards dinámicas que ocupan todo el ancho
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio:
                        5, // Ajuste para que el Card sea horizontal
                  ),
                  itemCount: fechas.length,
                  itemBuilder: (context, index) {
                    return _buildAlumnoCard(
                      Icons.calendar_today,
                      'Fecha: ${fechas[index]}',
                      widget.color1,
                      onTap: () {
                        // Acción cuando se toque la tarjeta
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 90,
          left: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Acción que deseas realizar al presionar el botón
              cambiarVista6();
            },
            backgroundColor: widget.color1,
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            shape: CircleBorder(), // Asegura que sea circular
          ),
        )
      ],
    );
  }

  Widget _buildAlumnoCard(IconData icon, String text, Color color,
      {required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(38),
      onTap: onTap,
      // Color de efecto de splash
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white),
          ),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    // Colores para el contorno
    List<Color> borderColors = [widget.color1, widget.color2, widget.color3];

    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.color2, widget.color1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30), // Espacio para el encabezado
              Center(
                child: Text(
                  'Alumnos disponibles',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espacio entre el título y el GridView
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Dos columnas
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        0.65, // Ajuste para controlar el alto de cada tarjeta
                  ),
                  itemCount: items2.length,
                  itemBuilder: (context, index) {
                    // Alternar el color del borde
                    Color borderColor =
                        borderColors[index % borderColors.length];

                    return GestureDetector(
                      onTap: () {
                        // Alternar el estado del checkbox al tocar la tarjeta
                        setState(() {
                          items2[index]['checked'] =
                              !(items2[index]['checked'] ?? false);
                        });
                      },
                      child: Stack(
                        children: [
                          Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 130,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              items2[index]['image']!),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                          color:
                                              borderColor, // Color alternante para el borde
                                          width: 4,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items2[index]['text1']!,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Checkbox(
                              shape: CircleBorder(),
                              activeColor: widget.color2,
                              value: items2[index]['checked'] ?? false,
                              onChanged: (bool? value) {
                                // Cambiar el estado cuando el checkbox se toca
                                setState(() {
                                  items2[index]['checked'] = value as String;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 90,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Acción que deseas realizar al presionar el botón
              cambiarVista5();
            },
            backgroundColor: widget.color2,
            child: Icon(Iconsax.car, color: Colors.white),
            shape: CircleBorder(), // Asegura que sea circular
          ),
        ),
        Positioned(
          bottom: 90,
          left: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Acción que deseas realizar al presionar el botón
              cambiarVista6();
            },
            backgroundColor: widget.color1,
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            shape: CircleBorder(), // Asegura que sea circular
          ),
        )
      ],
    );
  }

  Widget _buildGridResponsables() {
    // Colores para el contorno
    List<Color> borderColors = [widget.color1, widget.color2, widget.color3];

    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.color2, widget.color1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30), // Espacio para el encabezado
              Center(
                child: Text(
                  'Responsables',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espacio entre el título y el GridView
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Dos columnas
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        0.65, // Ajusta para controlar el alto de cada tarjeta
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    // Alternar el color del borde
                    Color borderColor =
                        borderColors[index % borderColors.length];

                    return InkWell(
                      borderRadius: BorderRadius.circular(28),
                      onTap: () {
                        // Aquí puedes manejar el evento onPressed
                        _onCardTappedResponsable(index);
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(items[index]['image']!),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color:
                                          borderColor, // Color alternante para el borde
                                      width: 4,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      10), // Espacio entre la imagen y el texto
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index]['text1']!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // Botón flotante en la esquina inferior derecha
        Positioned(
          bottom: 90,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              // Acción que deseas realizar al presionar el botón
              cambiarVista5();
            },
            backgroundColor: widget.color1,
            child: Icon(Icons.add, color: Colors.white),
            shape: CircleBorder(), // Asegura que sea circular
          ),
        ),
      ],
    );
  }

  Widget _buildResponsable() {
    List<String> fechas = [
      '01/11/2024',
      '02/11/2024',
      '03/11/2024'
    ]; // Lista de fechas

    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [widget.color1, widget.color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30), // Espacio para el encabezado
              Center(
                child: Text(
                  'Listas de asistencia',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                  height: 100), // Espacio entre el título y los dropdowns
              const SizedBox(
                  height: 20), // Espacio entre los dropdowns y el grid

              // GridView con Cards dinámicas que ocupan todo el ancho
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio:
                        5, // Ajuste para que el Card sea horizontal
                  ),
                  itemCount: fechas.length,
                  itemBuilder: (context, index) {
                    return _buildAlumnoCard(
                      Icons.calendar_today,
                      'Fecha: ${fechas[index]}',
                      widget.color1,
                      onTap: () {
                        // Acción cuando se toque la tarjeta
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

Widget _buildResponsableRegistro() {
  return Stack(
    children: [
      ClipPath(
        clipper: WaveClipperTwo(),
        child: Container(
          height: 180, // Aumenta la altura para acomodar el nuevo contenido
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [widget.color1, widget.color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centrar en horizontal
          children: [
            const SizedBox(height: 30), // Espacio para el encabezado
            Center(
              child: Text(
                'Entrega en proceso',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 100), // Espacio entre el título y el texto del QR
            Container( // Envuelve el texto en un Container
              margin: const EdgeInsets.symmetric(horizontal: 10), // Margen horizontal de 10
              child: Align( // Usamos Align para centrar horizontalmente
                alignment: Alignment.center, // Alineación centrada
                child: Text(
                  'Escanea este código QR al llegar a la escuela',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 70, 70, 70),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // Espacio entre el texto y el card
            Center(
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 5,
                child: Container(
                  margin: const EdgeInsets.all(10), // Margen de 10
                  height: 300, // Ajusta la altura según sea necesario
                  width: 300, // Ajusta el ancho según sea necesario
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/images/qr.png'), // Reemplaza con la ruta de tu imagen
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100), // Espacio entre el card y el resto de los elementos
            // Fila para los DropdownButtons
          ],
        ),
      ),
    ],
  );
}



  void _onCardTapped(int index) {
    // Aquí puedes manejar la lógica cuando se toca un card
    // Por ejemplo, puedes navegar a otra pantalla o actualizar el estado de la vista.
    // Dependiendo de tu implementación:
  }

  void _onCardTappedResponsable(int index) {
    // Aquí puedes manejar la lógica cuando se toca un card
    // Por ejemplo, puedes navegar a otra pantalla o actualizar el estado de la vista.
    // Dependiendo de tu implementación:
    cambiarVista4();
  }
}

// CustomClipper para crear una forma de ola (WaveClipperTwo)
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
