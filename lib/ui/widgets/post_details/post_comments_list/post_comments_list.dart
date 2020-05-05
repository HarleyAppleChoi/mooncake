import 'package:flutter/material.dart';
import 'package:mooncake/entities/posts/post.dart';
import 'package:mooncake/ui/ui.dart';

import 'post_comment_item.dart';

/// Represents the list of comments that are associated to a specific post.
class PostCommentsList extends StatelessWidget {
  final List<Post> comments;

  const PostCommentsList({Key key, @required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return _emptyCommentsContainer(context);
    }

    final childCount = (comments.length * 2) - 1;
    return Container(
      padding: EdgeInsets.only(
        top: NestedScrollView.sliverOverlapAbsorberHandleFor(context)
            .layoutExtent,
      ),
      child: CustomScrollView(
        shrinkWrap: true,
        key: PageStorageKey<String>("comments"),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index.isEven) {
                  final comment = comments[index ~/ 2];
                  return _commentItem(comment);
                }

                return Container(
                  height: 0.5,
                  color: ThemeColors.textColorLight,
                );
              },
              childCount: childCount,
            ),
          )
        ],
      ),
    );
  }

  Container _emptyCommentsContainer(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/smile.png",
            width: 100,
          ),
          Text(
            PostsLocalizations.of(context).noCommentsYet,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _commentItem(Post comment) {
    return PostCommentItem(
      key: PostsKeys.postCommentItem(comment.id),
      comment: comment,
    );
  }
}