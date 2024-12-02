import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'forum_provider.dart';

class CrudForumType extends StatefulWidget {
  //gestiona el texto en el campo de entrada "TextField"
  const CrudForumType({super.key});

  @override
  CrudForumTypeState createState() => CrudForumTypeState();
}

class CrudForumTypeState extends State<CrudForumType> {
  final TextEditingController _controller = TextEditingController();
  //controlador de texto que gestiona datos de entrada tipo string
  //se declara como final para evitar cambios de valor pero sí puede actualizarse.
  //se inicializa un nuevo TextEditingController para gestionar el input de texto.
  int? editingIndex;
  //variable que almacena el índice del comentario q está siendo editado
  //se declara que puede ser nula pq si la variable es null no se está
  //editando nada.

  void addOrEditComment(BuildContext context) {
    if (_controller.text.isEmpty) return;
    //si _controller no tiene datos devuelve nada.

    final forumProvider = Provider.of<ForumProvider>(context, listen: false);
    //obtiene el provider de forumProvider desde el context
    //listen: false indica que no se hará escucha dentro de la UI

    if (editingIndex == null) {
      forumProvider.addComment(_controller.text);
      //se verifica si editingIndex es null, de ser así
      //agrega un nuevo comentario al ForumProvider desde el método
      //addComment con el parámetro _controller.text
    } else {
      forumProvider.editComment(editingIndex!, _controller.text);
      editingIndex = null;
      //si editingIndex =! null es porque se está editando un comentario
      //y entonces se llama al método editComment dentro de la clase ForumProvider
      //para actualizar el comentario de la lista. editingIndex! como parámetro
      //dice que NO está siendo nulo. _controller.text es el nuevo comentario.
    }
    _controller.clear();
    //limpia el contenido de la caja de texto cuando se edita o crea el comentario.
  }

  void editComment(BuildContext context, int index) {
    //editComent toma de parámetros el contexto y un índice. El contexto
    //es necesario para acceder al provider (que maneja la carga pantallas)
    setState(
      () {
        editingIndex = index;
        _controller.text =
            //_controller.text es el texteditincontroller asociado al TextField
            //donde el usuario introduce el input.
            Provider.of<ForumProvider>(context, listen: false).comments[index];
        //Provider accede al forum provider desde el árbol de widgets
        //recibe como parámetros el context y niega la escucha a ForumProvider.
        //Esto se hace para que no se reconstruya el widget si el
        //comentario cambia por temas de optimización.
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final forumProvider = Provider.of<ForumProvider>(context);

    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCommentInput(context),
          buildCommentList(forumProvider),
        ],
      ),
    );
  }

  Widget buildCommentInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                //decorar el textfield con inputdecoration dentro
                //del campo visual del texto (caja de texto) y muestra
                //por encima el texto del labelText.
                labelText: editingIndex == null
                    //si editingIndex es nulo se entra en addComment, si tiene
                    //un valor se entra en editingComment
                    ? 'Write a type!'
                    : 'Editing right now...',
                //(? :) son comparadores lógicos:
                //? valor_si_verdadero || : valor_si_falso
                //similares a True or False booleanos.
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          IconButton(
            onPressed: () => addOrEditComment(context),
            icon: const Icon(Icons.arrow_forward),
          )
        ],
      ),
    );
  }

  Widget buildCommentList(ForumProvider forumProvider) {
    return Expanded(
      child: forumProvider.comments.isEmpty
          ? const Center(
              child: Text(
                'There is nothing... but emptiness',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
            )
          : ListView.builder(
              itemCount: forumProvider.comments.length,
              //devuelve el número de comentarios en la lista comments de forumProvider
              itemBuilder: (context, index) =>
                  buildCommentCard(forumProvider, context, index),
            ),
    );
  }

  Widget buildCommentCard(
      ForumProvider forumProvider, BuildContext context, int index) {
    return Card(
      //con index accedemos al comentario correspondiente de la lista de forumProvider
      //devolviendo una card
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: ListTile(
        //ListTile representa los comentarios
        leading: const CircleAvatar(
          //se apila utilizando leading el CircleAvatar
          backgroundImage:
              AssetImage('assets/images/chs/neko_arc/neko_glass.jpg'),
          radius: 26,
        ),
        title: const Text(
          "TypeMoon",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          forumProvider.comments[index],
          //el subtítulo es otorgado por el comentario de forumProvider según
          //el índice de la lista.
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () => editComment(context, index),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: () => forumProvider.deleteComment(index),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
