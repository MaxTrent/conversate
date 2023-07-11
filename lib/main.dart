import 'package:conversate/app.dart';
import 'package:conversate/screens/screens.dart';
import 'package:conversate/theme.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() {
  final client = StreamChatClient((streamKey));
  runApp(MyApp(
    client: client, appTheme: AppTheme(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.client,
    required this.appTheme,
  });

  final StreamChatClient client;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.dark,
      title: 'Conversate',
      builder: (context, child) {
        return StreamChatCore(
            client: client,
            child: ChannelsBloc(child: UsersBloc(child: child!)));
      },
      home: const SelectUserScreen(),
    );
  }
}
