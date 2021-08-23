import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _myString = '';
  final _modelFile = 'linear_final_model.tflite';

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

  void _setMyString(String str) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _myString = str;
    });
  }

  // TensorFlow Lite Interpreter object
  late Interpreter _interpreter;

  //constructor
  _MyHomePageState() {
    // Load model when the classifier is initialized.
    _loadModel();
    // _loadDictionary();
  }

  void _loadModel() async {
    // Creating the interpreter using Interpreter.fromAsset
    _interpreter = await Interpreter.fromAsset(_modelFile);
    print('Interpreter loaded successfully');
  }

  // void _loadDictionary() async {
  //   final vocab = await rootBundle.loadString('assets/$_vocabFile');
  //   var dict = <String, int>{};
  //   final vocabList = vocab.split('\n');
  //   for (var i = 0; i < vocabList.length; i++) {
  //     var entry = vocabList[i].trim().split(' ');
  //     dict[entry[0]] = int.parse(entry[1]);
  //   }
  //   _dict = dict;
  //   print('Dictionary loaded successfully');
  // }

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
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_myString',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // For ex: if input tens,or shape [1,5] and type is float32
          var input = [
            [
              3.72812792e-06,
              -4.27122723e-05,
              4.64679488e-06,
              -3.27150300e-02,
              -3.16670612e-02,
              1.08304210e-01,
              -1.38766646e-01,
              3.61559808e-01,
              1.57214910e-01,
              -4.78094593e-02,
              6.74652338e-01,
              2.85124868e-01,
              3.27185243e-02,
              3.16566676e-02,
              -1.08290575e-01,
              4.55909334e-02,
              4.59240317e-01,
              -1.97068285e-02,
              1.96052372e-01,
              6.61989331e-01,
              1.36100888e-01,
              -5.37563749e-02,
              -2.16723055e-01,
              -8.30667466e-02,
              -1.90043628e-01,
              -3.93704206e-01,
              -1.92308620e-01,
              -3.21338594e-01,
              -3.94914031e-01,
              -2.17026845e-01,
              -3.49001944e-01,
              -4.99354810e-01,
              -2.56541401e-01,
              -1.39533430e-01,
              -2.93933123e-01,
              -2.85266429e-01,
              -1.43178642e-01,
              -1.16015375e-02,
              -3.09072137e-01,
              -3.72645795e-01,
              -5.85971735e-02,
              -2.49327704e-01,
              -1.65939569e-01,
              -4.20195073e-01,
              -6.19511716e-02,
              2.58590877e-02,
              -3.01698148e-01,
              1.13802165e-01,
              1.40456706e-01,
              -1.52299628e-01,
              1.21619344e-01,
            ],
            [
              3.91976209e-06,
              -4.28138010e-05,
              4.67379687e-06,
              -3.30192298e-02,
              -3.15914452e-02,
              1.08132616e-01,
              -1.37965053e-01,
              3.61151606e-01,
              1.57637566e-01,
              -4.87416238e-02,
              6.77591741e-01,
              2.82959372e-01,
              3.30227837e-02,
              3.15809026e-02,
              -1.08118922e-01,
              4.66997176e-02,
              4.59932923e-01,
              -1.94235966e-02,
              1.96047425e-01,
              6.62734568e-01,
              1.34540319e-01,
              -5.38639724e-02,
              -2.17444241e-01,
              -8.23808536e-02,
              -1.90389544e-01,
              -3.94231677e-01,
              -1.91003814e-01,
              -3.21611702e-01,
              -3.95515710e-01,
              -2.15851113e-01,
              -3.49953324e-01,
              -5.00240862e-01,
              -2.54986793e-01,
              -1.39323086e-01,
              -2.94397235e-01,
              -2.83883631e-01,
              -1.42870679e-01,
              -1.15059279e-02,
              -3.07696044e-01,
              -3.70805860e-01,
              -5.81488386e-02,
              -2.45564997e-01,
              -1.66853398e-01,
              -4.20705199e-01,
              -6.08363599e-02,
              2.48300526e-02,
              -3.02567184e-01,
              1.14107072e-01,
              1.42031461e-01,
              -1.52402639e-01,
              1.20818660e-01,
            ],
            [
              4.46756894e-06,
              -4.25008693e-05,
              4.82901714e-06,
              -3.38805988e-02,
              -3.14645618e-02,
              1.07986912e-01,
              -1.38509750e-01,
              3.58432770e-01,
              1.54017583e-01,
              -4.86493930e-02,
              6.79102242e-01,
              2.76493907e-01,
              3.38840485e-02,
              3.14539447e-02,
              -1.07973531e-01,
              4.72438186e-02,
              4.60017145e-01,
              -1.91694684e-02,
              1.93496972e-01,
              6.61626220e-01,
              1.34652898e-01,
              -5.48077375e-02,
              -2.17555195e-01,
              -8.21492225e-02,
              -1.92233220e-01,
              -3.94226342e-01,
              -1.90021157e-01,
              -3.22922319e-01,
              -3.95965576e-01,
              -2.14504361e-01,
              -3.51774067e-01,
              -5.00839353e-01,
              -2.52810955e-01,
              -1.40632212e-01,
              -2.96143234e-01,
              -2.82776594e-01,
              -1.38362259e-01,
              -1.20137520e-02,
              -3.05657625e-01,
              -3.62951249e-01,
              -4.69140112e-02,
              -2.41893768e-01,
              -1.68695897e-01,
              -4.19310510e-01,
              -5.94653711e-02,
              2.63066236e-02,
              -3.03340554e-01,
              1.14411354e-01,
              1.44971013e-01,
              -1.51864529e-01,
              1.20198935e-01,
            ]
          ];

          // if output tensor shape [1,2] and type is float32
          // var output = List.filled(1 * 2, 0).reshape([1, 2]);
          var output = List.filled(1 * 1, 0).reshape([1, 1]);

          // inference
          _interpreter.run(input, output);
          print(output);
          var outputStr = output[0][0].toString();
          _setMyString(outputStr);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
