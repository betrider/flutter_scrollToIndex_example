import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final itemKey = GlobalKey();

  Future scrollToItem() async {
    final context = itemKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildCard(0),
            buildCard(1),
            buildCard(2),
            buildCard(3),
            buildCard(4),
            buildCard(5),
            buildCard(4),
            buildCard(3),
            buildCard(2),
            buildCard(1),
            Container(
              key: itemKey,
              height: 50.0,
              color: Colors.purple,
              child: Center(
                child: Text('Item !!'),
              ),
            ),
            buildCard(0),
            buildCard(0),
            buildCard(1),
            buildCard(2),
            buildCard(3),
            buildCard(4),
            buildCard(5),
            buildCard(4),
            buildCard(3),
            buildCard(2),
            buildCard(1),
            buildCard(0),
            buildCard(0),
            buildCard(1),
            buildCard(2),
            buildCard(3),
            buildCard(4),
            buildCard(5),
            buildCard(4),
            buildCard(3),
            buildCard(2),
            buildCard(1),
            buildCard(0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_downward),
        onPressed: () => scrollToItem(),
      ),
    );
  }
}

Widget buildCard(int index) {
  return Container(
    height: 50.0 * index,
    color: index % 2 == 1 ? Colors.red : Colors.green,
    child: Center(
      child: Text('Item $index'),
    ),
  );
}
