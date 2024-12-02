import 'package:flutter/material.dart';

class ForumProvider extends ChangeNotifier {
  //creación de clase ForumProvider que extiende a ChangeNotifier
  //que notifica a los widgets que están escuchando cambios en la clase.
  final List<String> _comments = [
    "¿Por qué los gatos no usan nunca el ordenador?",
    "Porque siempre se les cae el ratón",
    "jaja brutal, si no me pones 100 me tiro por la ventana"
  ];
  //propiedad privada (_comments) de lista que contiene la lista de comentarios

  List<String> get comments => _comments;

  void addComment(String comment) {
    _comments.add(comment);
    //agrega el comentario al final de la lista _comments con .add
    notifyListeners();
    //función que llama a notificar a todos los widgets que se realiza un cambio.
  }

  void editComment(int index, String updatedComment) {
    if (index >= 0 && index < _comments.length) {
      //asegura que se acceda al índice de la lista correcto;
      //index >=0 verifica que no sea negativo,
      //< _comments.leght que esté dentro del rángo de índice de la lista.
      _comments[index] = updatedComment;
      //updateComment reemplaza _comments en su índice de lista.
      notifyListeners();
    }
  }

  void deleteComment(int index) {
    if (index >= 0 && index < _comments.length) {
      _comments.removeAt(index);
      //método que elimina el comentario en el índice de la lista.
      notifyListeners();
    }
  }
}
