import 'package:flutter_exam/features/domain/model/company_model.dart';

abstract class OthersRepository {
  List<CompanyModel> getOtherCompany();
}