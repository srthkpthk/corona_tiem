import 'package:coronatiem/data/model/DistrictData.dart';
import 'package:coronatiem/data/model/StatesData.dart';
import 'package:dio/dio.dart';

class AppRepository {
  final String URL = "https://api.covid19india.org/";
  final Dio _dio = Dio();
  final String forStates = "data.json";
  final String forDistrict = "v2/state_district_wise.json";

  Future<StatesData> getStatesData() async {
    try {
      Response response = await _dio.get(URL + forStates);
      return StatesData.fromJson(response.data);
    } catch (error) {
      return StatesData.fromJson(null);
    }
  }

  Future<List<DistrictDataBean>> getDistrictData(String statecode) async {
    List<DistrictDataBean> districtData = List();
    var pp;
    Response response = await _dio.get(URL + forDistrict);
    for (var e in response.data) {
      if (e['statecode'] == statecode) {
        print(e['state']);
        pp = e['districtData'];
      }
    }
    for (var i in pp) {
      districtData.add(DistrictDataBean.map(i));
    }
    return districtData;
  }
}
