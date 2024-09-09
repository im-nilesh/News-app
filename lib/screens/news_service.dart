import 'dart:convert';
import 'package:http/http.dart' as http;

const String _apiKey =
    '8a268727ec2749eba952c537d8b3f0b7'; // Replace with your API key
const String _baseUrl = 'https://newsapi.org/v2/';

Future<List<dynamic>> fetchNewsService(int page) async {
  final response = await http.get(
    Uri.parse(
      '${_baseUrl}everything?q=flutter&page=$page&pageSize=10&apiKey=$_apiKey',
    ),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['articles'];
  } else if (response.statusCode == 401) {
    throw Exception('Invalid API Key. Please check your API Key.');
  } else if (response.statusCode == 429) {
    throw Exception('API Rate Limit exceeded. Try again later.');
  } else {
    throw Exception('Failed to load news');
  }
}
