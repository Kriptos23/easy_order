import 'package:flutter/material.dart';
import 'category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => MyHomePage(title: 'Home',),
        '/category' : (context) => Category(),
      }
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
  List<Container> containers = [];

  void addCategory(String name){
    setState(() {
      containers.add(
        Container(
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/$name');
              print('tapped');
            },
            child: Center(
              child: Column(
                children: [
                  Container(
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  color: Colors.blue.shade300,
                  width: double.infinity,
                  height: 100,
                ),SizedBox(height: 20,),
                ]
              ),
            ),
          ),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.blue.shade300,
                width: double.infinity,
                height: 100,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/category');
                    print('tapped');
                  },
                  child: Center(child: Text('Category', style: TextStyle
                    (fontSize: 30.0))),
                )
              ),
              SizedBox(height: 20,),
              Column(children: [...containers],)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showAlertDialog();
          },
        tooltip: 'Add Category',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _showAlertDialog() async {
    TextEditingController _textEditingController = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a Flutter AlertDialog.'),
                Text('You can customize it as per your needs.'),
                TextField(
                  controller: _textEditingController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                addCategory(_textEditingController.text);
              },
            ),
          ],

        );
      },
    );
  }


}

