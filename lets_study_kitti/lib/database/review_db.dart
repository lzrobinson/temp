import 'package:lets_study_kitti/database/review_mapping.dart';
import 'package:lets_study_kitti/database/repository.dart';

class ReviewData{

  late Respository respository;

  ReviewData(){

    respository = Respository();
  }

  saveReview(ReviewMap review) async{

    return await respository.insertData('reviews', review.reviewMap());
  }

  readReview() async{

    respository.readData('reviews');
  }

}