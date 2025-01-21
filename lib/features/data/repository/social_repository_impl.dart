import 'package:either_dart/src/either.dart';
import 'package:flutter_exam/features/data/api/social_api.dart';
import 'package:flutter_exam/features/domain/model/fail_model.dart';
import 'package:flutter_exam/features/domain/model/social_model.dart';
import 'package:flutter_exam/features/domain/model/success_model.dart';
import 'package:flutter_exam/features/domain/repository/social_repository.dart';

class SocialRepositoryImpl extends SocialRepository {

  final SocialApi socialApi;

  SocialRepositoryImpl({required this.socialApi});

  @override
  Future<Either<Fail, Success<SocialModel>>> getSocial() async {
    final response = await socialApi.getSocial();

    if(response.isSuccess == true){
        return Right(
          Success(
            data: SocialModel(
              name: response.data?.name ?? "",
              history: response.data?.history ?? "",
              imgUrl: response.data?.imgUrl ?? "",
            )
          )
        );
    }else {
      return Left(
        Fail(
          message: response.errorMessage ?? "",
        ),
      );
    }
  }

}