
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/auth_user.dart';
import '../../../model/comment_model.dart';
import '../../../routes/app_routes.dart';
import '../../../user_auth/auth_checker.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/spacing_constants.dart';
import '../../../utils/resizer/fetch_pixels.dart';
import 'comment_tile.dart';

class CommentTreeWidget extends StatefulWidget {
  final Function(Comment) onCommentPosted;
  final String contentID;
  final String content;

  CommentTreeWidget({required this.onCommentPosted, required this.contentID, required this.content});

  @override
  _CommentTreeWidgetState createState() => _CommentTreeWidgetState();
}

class _CommentTreeWidgetState extends State<CommentTreeWidget> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FetchPixels(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelWidth(kPadding)),
          child: Text(
            'Comments',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelWidth(kPadding)),
          child: TextField(
            controller: _commentController,
            style: Theme.of(context).textTheme.titleSmall,
            decoration: InputDecoration(
              hintText: 'Write a comment...',
              hintStyle: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              String commentText = _commentController.text;
              if (commentText.isNotEmpty) {
                _postComment(commentText);
                _commentController.clear();
              }
            },
            child: Container(
              padding: EdgeInsets.all(kPadding/2),
              margin: EdgeInsets.all(kPadding/2),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                'Post Comment',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('comments/${widget.content}/${widget.contentID}')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            List<Comment> comments = snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return Comment(
                username: data['username'],
                text: data['text'],
                url: data['url'],
                replies: (data['replies'] as List<dynamic>?)?.map((reply) {
                return Comment(
                  username: reply['username'],
                  text: reply['text'],
                  url: reply['url'],
                );
              }).toList() ?? [],

              );
            }).toList();

            return Column(
              children: [
                for (Comment comment in comments)
                  buildCommentTile(comment, context),
              ],
            );
          },
        ),
      ],
    );

  }

  Future<void> _postComment(String text) async {
    // Get a reference to the Firestore collection
    DateTime curr = DateTime.now();
    String now = curr.toIso8601String();
    print('comments/${widget.content}/${widget.contentID}/$now');
    CollectionReference comments = FirebaseFirestore.instance.collection('comments/${widget.content}/${widget.contentID}');

    String username = 'NameLess Wonder';
    String photo = 'NameLess Wonder';
    // Add the comment to Firestore
    AuthUser authUser = Provider.of<AuthUser>(context, listen: false);
    if(getCurrentUser()!=null){
      username = authUser.username;
      photo = authUser.photoUrl;

      print(comments.get());
      Comment newComment = Comment(username: username, text: text, url: photo);
      await comments.add({
        'username': username,
        'text': newComment.text,
        'url': photo,
      });

      widget.onCommentPosted(newComment);
    }
    else{
      Constant.sendToNext(context, Routes.signupRoute);
    }
  }
}