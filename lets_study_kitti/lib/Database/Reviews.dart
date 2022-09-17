class Review{

  late int reviewID;
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

  Review(String subjectCode, int userID, String lecturer, 
        String subjectType, String period, double teachingQuality, 
        double difficulty, double interesting, String review,
        String recommended) {
          this.reviewID = reviewID;
          this.subjectCode = subjectCode;
          this.userID = userID;
          this.lecturer = lecturer;
          this.subjectType = subjectType;
          this.period = period;
          this.teachingQuality = teachingQuality;
          this.difficulty = difficulty;
          this.interesting = interesting;
          this.recommended = recommended;
          this.review = review;
  }
}