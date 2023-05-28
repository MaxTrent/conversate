import 'package:conversate/helpers.dart';
import 'package:conversate/screens/screens.dart';
import 'package:conversate/widgets/display_error_message.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'dart:core';
import '../models/models.dart';
import '../theme.dart';
import '../widgets/widget.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return MessageListCore(
        emptyBuilder: (context) =>
        const Center(
          child: Text(
            'So empty, \n Message someone',
            textAlign: TextAlign.center,
          ),
        ),
        errorBuilder: (context, error) =>
            DisplayErrorMessage(
              error: error,
            ),
        loadingBuilder: (context,) =>
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(

                ),
              ),
            ),
        messageListBuilder: (context, channels) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: _Stories()),
              SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return const Text('...');
              },
                  childCount: channels.length))
            ],
          );
        }
    );
  }
}


class _MessageTile extends StatelessWidget {
  const _MessageTile({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                ))),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Avatar.medium(url: messageData.profilePictureUrl),
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          messageData.senderName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              letterSpacing: 0.2,
                              wordSpacing: 1.5,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                          height: 20,
                          child: Text(
                            messageData.message,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12),
                          )),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      messageData.dateMessage.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 11,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textFaded,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textLight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.all(8),
      child: SizedBox(
        height: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 16.0),
              child: Text(
                'Stories',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: AppColors.textFaded),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final faker = Faker();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 60,
                        child: _StoryCard(
                            storyData: StoryData(
                              name: faker.person.name(),
                              url: Helpers.randomPictureUrl(),
                            )),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
