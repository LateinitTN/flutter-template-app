import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'flavors.dart';
import 'pages/app_pages.dart';
import 'providers/app_providers.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AlbumProvider>(create: (context) => AlbumProvider()),
      ],
      child: MaterialApp(
        title: F.title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AlbumPage(),
      ),
    );
  }
}
