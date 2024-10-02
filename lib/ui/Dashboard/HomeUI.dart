import 'package:flutter/material.dart';
import 'package:flutter_amazon/api/Repo.dart';
import 'package:flutter_amazon/entity/loginEntity.dart';
import 'dart:async';
import 'package:flutter_amazon/utils/ExtendFun.dart';
import '../../Enum/Enum.dart';

const TAG = "HomeUI";
class HomeUI extends StatefulWidget {
  const HomeUI({super.key});
  @override
  State<HomeUI> createState() => _HomeUIState();
}


class _HomeUIState extends State<HomeUI> {
//  late Future<Album> futureAlbum = Future<Album>;
  var apiStatus = "";
  onApiStatus(status){
      setState(() {
       apiStatus = status;
      });
  }
  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
    var endPoint = "";
    var request = {};

    fetchAlbum2(endPoint,request , api : (Api type, Album? entity, String? value) {
      switch(type){
        case Api.connection: 
        Logger(TAG).log(value!);
        onApiStatus(value);
        break;
        case Api.loading: 
        Logger(TAG).log(type.name);
        onApiStatus(type.name);
        break;
        case Api.success: 
        Logger(TAG).log(entity!.title);
        onApiStatus(entity.title);
        break;
        case Api.failure: 
        Logger(TAG).log(type.name);
        onApiStatus(value);
        break;
        case Api.timeout: 
        Logger(TAG).log(value!);
        onApiStatus(type.name);
        break;
        default:break;
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {

    return Text(apiStatus);
    // return  Center(
          // child: FutureBuilder<Album>(
            // future: futureAlbum,
            // builder: (context, snapshot) {
            //   if (snapshot.hasData) {
            //     return Text(snapshot.data!.title);
            //   } else if (snapshot.hasError) {
            //     return Text('${snapshot.error}');
            //   }
            //   return Text("data");
              // return const CircularProgressIndicator();
            // },
          // ),
        // );
  }
}
