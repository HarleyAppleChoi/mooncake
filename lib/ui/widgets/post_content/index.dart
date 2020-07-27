import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:mooncake/entities/entities.dart';
import 'package:mooncake/ui/ui.dart';
import 'package:mooncake/ui/widgets/post_content/widgets/link_preview/index.dart';
import 'widgets/export.dart';

/// Contains the main content of a post. Such content is made of
/// - The header of the post, indicating the creator and the data
/// - The main message of the post
/// - The image(s) associated to the post
class PostContent extends StatelessWidget {
  final Post post;
  const PostContent({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> previewUris = _getUrisToPreview();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        PostItemHeader(key: PostsKeys.postItemHeader(post.id), post: post),
        const SizedBox(height: ThemeSpaces.smallGutter),
        if (post.message?.isNotEmpty == true) _messagePreview(),
        if (post.poll != null) PostPollContent(post: post),
        PostImagesPreviewer(
          key: PostsKeys.postItemImagePreviewer(post.id),
          post: post,
        ),
        if (previewUris != null) LinkPreview(urls: previewUris),
      ],
    );
  }

  Widget _messagePreview() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PostMessage(key: PostsKeys.postItemMessage(post.id), post: post),
        const SizedBox(height: ThemeSpaces.smallGutter),
      ],
    );
  }

  List<String> _getUrisToPreview() {
    // do not show link preview if there is a poll or image
    if (post.poll != null || post.images.isNotEmpty) {
      return null;
    }

    List<String> wordList = post.message
        .replaceAll("\n", "  \n")
        .split(" ")
        .where((String x) => isURL(x))
        .toList();
    ;
    return wordList.isNotEmpty ? wordList : null;
  }
}
