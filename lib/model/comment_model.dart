class Comment {
  String username;
  String text;
  String url;
  List<Comment> replies;

  Comment({
    required this.username,
    required this.text,
    required this.url,
    this.replies = const [], // Initialize with an empty list
  });
}
