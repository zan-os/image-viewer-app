import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unsplash_flutter/config/constant_config.dart';
import 'package:unsplash_flutter/features/image_list/data/datasource/remote/home_remote_datasource.dart';
import 'package:unsplash_flutter/features/image_list/data/model/response/image_model.dart';

import '../../../../fixture/fixture_reader.dart';
import 'home_remote_datasource_test.mocks.dart';

@GenerateMocks([HttpClientAdapter, Dio])
void main() {
  late HomeRemoteDataSourceImpl imageListRemoteDataSource;
  late ConstantConfig constantConfig;
  late MockDio mockDio;
  late MockHttpClientAdapter mockDioAdapter;
  late Map<String, String> headers;

  setUp(() {
    dotenv.testLoad(fileInput: fixture('.env'));

    mockDio = MockDio();

    constantConfig = ConstantConfig();

    mockDioAdapter = MockHttpClientAdapter();

    headers = {};
    headers['Authorization'] = 'Client-ID ${constantConfig.apiKey}';

    mockDio.httpClientAdapter = mockDioAdapter;
    mockDio.options = BaseOptions(headers: headers);

    imageListRemoteDataSource = HomeRemoteDataSourceImpl(
      dio: mockDio,
      constantConfig: constantConfig,
    );
  });

  group('getImageList', () {
    void setupSuccessResponse() {
      final responsePayload = jsonDecode(fixture('image_list_response.json'));

      final response = Response(
        data: responsePayload,
        statusCode: 200,
        headers: Headers.fromMap({
          Headers.contentTypeHeader: [Headers.jsonContentType],
        }),
        requestOptions: RequestOptions(),
      );

      when(mockDio.get(any)).thenAnswer((_) async => response);
    }

    test('make sure there is a GET request to endpoint /photos', () async {
      setupSuccessResponse();

      // act
      await imageListRemoteDataSource.getImageList();

      // assert
      verify(mockDio.get('${constantConfig.baseUrl}/photos'));
    });

    test(
        'make sure to return ImageModel object when the response code'
        ' is successfull from the endpoint', () async {
      final imageListJson = jsonDecode(fixture('image_list_response.json'));
      final tImageListResponseModel = imageListJson
          .map<ImageModel>((response) => ImageModel.fromJson(response))
          .toList();

      setupSuccessResponse();

      // act
      final result = await imageListRemoteDataSource.getImageList();

      // assert
      expect(result, tImageListResponseModel);
    });
  });
}
