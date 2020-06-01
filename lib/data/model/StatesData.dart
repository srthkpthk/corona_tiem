class StatesData {
  List<CasesTimeSery> cases_time_series;
  List<Statewise> statewise;

  StatesData({this.cases_time_series, this.statewise});

  factory StatesData.fromJson(Map<String, dynamic> json) {
    return StatesData(
      cases_time_series: json['cases_time_series'] != null
          ? (json['cases_time_series'] as List)
              .map((i) => CasesTimeSery.fromJson(i))
              .toList()
          : null,
      statewise: json['statewise'] != null
          ? (json['statewise'] as List)
              .map((i) => Statewise.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cases_time_series != null) {
      data['cases_time_series'] =
          this.cases_time_series.map((v) => v.toJson()).toList();
    }
    if (this.statewise != null) {
      data['statewise'] = this.statewise.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CasesTimeSery {
  String dailyconfirmed;
  String dailydeceased;
  String dailyrecovered;
  String date;
  String totalconfirmed;
  String totaldeceased;
  String totalrecovered;

  CasesTimeSery(
      {this.dailyconfirmed,
      this.dailydeceased,
      this.dailyrecovered,
      this.date,
      this.totalconfirmed,
      this.totaldeceased,
      this.totalrecovered});

  factory CasesTimeSery.fromJson(Map<String, dynamic> json) {
    return CasesTimeSery(
      dailyconfirmed: json['dailyconfirmed'],
      dailydeceased: json['dailydeceased'],
      dailyrecovered: json['dailyrecovered'],
      date: json['date'],
      totalconfirmed: json['totalconfirmed'],
      totaldeceased: json['totaldeceased'],
      totalrecovered: json['totalrecovered'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyconfirmed'] = this.dailyconfirmed;
    data['dailydeceased'] = this.dailydeceased;
    data['dailyrecovered'] = this.dailyrecovered;
    data['date'] = this.date;
    data['totalconfirmed'] = this.totalconfirmed;
    data['totaldeceased'] = this.totaldeceased;
    data['totalrecovered'] = this.totalrecovered;
    return data;
  }
}

class Statewise {
  String active;
  String confirmed;
  String deaths;
  String deltaconfirmed;
  String deltadeaths;
  String deltarecovered;
  String lastupdatedtime;
  String migratedother;
  String recovered;
  String state;
  String statecode;
  String statenotes;

  Statewise(
      {this.active,
      this.confirmed,
      this.deaths,
      this.deltaconfirmed,
      this.deltadeaths,
      this.deltarecovered,
      this.lastupdatedtime,
      this.migratedother,
      this.recovered,
      this.state,
      this.statecode,
      this.statenotes});

  factory Statewise.fromJson(Map<String, dynamic> json) {
    return Statewise(
      active: json['active'],
      confirmed: json['confirmed'],
      deaths: json['deaths'],
      deltaconfirmed: json['deltaconfirmed'],
      deltadeaths: json['deltadeaths'],
      deltarecovered: json['deltarecovered'],
      lastupdatedtime: json['lastupdatedtime'],
      migratedother: json['migratedother'],
      recovered: json['recovered'],
      state: json['state'],
      statecode: json['statecode'],
      statenotes: json['statenotes'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['deltaconfirmed'] = this.deltaconfirmed;
    data['deltadeaths'] = this.deltadeaths;
    data['deltarecovered'] = this.deltarecovered;
    data['lastupdatedtime'] = this.lastupdatedtime;
    data['migratedother'] = this.migratedother;
    data['recovered'] = this.recovered;
    data['state'] = this.state;
    data['statecode'] = this.statecode;
    data['statenotes'] = this.statenotes;
    return data;
  }
}
