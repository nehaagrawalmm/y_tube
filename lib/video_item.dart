import 'package:flutter/material.dart';

import 'list_item.dart';


class VideoItem implements ListItem {
  late final String sender;
  late final String body;

  VideoItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}