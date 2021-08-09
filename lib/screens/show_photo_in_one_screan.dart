
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ShowPhotoInOneScrean extends StatelessWidget {

  final image;
  ShowPhotoInOneScrean(this.image);
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(image),
      //CachedNetworkImageProvider
    );
  }
}
