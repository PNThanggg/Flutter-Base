import 'dart:convert';
import 'dart:io';

import '../core/better_player_utils.dart';
import '../dash/better_player_dash_utils.dart';
import '../hls/better_player_hls_utils.dart';

class BetterPlayerAsmsUtils {
  static const String _hlsExtension = "m3u8";
  static const String _dashExtension = "mpd";

  static final HttpClient _httpClient = HttpClient()..connectionTimeout = const Duration(seconds: 5);

  ///Check if given url is HLS / DASH-type data source.
  static bool isDataSourceAsms(String url) => isDataSourceHls(url) || isDataSourceDash(url);

  ///Check if given url is HLS-type data source.
  static bool isDataSourceHls(String url) => url.contains(_hlsExtension);

  ///Check if given url is DASH-type data source.
  static bool isDataSourceDash(String url) => url.contains(_dashExtension);

  ///Parse playlist based on type of stream.
  static Future<Future> parse(String data, String masterPlaylistUrl) async {
    return isDataSourceDash(masterPlaylistUrl)
        ? BetterPlayerDashUtils.parse(data, masterPlaylistUrl)
        : BetterPlayerHlsUtils.parse(data, masterPlaylistUrl);
  }

  static Future<String?> getDataFromUrl(
    String url, [
    Map<String, String?>? headers,
  ]) async {
    try {
      final request = await _httpClient.getUrl(Uri.parse(url));
      if (headers != null) {
        headers.forEach((name, value) => request.headers.add(name, value!));
      }

      final response = await request.close();
      var data = "";
      await response.transform(const Utf8Decoder()).listen((content) {
        data += content.toString();
      }).asFuture<String?>();

      return data;
    } catch (exception) {
      BetterPlayerUtils.log("GetDataFromUrl failed: $exception");
      return null;
    }
  }
}
