

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Racine de l'application.
  //Builder

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        //Theme de l'application
        useMaterial3: true,
      ),
      home: const MyHomePage(title:'fzafazfaz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  //Homepage

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Class MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // ignore: unused_field
  String _modifiabletext = 'hey yo';
  int currentPageIndex = 0;
  final TextStyle dmSansStyle = GoogleFonts.dmSans();

  // ignore: unused_element
  void _incrementCounter() {
    setState(() {
      // Fonction _decrementcounter
      // ajoute un de counter 
      // Modifie le texte _modifiabletext
      _counter++;
      _modifiabletext = 'yo what ?';
    });
  }

  // ignore: unused_element
  void _decrementCounter() {
    setState(() {
      // Fonction _decrementcounter
      // retire un de counter 
      // Modifie le texte _modifiabletext
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
      // Structure fixe principale 
      // Contien le Appbar bottom
      
      body: _buildBody(),
      bottomNavigationBar: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      // Bottom AppBar
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
                  currentPageIndex = 0; //Change l'index pour aller au menu home
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                setState(() {
                  currentPageIndex = 1; //Change l'index pour aller au menu ajouter
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.video_library_outlined), 
              onPressed: () {
                setState(() {
                  currentPageIndex = 2; //Change l'index pour aller au menu decouverte
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              onPressed: () {
                setState(() {
                  currentPageIndex = 3; //Change l'index pour aller au menu compte
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
    switch (currentPageIndex) { // Condition dans le cas ou la valeur Current pasge index change, le widget change
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
  Widget _buildHomePageContent() { //Page HomePage 
  return Scaffold(
    body: NestedScrollView(
      // ignore: non_constant_identifier_names
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
            SizedBox(
              height: 150,
              child: ListView.builder( //ListView.Builder crée une liste d'items de nombre itemCount avec un axe Horizontal (Scroll abonnemnts instagram)
                scrollDirection: Axis.horizontal, //Génère des ronds de profile pour chaque profile mis en amis
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(220, 220, 220, 100),
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
              ),
            ),
            Column(
              children: List.generate(3, (index) { //Génère grace a List.generate une liste de Containers qui sont des containers a images et contenu
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.all(7.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color.fromRGBO(220, 220, 220, 100),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(
                      child: Text("This should be another project"),
                    ),
                  ),
                );
              }),
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

  Widget _buildAddPageContent() { //Page AddPage
    return const Center(
      child: Text(
        'HELLO WORLD',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildVideoPageContent() { //Page VideoDecouverte
    // Build content for video page
    return Scaffold (
      //resizeToAvoidBottomInset: false, // set it to false
      body: NestedScrollView(
        // ignore: non_constant_identifier_names
        headerSliverBuilder: (context, InnerBoxIsScrolled) => [ // Crée une appbar qui descend ou monte par rapport au scroll
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
          children: List.generate(9, (index) { //Génère grace a la foction list.generate une nombre defini et modifiable de Containers.
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(7.5),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color.fromRGBO(220, 220, 220, 100),
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

  Widget _buildAccountPageContent() { //PAge Account
    // Build content for account page
    return Container();
  }

class SecondRoute extends StatelessWidget {  //Ca sert a rien mais c'est là
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
