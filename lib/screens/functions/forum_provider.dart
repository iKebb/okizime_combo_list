import 'package:flutter/material.dart';

class ForumProvider extends ChangeNotifier {
  List<String> _comments = [];

  List<String> get comments => _comments;

  void addComment(String comment) {
    _comments.add(comment);
    notifyListeners();
  }

  void editComment(int index, String updatedComment) {
    if (index >= 0 && index < _comments.length) {
      _comments[index] = updatedComment;
      notifyListeners();
    }
  }

  void deleteComment(int index) {
    if (index >= 0 && index < _comments.length) {
      _comments.removeAt(index);
      notifyListeners();
    }
  }
}
