import 'package:flutter/material.dart';
import 'package:videos/video.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const VideosPage(),
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class VideoPage extends StatelessWidget {
  Video? video;
  VideoPage({this.video});
  @override
  Widget build(BuildContext context) {
    return 
    TextButton(onPressed: () => Navigator.pop(context), child: Text("Volver "+ video!.name));
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Video Page"),
    //   ),
    //   body: Center(
    //     child: RaisedButton(
    //       onPressed: () {
    //         // Regresa a la primera ruta cuando se pulsa.
    //       },
    //       child: Text('Go back!'),
    //     ),
    //   ),
    //);
  }
}
class VideosPage extends StatefulWidget{
  const VideosPage ({super.key});
  @override
  State<StatefulWidget> createState() {
    return _VideoState();
  }

}

class _VideoState extends State<VideosPage> {
  final List<Video> _videos = [
 Video("2001 Odisea en el espacio", "", "2001.jpg"),
 Video("Ameli", "", "ameli.jpg"),
 Video("Laurence de Arabia", "", "arabia.jpg"),
 Video("Ciudadano Kane", "", "kane.jpg"),
 Video("La Naranja mecáncia", "", "naranja.jpg"),
 Video("El retorno del Yedi", "", "retorno.jpg"),
 Video("Con la muerte en los talnoes", "", "talones.jpg"),
 Video("Vérticos", "", "vertigo.jpg"),
 ];
 Video? selected = null;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("Ejemplo aplicacion"),
        backgroundColor: Colors.blue[400],
      ),
body: GridView.count(
  crossAxisCount: (MediaQuery.of(context).size.width/ 350).toInt(),  // MediaQuery - para reducir la pantalla y cambiar el comillo de los containers
  crossAxisSpacing: 10,
  padding: const EdgeInsets.all(40),
children: List.generate(
  _videos.length, 
  (index) => 
//  Image(image: AssetImage(
// 'assets/${_videos.elementAt(index).image}', 
//)
Card(
  child:Column(
    children: [
      Text(_videos.elementAt(index).image), 
      Image(image: AssetImage(
        'assets/${_videos.elementAt(index).image}',
      ),
      height: 
      (MediaQuery.of(context).size.height/3).toDouble(),
      fit:BoxFit.fill,
      ),
      IconButton(
            icon: const Icon(Icons.android),
            color: Colors.red,
            onPressed: () {},
          ),
          TextButton(onPressed: ()
          {Navigator.push(
context, MaterialPageRoute(
  builder: (context) => VideoPage(
    video: _videos.elementAt(index),
)),
);
}, 
child: Text("Ver"))
    ]
  ),
),
),
),
//Text(index.toString())
//),
// Container(
//             padding: const EdgeInsets.all(8),
//             color: Colors.green[100],
//             child: const Text("He'd have you all unravel at the"),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             color: Colors.green[200],
//             child: const Text('Heed not the rabble'),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             color: Colors.green[300],
//             child: const Text('Sound of screams but the'),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             color: Colors.green[400],
//             child: const Text('Who scream'),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             color: Colors.green[500],
//             child: const Text('Revolution is coming...'),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             color: Colors.green[600],
//             child: const Text('Revolution, they...'),
//           ),
           );
  //  );

  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
