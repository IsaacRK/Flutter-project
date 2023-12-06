import 'package:dio/dio.dart';
import 'package:vanilla/model/banner/banner_response.dart';

class BannerRepository {
  Future<List<BannerData>> getBannerList() async {
    try {
      const url = "https://edspert.widyaedu.com/event/list";

      final response = await Dio().get(
        url,
        queryParameters: {"limit": "5"},
        options: Options(
          headers: {"x-api-key": "18be70c0-4e4d-44ff-a475-50c51ece99a0"},
        ),
      );

      final bannerResponse = BannerResponse.fromJson(response.data);

      return bannerResponse.data;
    } catch (e) {
      print('Error at BannerRepository $e');
      rethrow;
    }
  }
}
