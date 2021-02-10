import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '';


void main() async {
  WidgetsFlutterBiding.ensureInitialized();
  await Firebase.initializaApp();
  runApp(
      MultiProvider(
        providers: globalProviders,
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<loginViewModel>(context, listen: false);

    return MaterialApp(
        title: 'マネさん',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        iconTheme: IconThemedata(
          color: Colors.white,
        ),
      ),
      home: FutureBuilder(
        future: loginViewModel.isSignIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data){
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}

