class ReviewMap{

  late String subjectCode;
  late int userID;
  late String lecturer;
  late int compulsory;
  late int examWeightage;
  late String period;
  late int teachingQuality;
  late int difficulty;
  late int interesting;
  late String review;
  late String recommended;


  reviewMap(){
    var mapping = Map<String, dynamic>();
    mapping['subjectCode'] = subjectCode;
    mapping['userID'] = userID;
    mapping['lecturer'] = lecturer;
    mapping['compulsory'] = compulsory;
    mapping['period'] = period;
    mapping['teachingQuality'] = teachingQuality;
    mapping[' difficulty'] = difficulty;
    mapping['interesting'] = interesting;
    mapping['review'] = review;
    mapping['recommended'] = recommended;

    return mapping;

  }
}