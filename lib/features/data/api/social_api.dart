import 'package:flutter_exam/core/dio/api_response.dart';
import 'package:flutter_exam/core/dio/api_wrapper.dart';
import 'package:flutter_exam/features/domain/entity/social_result_entity.dart';

class SocialApi {
  final ApiWrapper apiWrapper;

  SocialApi({required this.apiWrapper});

  Future<ApiResponse<SocialResultEntity>> getSocial() async {
    return await apiWrapper.request<SocialResultEntity>(
          () async => await apiWrapper.dio.get(
        '/socials',
      ),
      fromJson: (json) => SocialResultEntity.fromJson(json),
    );
  }
}