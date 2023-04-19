import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  Future scrollToIndex() async {
    itemScrollController.scrollTo(
      index: 24,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(() {
      final indices = itemPositionsListener.itemPositions.value
          .where((item) {
            final isTopVisible = item.itemLeadingEdge >= 0;
            final isBottomVisible = item.itemTrailingEdge <= 1;
            return isTopVisible && isBottomVisible;
          })
          .map((e) => e.index)
          .toList();
      print(indices);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScrollablePositionedList.builder(
        itemCount: 200,
        itemBuilder: (context, index) {
          return buildCard(index);
        },
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_downward),
        onPressed: () => scrollToIndex(),
      ),
    );
  }
}

Widget buildCard(int index) {
  return Container(
    height: 50.0,
    color: index % 2 == 1 ? Colors.red : Colors.green,
    child: Center(
      child: Text('Item $index'),
    ),
  );
}
