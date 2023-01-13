import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/models/apod.dart';
import 'package:showcase/services/http_service.dart';

const _baseApiUrl = 'https://api.nasa.gov/planetary/apod';

const _apiKey = String.fromEnvironment('API_KEY');

final pictureProvider = FutureProvider<Picture>((ref) async {
  final http = ref.watch(httpServiceProvider);
  final result = await http.get(
    _baseApiUrl,
    queryParameters: {
      'api_key': _apiKey,
    },
  );

  if (result.statusCode == 200) {
    assert(result.data != null);
    return Picture(result.data['title'], result.data['url']);
  }

  print(result.statusMessage);
  throw Exception();
});
