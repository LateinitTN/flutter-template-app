import 'package:flutter/material.dart';
import 'package:network_layer/constants/app_dimensions/app_dimensions.dart';
import 'package:provider/provider.dart';
import '../../providers/app_providers.dart';
import '../../api_services/app_api_services.dart';
import '../../constants/app_constants.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AlbumDetailsProvider>(context, listen: false).fetchAlbumDetails();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Network Layer With Provider')),
        body: Container(
            padding: const EdgeInsets.all(PaddingCustom.semiBig), child: albumTitle(context)),
      ),
    );
  }

  Widget albumTitle(BuildContext context) {
    return Consumer<AlbumDetailsProvider>(builder: (context, myModel, child) {
      if (myModel.album.status == Status.COMPLETED) {
        return Text("${myModel.album.data.title}");
      } else if (myModel.album.status == Status.ERROR) {
        return Text("Error : ${myModel.album.message}");
      } else {
        return Text("${myModel.album.message}");
      }
    });
  }
}
