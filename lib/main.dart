import 'package:BuilderMethods/board_builder.dart';
import 'package:BuilderMethods/screen_size_builder.dart';
import 'package:flutter/material.dart';
import 'package:responsive_util/responsive_util.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, int> pieces = {
    'A1': 0,
    'C1': 0,
    'E1': 0,
    'G1': 0,
    'B2': 0,
    'D2': 0,
    'F2': 0,
    'H2': 0,
    'A3': 0,
    'C3': 0,
    'E3': 0,
    'G3': 0,
    'B8': 1,
    'D8': 1,
    'F8': 1,
    'H8': 1,
    'A7': 1,
    'C7': 1,
    'E7': 1,
    'G7': 1,
    'B6': 1,
    'D6': 1,
    'F6': 1,
    'H6': 1,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BoardBuilder(
        builder: (context, tileId) {
          if (pieces[tileId] != null)
            return Piece(pieces[tileId]);
          else
            return Container();
        },
      ),
    );
//     return ResponsiveUtil(
//       child: ScreenSizeBuilder(
//         builder: (context, constraints, size) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text(widget.title),
//             ),
//             body: Center(
//               child: Text('I am ${size == ScreenSize.small ? 'small' : 'big'}'),
//             ),
//           );
//         },
//       ),
//     );
  }
}

class Piece extends StatelessWidget {
  final int player;
  Piece(this.player);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: player.isEven ? Colors.red : Colors.green,
      ),
    );
  }
}
