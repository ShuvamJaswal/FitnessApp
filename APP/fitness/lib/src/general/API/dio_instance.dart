import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dio_instance.g.dart';

@riverpod
DioService dioService(DioServiceRef ref) {
  return DioService();
}

class DioService {
  Future<Response> get(String url,
      {Map<String, dynamic> data = const {}}) async {
    final cacheDir = await getApplicationDocumentsDirectory();
    final options = CacheOptions(
      store: HiveCacheStore(cacheDir.path, hiveBoxName: 'fitness'),
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 7),
      priority: CachePriority.high,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    final dio = Dio()
      ..interceptors.add(
        DioCacheInterceptor(
          options: options,
        ),
      );
    return dio.get(url, queryParameters: data);
  }
}
