import 'package:http/http.dart' as http;
import 'package:jioapp/model/photoApi.dart';

class RemoteServices {
  Future<List<Album>?> getAlbums() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return albumFromJson(json);
    }
  }
}
