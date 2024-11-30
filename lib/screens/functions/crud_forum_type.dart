import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'forum_provider.dart';

class CrudForumType extends StatefulWidget {
  @override
  _CrudForumTypeState createState() => _CrudForumTypeState();
}

class _CrudForumTypeState extends State<CrudForumType> {
  TextEditingController _controller = TextEditingController();
  int? editingIndex;

  void addOrEditComment(BuildContext context) {
    if (_controller.text.isEmpty) return;

    final forumProvider = Provider.of<ForumProvider>(context, listen: false);

    if (editingIndex == null) {
      forumProvider.addComment(_controller.text);
    } else {
      forumProvider.editComment(editingIndex!, _controller.text);
      editingIndex = null;
    }
    _controller.clear();
  }

  void editComment(BuildContext context, int index) {
    setState(() {
      editingIndex = index;
      _controller.text =
          Provider.of<ForumProvider>(context, listen: false).comments[index];
    });
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
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: editingIndex == null
                    ? 'Write a type!'
                    : 'Editing right now...',
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () => addOrEditComment(context),
            icon: Icon(Icons.arrow_forward),
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
                'No hay comentarios aún.',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: forumProvider.comments.length,
              itemBuilder: (context, index) =>
                  buildCommentCard(forumProvider, context, index),
            ),
    );
  }

  Widget buildCommentCard(
      ForumProvider forumProvider, BuildContext context, int index) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage:
              AssetImage('assets/images/chs/neko_arc/neko_glass.jpg'),
          radius: 20,
        ),
        title: const Text(
          "TypeMoon",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          forumProvider.comments[index],
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
