import 'package:flutter/material.dart';

class ForumProvider extends ChangeNotifier {
  //creación de clase ForumProvider que extiende a ChangeNotifier
  //que notifica a los widgets que están escuchando cambios en la clase. 
  final List<String> _comments = [
    "sasa",
    "1111"
  ];
  //propiedad privada (_comments) de lista que contiene los comentarios del foro.

  List<String> get comments => _comments;

  void addComment(String comment) {
    _comments.add(comment);
    //agrega el comentario al final de la lista _comments con .add
    notifyListeners();
    //función que llama a notificar a todos los widgets que se realiza un cambio.
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
