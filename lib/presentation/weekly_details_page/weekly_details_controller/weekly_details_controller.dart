import 'package:flutter/material.dart';

class WeeklyDetailsController extends ChangeNotifier {
  TextEditingController reviewTextController = TextEditingController();
  Map<String, TextEditingController> repoControllers = {};
  Map<String, TextEditingController> postUrlControllers = {};

  void initControllers(String initialReview) {
    reviewTextController.text = initialReview;
  }

  TextEditingController getRepoController(String projId, String initialUrl) {
    if (!repoControllers.containsKey(projId)) {
      repoControllers[projId] = TextEditingController(text: initialUrl);
    }
    return repoControllers[projId]!;
  }

  TextEditingController getPostUrlController(String postId, String initialUrl) {
    if (!postUrlControllers.containsKey(postId)) {
      postUrlControllers[postId] = TextEditingController(text: initialUrl);
    }
    return postUrlControllers[postId]!;
  }

  @override
  void dispose() {
    reviewTextController.dispose();
    for (var c in repoControllers.values) {
      c.dispose();
    }
    for (var c in postUrlControllers.values) {
      c.dispose();
    }
    super.dispose();
  }
}
