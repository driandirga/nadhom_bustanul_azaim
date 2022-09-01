import 'package:flutter/material.dart';

import '../../constant/app_constanst.dart';
import '../../modules/db_instance.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {required this.title, required this.newId, required this.home, Key? key})
      : super(key: key);
  final Widget title;
  final String newId;
  final bool home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        backgroundColor: kGreenLeaf,
        actions: [
          home
              ? IconButton(
                  onPressed: () async {
                    DBProvider.db.deleteIsiBookmark(newId);
                    DBProvider.db.createBookmark({
                      'id_isi': newId,
                    });
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.add),
                )
              : IconButton(
                  onPressed: () async {
                    DBProvider.db.deleteDtlBookmark(newId);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.delete),
                ),
        ],
      ),
      body: FutureBuilder(
        future: DBProvider.db.getAllIsi(newId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                        '${snapshot.data[index].isiDt}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
