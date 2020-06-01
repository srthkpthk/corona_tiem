/// state : "State Unassigned"
/// statecode : "UN"
/// districtData : [{"district":"Unassigned","notes":"","active":5121,"confirmed":5121,"deceased":0,"recovered":0,"delta":{"confirmed":448,"deceased":0,"recovered":0}}]

class DistrictData {
  String _state;
  String _statecode;
  List<DistrictDataBean> _districtData;

  String get state => _state;

  String get statecode => _statecode;

  List<DistrictDataBean> get districtData => _districtData;

  DistrictData(this._state, this._statecode, this._districtData);

  DistrictData.map(dynamic obj) {
    _state = obj["state"];
    _statecode = obj["statecode"];
    _districtData = obj["districtData"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["state"] = _state;
    map["statecode"] = _statecode;
    map["districtData"] = _districtData;
    return map;
  }
}

/// district : "Unassigned"
/// notes : ""
/// active : 5121
/// confirmed : 5121
/// deceased : 0
/// recovered : 0
/// delta : {"confirmed":448,"deceased":0,"recovered":0}

class DistrictDataBean {
  String _district;
  String _notes;
  int _active;
  int _confirmed;
  int _deceased;
  int _recovered;

  String get district => _district;

  String get notes => _notes;

  int get active => _active;

  int get confirmed => _confirmed;

  int get deceased => _deceased;

  int get recovered => _recovered;

  DistrictDataBean(this._district, this._notes, this._active, this._confirmed,
      this._deceased, this._recovered);

  DistrictDataBean.map(dynamic obj) {
    _district = obj["district"];
    _notes = obj["notes"];
    _active = obj["active"];
    _confirmed = obj["confirmed"];
    _deceased = obj["deceased"];
    _recovered = obj["recovered"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["district"] = _district;
    map["notes"] = _notes;
    map["active"] = _active;
    map["confirmed"] = _confirmed;
    map["deceased"] = _deceased;
    map["recovered"] = _recovered;

    return map;
  }
}
