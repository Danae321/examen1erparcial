import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Importa el archivo principal de tu aplicación
import 'package:examenprimer/main.dart'; // Asegúrate de que el nombre sea correcto

void main() {
  // Define una prueba de widgets
  testWidgets('Prueba de visualización de imágenes en la cuadrícula', (WidgetTester tester) async {
    // Construye nuestra aplicación y genera un frame.
    await tester.pumpWidget(MaterialApp(home: ImageGridScreen()));

    // Verifica que hay un número esperado de imágenes en la cuadrícula.
    expect(find.byType(Image), findsNWidgets(6)); // Debería encontrar 6 imágenes

    // Simula un toque en la primera imagen.
    await tester.tap(find.byType(Image).first);
    await tester.pumpAndSettle(); // Genera un nuevo frame y espera a que se complete la animación

    // Verifica que se muestra la imagen a pantalla completa.
    expect(find.byType(FullScreenImage), findsOneWidget); // Debería encontrar el widget FullScreenImage
  });
}
