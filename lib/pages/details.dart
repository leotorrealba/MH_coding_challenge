import 'package:coding_challenge/data/response/status.dart';
import 'package:coding_challenge/view_model/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  BookViewModel bookViewModel = BookViewModel();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    const TextStyle informationStyle = TextStyle(
        color: Colors.black54, fontSize: 16, fontWeight: FontWeight.normal);
    if (arguments != null) {
      String? isbn = arguments['isbn'];
      bookViewModel.fetchBookDetailsApi(isbn!);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: ChangeNotifierProvider<BookViewModel>(
        create: (BuildContext context) => bookViewModel,
        child: Consumer<BookViewModel>(builder: (context, value, _) {
          switch (value.bookDetail.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        value.bookDetail.message.toString(),
                        style: informationStyle,
                      )));
            case Status.COMPLETED:
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Image.network(
                            value.bookDetail.data!.image.toString(),
                            errorBuilder: (context, error, stack) {
                              return const Icon(
                                Icons.error,
                                color: Colors.red,
                              );
                            },
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          value.bookDetail.data!.title.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          value.bookDetail.data!.subtitle.toString(),
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Description',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          value.bookDetail.data!.desc.toString(),
                          style: informationStyle,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Aditional Information',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5.0),
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _textInfo(
                                    'Authors: ${value.bookDetail.data!.authors.toString()}',
                                    informationStyle),
                                _textInfo(
                                    'Pages: ${value.bookDetail.data!.pages.toString()}',
                                    informationStyle),
                                _textInfo(
                                    'Price: ${value.bookDetail.data!.price.toString()}',
                                    informationStyle),
                                _textInfo(
                                    'Language: ${value.bookDetail.data!.language.toString()}',
                                    informationStyle),
                                _textInfo(
                                    'Year: ${value.bookDetail.data!.year.toString()}',
                                    informationStyle),
                                _textInfo(
                                    'Publisher: ${value.bookDetail.data!.publisher.toString()}',
                                    informationStyle),
                                _textInfo(
                                    'ISBN: ${value.bookDetail.data!.isbn13.toString()}',
                                    informationStyle),
                                _textInfo(
                                    'URL: ${value.bookDetail.data!.url.toString()}',
                                    informationStyle),
                                _textInfo(
                                    'Rating: ${value.bookDetail.data!.rating.toString()}',
                                    informationStyle),
                              ]),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: (() => Navigator.pop(context)),
                            child: const Text('Back'))
                      ],
                    ),
                  ),
                ),
              );
            case null:
              return const Center(
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('The information coudn\'t be loaded')));
          }
        }),
      ),
    );
  }
}

class _textInfo extends StatelessWidget {
  String text;
  TextStyle textStyle;
  _textInfo(this.text, this.textStyle);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
