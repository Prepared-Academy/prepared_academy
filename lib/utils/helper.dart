// List<Map<String, dynamic>> ratings = [
//   {"rating": 5, "message": " good doctor"},
//   {"rating": 5, "message": " good doctor"},
//   {"rating": 5, "message": " good doctor"},
//   {"rating": 5, "message": " good doctor"},
//   {"rating": 3, "message": " good doctor"},
//   {"rating": 4, "message": " good doctor"},
//   {"rating": 3, "message": " good doctor"},
//   {"rating": 2, "message": " good doctor"},
//   {"rating": 2, "message": " good doctor"},
//   {"rating": 1, "message": " good doctor"},
// ];

// funtion() {
//   // double total = 0.0;
//   // double count = 0.0;
//   // double average = 0.0;

// // reviews -> userid-doctorid ->
// // {rating: 4, message: good doctor}
// // {rating: 3, message: good doctor}
// // {rating: 4, message: good doctor}
// // {rating: 2, message: good doctor}
// // {rating: 1, message: good doctor}
// // {rating: 3, message: good doctor}
// // {rating: 5, message: good doctor}

// // double rating = Double.parseDouble(ds.child("rating").getValue().toString());
// //                     total = total + rating;
// //                     count = count + 1;
// //                     average = total / count;

//   // for (var i = 0; i < ratings.length; i++) {
//   //   double rating = ratings[i]["rating"].toDouble();
//   //   total = total + rating;
//   //   count = count + 1;
//   //   average = total / count;
//   // }

//   // debugPrint("Your Average Rating:-------> $average");

//   int star5 = 0;
//   int star4 = 0;
//   int star3 = 0;
//   int star2 = 0;
//   int star1 = 0;

//   int totalstars = 0;

//   List<Map<String, dynamic>> stars = [
//     {"1": 1},
//     {"2": 5},
//     {"3": 7},
//     {"4": 10},
//     {"5": 8},
//   ];

//   // for (var i = 0; i < ratings.length; i++) {
//   //   if (ratings[i]["rating"] == 5) {
//   //     int index = stars.indexWhere((element) => element.containsKey("5"));
//   //     stars[index]["5"]++;
//   //   } else if (ratings[i]["rating"] == 4) {
//   //     int index = stars.indexWhere((element) => element.containsKey("4"));
//   //     stars[index]["4"]++;
//   //   } else if (ratings[i]["rating"] == 3) {
//   //     int index = stars.indexWhere((element) => element.containsKey("3"));
//   //     stars[index]["3"]++;
//   //   } else if (ratings[i]["rating"] == 2) {
//   //     int index = stars.indexWhere((element) => element.containsKey("2"));
//   //     stars[index]["2"]++;
//   //   } else if (ratings[i]["rating"] == 1) {
//   //     int index = stars.indexWhere((element) => element.containsKey("1"));
//   //     stars[index]["1"]++;
//   //   } else {
//   //     debugPrint("not found");
//   //   }
//   // }

//   for (var i = 0; i < stars.length; i++) {
//     int data = stars[i]["${i + 1}"];
//     totalstars = totalstars + data;
//   }

//   print(totalstars);

//   int overAllRating = 0;
//   for (var i = 0; i < stars.length; i++) {
//     int data = stars[i]["${i + 1}"];
//     overAllRating = overAllRating + i + 1 * data;
//   }

//   print(overAllRating);

//   double aver = overAllRating / totalstars;

//   print(aver);

//   double per5 = (5 / overAllRating) * 100;

//   print(per5);

//   // for (var i = 0; i < stars.length; i++) {
//   //   int count = stars[i]["${i + 1}"];
//   //   double percentage = 100 * count / totalstars;

//   //   double p = percentage / 100;

//   //   print(p);

//   //   // debugPrint("$count $percentage");
//   // }
// }
