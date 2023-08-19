import 'dart:collection';
import 'dart:convert';
import '../../../../../core/error/exceptions.dart';
import '../../../domain/entities/data_list.dart';
import 'package:http/http.dart' as http;

abstract class PortfolioRemoteDatasource {
  Future<ApiResoponseList> getGithubRepo();
}

class PortfolioRemoteDatasourceImpl implements PortfolioRemoteDatasource {
  final http.Client client;

  PortfolioRemoteDatasourceImpl(this.client);

  @override
  Future<ApiResoponseList> getGithubRepo() async {
    var api = 'https://api.github.com/users/RohanUttamVeer/repos';
    Map<String, String> headers = new HashMap();

    headers = {
      "Accept": "application/vnd.github+json",
    };
    try {
      final response = await client.get(
        Uri.parse(api),
        headers: headers,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        final result = ApiResoponseList.fromJson(jsonResponse);
        return result;
      } else {
        throw ServerException('Something went wrong !');
      }
    } catch (e) {
      throw ServerException('Something went wrong !');
    }
  }
}
