class ReviewMap{

  late String subjectCode;
  late int userID;
  late String lecturer;
  late String subjectType;
  late String period;
  late double teachingQuality;
  late double difficulty;
  late double interesting;
  late String review;
  late String recommended;


  reviewMap(){
    var mapping = Map<String, dynamic>();
    mapping['subjectCode'] = subjectCode;
    mapping['userID'] = userID;
    mapping['lecturer'] = lecturer;
    mapping['subjectType'] = subjectType;
    mapping['period'] = period;
    mapping['teachingQuality'] = teachingQuality;
    mapping[' difficulty'] = difficulty;
    mapping['interesting'] = interesting;
    mapping['review'] = review;
    mapping['recommended'] = recommended;

    return mapping;

  }
}