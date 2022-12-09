import 'package:coding_challenge/routes/routes.dart';
import 'package:coding_challenge/routes/routes_names.dart';
import 'package:coding_challenge/view_model/book_view_model.dart';
import 'package:coding_challenge/view_model/books_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BooksViewModel()),
          ChangeNotifierProvider(create: (_) => BookViewModel())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coding Challenge',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutesName.home,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
