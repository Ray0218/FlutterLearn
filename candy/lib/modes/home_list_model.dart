
 
class HomeListModel {
  int code;
  String msg;
  ContentData data;

  HomeListModel({this.code, this.msg, this.data});

  HomeListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new ContentData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class ContentData {
  int count;
  List<UserModel> modelList;

  ContentData({this.count, this.modelList});

  ContentData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['list'] != null) {
      modelList = new List<UserModel>();
      json['list'].forEach((v) {
        modelList.add(new UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.modelList != null) {
      data['list'] = this.modelList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserModel {
  int customerId;
  String nickName;
  String headimageUrl;
  String gender;
  int age;
  String profile;
  int wxStatus;
  String wxAccount;
  int wxAccessRestriction;
  int jobAccessRestriction;
  int memberStatus;
  bool isVip;
  int assetsAccessRestriction;
  int jobStatus;
  int assetsStatus;
  int incomeStatus;
  int qualificationsStatus;
  String distance;
  int spendStatus;
  int identityStatus;
  int incomeAccessRestriction;
  int qualificationsAccessRestriction;
  int sesameAccessRestriction;
  bool existQualificationsStatus;
  bool existJobStatus;
  bool existAssetsStatus;
  bool existIncomeStatus;
  bool existSesameStatus;
  int sesameStatus;
  bool wxAccessStatus;
  bool jobAccessStatus;
  bool assetsAccessStatus;
  bool incomeAccessStatus;
  bool qualificationsAccessStatus;
  bool sesameAccessStatus;

  UserModel(
      {this.customerId,
      this.nickName,
      this.headimageUrl,
      this.gender,
      this.age,
      this.profile,
      this.wxStatus,
      this.wxAccount,
      this.wxAccessRestriction,
      this.jobAccessRestriction,
      this.memberStatus,
      this.isVip,
      this.assetsAccessRestriction,
      this.jobStatus,
      this.assetsStatus,
      this.incomeStatus,
      this.qualificationsStatus,
      this.distance,
      this.spendStatus,
      this.identityStatus,
      this.incomeAccessRestriction,
      this.qualificationsAccessRestriction,
      this.sesameAccessRestriction,
      this.existQualificationsStatus,
      this.existJobStatus,
      this.existAssetsStatus,
      this.existIncomeStatus,
      this.existSesameStatus,
      this.sesameStatus,
      this.wxAccessStatus,
      this.jobAccessStatus,
      this.assetsAccessStatus,
      this.incomeAccessStatus,
      this.qualificationsAccessStatus,
      this.sesameAccessStatus});

  UserModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    nickName = json['nickName'];
    headimageUrl = json['headimageUrl'];
    gender = json['gender'];
    age = json['age'];
    profile = json['profile'];
    wxStatus = json['wxStatus'];
    wxAccount = json['wxAccount'];
    wxAccessRestriction = json['wxAccessRestriction'];
    jobAccessRestriction = json['jobAccessRestriction'];
    memberStatus = json['memberStatus'];
    isVip = json['isVip'];
    assetsAccessRestriction = json['assetsAccessRestriction'];
    jobStatus = json['jobStatus'];
    assetsStatus = json['assetsStatus'];
    incomeStatus = json['incomeStatus'];
    qualificationsStatus = json['qualificationsStatus'];
    distance = json['distance'];
    spendStatus = json['spendStatus'];
    identityStatus = json['identityStatus'];
    incomeAccessRestriction = json['incomeAccessRestriction'];
    qualificationsAccessRestriction = json['qualificationsAccessRestriction'];
    sesameAccessRestriction = json['sesameAccessRestriction'];
    existQualificationsStatus = json['existQualificationsStatus'];
    existJobStatus = json['existJobStatus'];
    existAssetsStatus = json['existAssetsStatus'];
    existIncomeStatus = json['existIncomeStatus'];
    existSesameStatus = json['existSesameStatus'];
    sesameStatus = json['sesameStatus'];
    wxAccessStatus = json['wxAccessStatus'];
    jobAccessStatus = json['jobAccessStatus'];
    assetsAccessStatus = json['assetsAccessStatus'];
    incomeAccessStatus = json['incomeAccessStatus'];
    qualificationsAccessStatus = json['qualificationsAccessStatus'];
    sesameAccessStatus = json['sesameAccessStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['nickName'] = this.nickName;
    data['headimageUrl'] = this.headimageUrl;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['profile'] = this.profile;
    data['wxStatus'] = this.wxStatus;
    data['wxAccount'] = this.wxAccount;
    data['wxAccessRestriction'] = this.wxAccessRestriction;
    data['jobAccessRestriction'] = this.jobAccessRestriction;
    data['memberStatus'] = this.memberStatus;
    data['isVip'] = this.isVip;
    data['assetsAccessRestriction'] = this.assetsAccessRestriction;
    data['jobStatus'] = this.jobStatus;
    data['assetsStatus'] = this.assetsStatus;
    data['incomeStatus'] = this.incomeStatus;
    data['qualificationsStatus'] = this.qualificationsStatus;
    data['distance'] = this.distance;
    data['spendStatus'] = this.spendStatus;
    data['identityStatus'] = this.identityStatus;
    data['incomeAccessRestriction'] = this.incomeAccessRestriction;
    data['qualificationsAccessRestriction'] =
        this.qualificationsAccessRestriction;
    data['sesameAccessRestriction'] = this.sesameAccessRestriction;
    data['existQualificationsStatus'] = this.existQualificationsStatus;
    data['existJobStatus'] = this.existJobStatus;
    data['existAssetsStatus'] = this.existAssetsStatus;
    data['existIncomeStatus'] = this.existIncomeStatus;
    data['existSesameStatus'] = this.existSesameStatus;
    data['sesameStatus'] = this.sesameStatus;
    data['wxAccessStatus'] = this.wxAccessStatus;
    data['jobAccessStatus'] = this.jobAccessStatus;
    data['assetsAccessStatus'] = this.assetsAccessStatus;
    data['incomeAccessStatus'] = this.incomeAccessStatus;
    data['qualificationsAccessStatus'] = this.qualificationsAccessStatus;
    data['sesameAccessStatus'] = this.sesameAccessStatus;
    return data;
  }
}
