

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/circle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
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
        useMaterial3: true,
      ),
      home: const MyHomePage(title:'fzafazfaz'),
    );
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
  // ignore: unused_field
  String _modifiabletext = 'hey yo';
  int currentPageIndex = 0;
  final TextStyle dmSansStyle = GoogleFonts.dmSans();

  // ignore: unused_element
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _modifiabletext = 'yo what ?';
    });
  }

  // ignore: unused_element
  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
      switch (_counter) {
        case > 0:
          _modifiabletext = 'thats good';
        case < 0:
          _modifiabletext = 'youre goofy';
      }
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
      //extendBodyBehindAppBar: true,
      //appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        //backgroundColor: Colors.white.withAlpha(200),
        //surfaceTintColor: Colors.transparent,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Image.file(),
        //elevation: 0,
        //centerTitle: true,
      //),
      
      body: _buildBody(),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _incrementCounter,
      //  tooltip: 'Increment',
      //  child: const Icon(Icons.add),
      //),

      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: BottomAppBar(
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                setState(() {
                  currentPageIndex = 0;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                setState(() {
                  currentPageIndex = 1;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.video_library_outlined),
              onPressed: () {
                setState(() {
                  currentPageIndex = 2;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {
                setState(() {
                  currentPageIndex = 3;
                });
              },
            ),
          ],
        ),
      )
      )
    );
  }
  Widget _buildBody() {
    switch (currentPageIndex) {
      case 1:
        return _buildAddPageContent();
      case 0:
        return _buildHomePageContent();
      case 2:
        return _buildVideoPageContent();
      case 3:
        return _buildAccountPageContent();
      default:
        return Container(); //pages inconnues
    }
  }
  Widget _buildHomePageContent() {
  return Scaffold(
    body: NestedScrollView(
      headerSliverBuilder: (context, InnerBoxIsScrolled) => [
        SliverAppBar(
          floating: true,
          snap: true,
          backgroundColor: Colors.white.withAlpha(200),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Abonnements',
            style: TextStyle(
              fontFamily: "DmSans",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(220, 220, 220, 100),
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Column(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300,
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.all(7.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromRGBO(220, 220, 220, 100),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(
                        child: Text("This should be another project"),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

      //alignment: Alignment.center,
      //child: Text(
      //  'HOME'
        //mainAxisAlignment: MainAxisAlignment.center,
        //children: <Widget>[
        //  const Text(
        //    'You have pushed the button many times:',
        //  ),
        //  Text(
        //    '$_counter',
        //    style: Theme.of(context).textTheme.headlineMedium,
        //  ),
        //  const Text(
        //    'I dont know what to get here',
        //  ),
        //  Text(
        //    _modifiabletext,
        //  ),
        //  IconButton(
        //    onPressed: _decrementCounter,
        //    icon: const Icon(Icons.favorite, size: 50)
        //  )
        //],
      
  }

  Widget _buildAddPageContent() {
    return const Center(
      child: Text(
        'HELLO WORLD',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildVideoPageContent() {
    // Build content for video page
    return Scaffold (
      //resizeToAvoidBottomInset: false, // set it to false
      body: NestedScrollView(
        headerSliverBuilder: (context, InnerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.white.withAlpha(200),
            surfaceTintColor: Colors.transparent,
            title: const Text('Découvrir', 
            style: TextStyle(
              fontFamily: "DmSans",
              fontWeight: FontWeight.bold,
              ), 
            ),
            elevation: 0,
            centerTitle: true,
          ),
        ],

      body: SingleChildScrollView(
        child: Column(
          children: List.generate(9, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(7.5),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromRGBO(220, 220, 220, 100),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Center(
                  child: Text("This should be another project"),
                ),
              ),
            );
          }),
        ),
      )

  ),
  );
}

  Widget _buildAccountPageContent() {
    // Build content for account page
    return Container();
  }

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //retouner a la page d'avant
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
