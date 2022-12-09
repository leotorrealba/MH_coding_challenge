import 'package:coding_challenge/data/response/status.dart';
import 'package:coding_challenge/routes/routes_names.dart';
import 'package:coding_challenge/view_model/books_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BooksViewModel booksViewModel = BooksViewModel();

  @override
  void initState() {
    booksViewModel.fetchBooksListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coding Challenge')),
      body: ChangeNotifierProvider<BooksViewModel>(
        create: (BuildContext context) => booksViewModel,
        child: Consumer<BooksViewModel>(builder: (context, value, _) {
          switch (value.booksList.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.booksList.message.toString()));
            case Status.COMPLETED:
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Expanded(
                  child: ListView.builder(
                      itemCount: value.booksList.data!.books!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            String isbn = value
                                .booksList.data!.books![index]!.isbn13
                                .toString();
                            Navigator.pushNamed(
                              context,
                              RoutesName.details,
                              arguments: {'isbn': isbn},
                            );
                          },
                          child: Card(
                            child: _listTileCreator(
                                value.booksList.data!.books![index]!.image
                                    .toString(),
                                value.booksList.data!.books![index]!.title
                                    .toString(),
                                value.booksList.data!.books![index]!.subtitle
                                    .toString()),
                          ),
                        );
                      }),
                ),
              );
            case null:
              return const Center(
                  child: Text('The information coudn\'t be loaded'));
          }
        }),
      ),
    );
  }
}

class _listTileCreator extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  Key? keyValue = const Key("ListTile");

  _listTileCreator(this.image, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: keyValue,
      leading: Image.network(
        image,
        errorBuilder: (context, error, stack) {
          return const Icon(
            Icons.error,
            color: Colors.red,
          );
        },
        height: 40,
        width: 40,
        fit: BoxFit.cover,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
