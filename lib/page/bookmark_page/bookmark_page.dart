import 'dart:async';
import 'package:flutter/material.dart';

import '../../constant/app_constanst.dart';
import '../../modules/db_instance.dart';
import '../detail_page/detail_page.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  FutureOr onGoBack(value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
        backgroundColor: kGreenLeaf,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: kGreenLeaf,
          ),
        ),
      ),
      body: FutureBuilder(
        future: DBProvider.db.getAllBookmark(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    onTap: () async {
                      await Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                title: FutureBuilder(
                                  future: DBProvider.db.getGblBookmark(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return const Text('No Data');
                                    } else {
                                      return Text(
                                        '${snapshot.data[index].namaKategori}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      );
                                    }
                                  },
                                ),
                                newId: '${snapshot.data[index].idBookmark}',
                                home: false,
                              ),
                            ),
                          )
                          .then(onGoBack);
                    },
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: kGreenTosca,
                      child: Image.asset(
                        'assets/images/ic_tentang.png',
                      ),
                    ),
                    title: FutureBuilder(
                      future: DBProvider.db.getGblBookmark(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Text('No Data');
                        } else {
                          return Text(
                            '${snapshot.data[index].namaKategori}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          );
                        }
                      },
                    ),
                    trailing: GestureDetector(
                      onTap: () async {
                        DBProvider.db.deleteDtlBookmark(
                            '${snapshot.data[index].idBookmark}');
                        setState(() {});
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
