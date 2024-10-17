// class Counter {
//   bool _isLiked = false;
//   bool _isCommenting = false;
//   int heartCounter = 0;
//   int commentCounter = 0;

//   void getLikes({required String type})
//   {
//     if (type == 'heart') {
//       // Toggle like status
//       type = heartCounter as String;
//     } 
//     else if (type == 'comment') {
//       // Increment comments only when commenting
//       if (_isCommenting) {
//         commentCounter++;
//       } 
//     }
//   }
  
//   void incrementCounter({required String type}) {
//   // setState(() {
//     if (type == 'heart') {
//       // Toggle like status
//       _isLiked = !_isLiked;
//       if (_isLiked) {
//         heartCounter++;
//       } else {
//         if (heartCounter > 0) heartCounter--;
//       }
//     } else if (type == 'comment') {
//       // Increment comments only when commenting
//       if (_isCommenting) {
//         commentCounter++;
//       } else {
//         if (commentCounter > 0) commentCounter--;
//       }
//     }
//   // });
//   }
// }