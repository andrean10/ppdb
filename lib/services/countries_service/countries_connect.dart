import 'package:get/get.dart';
import 'package:ppdb/utils/constants_connect.dart';

class CountriesConnect extends GetConnect {
  Future<Response> get fetchCountries =>
      get(ConstantsConnect.endPointCountries);
}
