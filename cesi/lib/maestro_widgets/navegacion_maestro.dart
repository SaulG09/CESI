import 'package:cesi/maestro_widgets/home_maestro.dart';
import 'package:cesi/maestro_widgets/notificaciones_maestro.dart';
import 'package:cesi/maestro_widgets/seleccionar_informacion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cesi/maestro_widgets/maestro_perfil.dart';

class NavegacionMenuMaestro extends StatelessWidget {
  final Color color1; // Primer color del degradado
  final Color color2; // Segundo color del degradado
  final Color color3; // Color de icono no seleccionado

  const NavegacionMenuMaestro({
    super.key,
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  Widget build(BuildContext context) {
    // Pasamos los colores a NavigationController
    final controller =
        Get.put(NavigationControllerM(color1, color2, color3), permanent: true);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: SafeArea(
            child: SizedBox(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Iconsax.home, 0, controller),
                  _buildNavItem(Iconsax.user, 1, controller),
                  _buildNavItem(Iconsax.user_search, 2, controller),
                  _buildNavItem(Iconsax.notification, 3, controller),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  Widget _buildNavItem(
      IconData icon, int index, NavigationControllerM controller) {
    final isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () {
        controller.selectedIndex.value = index;
      },
      child: AnimatedScale(
        scale: isSelected ? 1.2 : 1.0,
        duration: Duration(milliseconds: 300),
        child: MouseRegion(
          onEnter: (_) => _showOpacityEffect(index, controller),
          onExit: (_) => _hideOpacityEffect(index, controller),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.white : Colors.transparent,
            ),
            padding: EdgeInsets.all(8),
            child: Opacity(
              opacity: isSelected ? 1.0 : 0.8,
              child: Icon(
                icon,
                color: isSelected ? color1 : Color.fromARGB(139, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showOpacityEffect(int index, NavigationControllerM controller) {
    controller.selectedIndex.value = index;
  }

  void _hideOpacityEffect(int index, NavigationControllerM controller) {}
}

class NavigationControllerM extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final Color color1;
  final Color color2;
  final Color color3;

  NavigationControllerM(this.color1, this.color2, this.color3);

  // Aquí instanciamos las pantallas pasando los colores a TutorPerfil
  late final screens = [
    HomeMaestro(color1: color1, color2: color2, color3: color3),
    MaestroPerfil(color1: color1, color2: color2, color3: color3),
    InformacionSeleccionMaestro(color1: color1, color2: color2, color3: color3),
    NotificacionesScreen(color1: color1, color2: color2, color3: color3),
  ];
}
