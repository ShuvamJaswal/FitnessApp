import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'api_url.g.dart';

@riverpod
String apiUrl(ApiUrlRef ref) {
  return "https://fitnessserver.vercel.app/";
}
