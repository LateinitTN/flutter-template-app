import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_providers.dart';
import '../../constants/app_constants.dart';
import '../../api_services/app_api_services.dart';

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AlbumProvider>(context, listen: false).getAlbumsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Container(padding: const EdgeInsets.all(PaddingCustom.semiBig), child: _buildAlbums()),
    );
  }

  Widget _buildAlbums() {
    return Consumer<AlbumProvider>(builder: (_, items, __) {
      if (items.listAlbums != null)
        {
          if (items.listAlbums.status == Status.COMPLETED) {
            return ListView.builder(
              itemCount: items.listAlbums.data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Id = ${items.listAlbums.data[index].id}"),
                      Text("UserId = ${items.listAlbums.data[index].userId}"),
                      Text(
                        "Title = ${items.listAlbums.data[index].title}",
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 0.5,
                        color: Colors.grey,
                      )
                    ],
                  ),
                );
              },
            );
          } else if (items.listAlbums.status == Status.ERROR) {
            return Text("Error : ${items.listAlbums.message}");
          }
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      else
        return Center(
          child: CircularProgressIndicator(),
        );
    });
  }
}
