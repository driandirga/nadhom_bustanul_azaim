import 'package:bustanul_azaim/page/detail_page/detail_page.dart';
import 'package:flutter/material.dart';

import '../../../constant/app_constanst.dart';
import '../../../modules/db_instance.dart';
import '../../../providers/isi_provider.dart';
import '../../../providers/kategori_provider.dart';
import '../../about_page/about_page.dart';
import 'home_banner.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({Key? key}) : super(key: key);

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    _aboutRoute() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const AboutPage();
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: kGreenLeaf,
        actions: [
          IconButton(
            onPressed: _aboutRoute,
            icon: const Icon(
              Icons.info,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const HomeBanner(),
          const SizedBox(
            height: dPadding,
          ),
          _buildKategoriListView(),
        ],
      ),
    );
  }

  Future _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    await DBProvider.db.database;

    var kategoriProvider = KategoriApiProvider();
    await kategoriProvider.getAllKategori();

    var isiProvider = IsiApiProvider();
    await isiProvider.getAllIsi();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _buildKategoriListView() {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Expanded(
            child: RefreshIndicator(
              onRefresh: _loadFromApi,
              child: FutureBuilder(
                future: DBProvider.db.getAllKategori(),
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
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    title: Text(
                                        '${snapshot.data[index].namaKategori}'),
                                    newId: '${snapshot.data[index].idKategori}',
                                    home: true,
                                  ),
                                ),
                              );
                            },
                            leading: CircleAvatar(
                              radius: 26,
                              backgroundColor: kGreenTosca,
                              child: Image.asset(
                                'assets/images/ic_tentang.png',
                              ),
                            ),
                            title: Text(
                              '${snapshot.data[index].namaKategori}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            subtitle: Text(
                              '${snapshot.data[index].namaKategori}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          );
  }
}
