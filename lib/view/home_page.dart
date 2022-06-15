import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../modelclass/response.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Dio();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ailotte"),
      ),
      body: FutureBuilder<ResponseData>(
          future: _requestData(),
          builder: (context,  snapshot) {
            if (snapshot.hasData) {
              var screenSize = MediaQuery.of(context).size;
          return Container(
            child: Text(snapshot.data.toString()),
          );

            }
            return const Center(child: CircularProgressIndicator());
          })
    );
  }
  Future<ResponseData> _requestData() async {
    const _baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum';
    ResponseData? responseData;
    Response response = await _dio.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum");
    print('User Info: ${response.data}');
    responseData = ResponseData.fromJson(response.data);
    return ResponseData.fromJson(response.data);


}

}
