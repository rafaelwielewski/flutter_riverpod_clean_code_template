import 'package:app/src/config.dart';
import 'package:app/src/routing/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock.dart';

late DioAdapter dioAdapterTest;

Future<void> setupTest() async {
  isTesting = true;
  isDevMode = true;
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  appRouter = MockAppRouter();
  when(() => appRouter.replaceAll(any())).thenAnswer((_) => Future.value());

  final dio = Dio();
  dioAdapterTest = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
}
