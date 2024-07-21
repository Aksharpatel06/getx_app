import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiSarvice{
  Future<String?> fetchData()
  async {
    String apiJson = 'https://dummyjson.com/recipes';
    Uri uri = Uri.parse(apiJson);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      print('Api Called');
      return response.body;
    } else {
      return null;
    }
  }
}