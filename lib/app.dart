import 'package:flutter/material.dart';
import 'package:logger/logger.dart' as log;
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'api/api_key.dart';

const streamKey = streamApiKey;
var logger = log.Logger();



extension StreamChatContext on BuildContext {
  // Fetches the current user image.
  String? get currentUserImage => currentUser!.image;

  // Fetches the current user.
  User? get currentUser => StreamChatCore.of(this).currentUser;
}