import 'package:flutter/material.dart';
import 'package:auto_size_widget/auto_size_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto Size Widget Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AutoSizeWidgetExample(),
    );
  }
}

class AutoSizeWidgetExample extends StatelessWidget {
  const AutoSizeWidgetExample({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue[300],
            centerTitle: false,
            title: const Text('Auto Size Widget Example')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AutoSizeWidget(
                    initialWidth: 120,
                    initialHeight: 80,
                    maxWidth: 320,
                    boxDecoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    maxHeight: 280,
                    showIcon: false,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        'https://docs.flutter.dev/assets/images/dash/BigDashAndLittleDash.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AutoSizeWidget(
                    initialWidth: 180,
                    initialHeight: 150,
                    maxWidth: 300,
                    maxHeight: 150,
                    boxDecoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    showIcon: true,
                    child: const TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 3 * 120,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 11, horizontal: 15),
                          hintText: "Enter text here"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeWidget(
                    initialWidth: 250,
                    initialHeight: 120,
                    maxWidth: 250,
                    boxDecoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    maxHeight: 280,
                    showIcon: true,
                    child: const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
