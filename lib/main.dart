import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'GridView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: MyGridView(),
    );
  }
}

class MyItem {
  final String text;
  final Color color;
  final String? imageUrl; // Opcionalmente, puedes agregar una URL de imagen.

  MyItem(this.text, this.color, {this.imageUrl});
}

class MyGridView extends StatelessWidget {
  final List<MyItem> items = [
    MyItem('Item 1', Colors.red),
    MyItem('Item 2', Colors.blue, imageUrl: 'images/fuego.png'),
    MyItem('Item 3', Colors.green, imageUrl: 'URL_DE_LA_IMAGEN'),
    MyItem('Item 5', Colors.orange, imageUrl: 'URL_DE_LA_IMAGEN'),
    MyItem('Item 4', Colors.yellow),
    MyItem('Item 6', Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        if (items[index].imageUrl != null) {
          // Si hay una URL de imagen, muestra la imagen.
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Image.network(
              items[index].imageUrl!,
              fit: BoxFit.cover,
            ),
          );
        } else {
          // Si no hay URL de imagen, muestra el texto.
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            color: items[index].color,
            child: Center(
              child: Text(items[index].text),
            ),
          );
        }
      },
    );
  }
}
