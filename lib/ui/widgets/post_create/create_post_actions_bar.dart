import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mooncake/ui/ui.dart';

/// Represents the bar containing the actions that can be taken from
/// the post editor.
class PostCreateActions extends StatelessWidget {
  final double height;

  const PostCreateActions({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostInputBloc, PostInputState>(
      builder: (context, state) {
        return Container(
          height: height,
          color: Theme.of(context).scaffoldBackgroundColor,
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: Colors.transparent,
            child: Wrap(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      tooltip: PostsLocalizations.of(context).galleryTip,
                      icon: Icon(MooncakeIcons.picture),
                      onPressed: () => _pickImage(context, ImageSource.gallery),
                    ),
                    IconButton(
                      tooltip: PostsLocalizations.of(context).cameraTip,
                      icon: Icon(MooncakeIcons.camera),
                      onPressed: () => _pickImage(context, ImageSource.camera),
                    ),
                    IconButton(
                      tooltip: state.allowsComments
                          ? PostsLocalizations.of(context)
                              .createPostDisableCommentsButtonHint
                          : PostsLocalizations.of(context)
                              .createPostEnableCommentsButtonHint,
                      icon: Icon(state.allowsComments
                          ? MooncakeIcons.comment
                          : MooncakeIcons.comment),
                      onPressed: () => _toggleComments(context),
                    ),
                    IconButton(
                      tooltip: PostsLocalizations.of(context)
                          .createPostCreatePollButtonHint,
                      icon: Icon(MooncakeIcons.poll),
                      onPressed: () => _createPoll(context),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _pickImage(BuildContext context, ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      BlocProvider.of<PostInputBloc>(context).add(ImageAdded(image));
    }
  }

  void _toggleComments(BuildContext context) {
    BlocProvider.of<PostInputBloc>(context).add(ToggleAllowsComments());
  }

  void _createPoll(BuildContext context) {
    BlocProvider.of<PostInputBloc>(context).add(CreatePoll());
  }
}
