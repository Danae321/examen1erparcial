import 'package:flutter/material.dart';

//creamos la pantalla principal que muestra una cuadricula de imagenes.
class ImageGridScreen extends StatelessWidget {
  //lista de URLs de imagenes que se mostraran en la cuadricula.
  final List<String> imageUrls = [
    'https://i.pinimg.com/736x/4d/63/f3/4d63f34eab6f180b66736d5047c5415e.jpg',
    'https://i.pinimg.com/564x/28/2a/8a/282a8a07a087d46dbf47ece28c362cca.jpg',
    'https://akamai.sscdn.co/uploadfile/letras/albuns/a/8/9/d/1104441625149303-tb_180.jpg',
    'https://lastfm.freetls.fastly.net/i/u/ar0/057f5fc9c624a53d87eec9c7566d1482.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSJXgJggdwHPULXP12IrGY6z65zF8wwVGSUw&s',
    'https://lastfm.freetls.fastly.net/i/u/500x500/d6850121501b2fde47d3783d8ffa1b24.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    //verificamos si la pantalla es vertical o horizontal
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Examen de Primer Parcial'),
      ),
      body: GridView.builder(
        //configuramos las cuadriculas para mostrar las imagenes
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortrait ? 2 : 3, //2 columnas en vertical, 3 en horizontal
          crossAxisSpacing: 28.0, //espaacio columnas
          mainAxisSpacing: 30.0, //espacio filas
          childAspectRatio: isPortrait ? 1 / 1.2 : 1.9 / 1, //tamaño de las imágenes

        ),
        itemCount: imageUrls.length, //nuemro total de imagenes
        itemBuilder: (context, index) {
          return GestureDetector(
            //cuando se toca una imagen, se navega a la pantalla de imagen completa
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImage(imageUrl: imageUrls[index]), //pasamos la URL de la imagen que se dio click
                ),);
            },
            //cargamos la imagen desde la url
            child: Image.network(
              imageUrls[index],
              fit: BoxFit.cover, //se ajusta la imagen para que cubra el area disponible
            ),);
        },
        padding: const EdgeInsets.all(8.0),
      ),);
  }
}

//mostamos la imagen en pantalla completa cuando se haga click
class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  FullScreenImage({required this.imageUrl}); // recibimos URL como parametro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        //tocamos imagen para regresar a la pantalla principal
        onTap: () => Navigator.pop(context),
        child: Center(
          //mostramos imagen en el centro de la pantalla
          child: Image.network(
      imageUrl,
      fit: BoxFit.contain, //cover, ajustamos la imagen para que este dentro de la pantalla
          ),
        ),
      ),
    );
  }
}

//funcion principal para ejecutar la app
void main() {
  runApp(MaterialApp(
    home: ImageGridScreen(), //establecemos la pantalla principal de la app
  ));
}
