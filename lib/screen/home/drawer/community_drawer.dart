import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/controllers/auth_controller.dart';
import 'package:reddit_clone/controllers/community_controller.dart';
import 'package:reddit_clone/screen/community_screen.dart';
import 'package:reddit_clone/widgets/error.dart';
import 'package:reddit_clone/widgets/loader.dart';
import 'package:routemaster/routemaster.dart';

class CommunityDrawer extends ConsumerWidget {
  const CommunityDrawer({super.key});

  void toCreateCommunity(BuildContext context) {
    Routemaster.of(context).pop();
    Routemaster.of(context).push(CreateCommunityScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = MediaQuery.of(context).size;
    return Drawer(
      width: deviceSize.width * 0.75,
      child: SafeArea(
          child: Column(
        children: [
          ListTile(
            title: const Text('Create a community'),
            leading: const Icon(Icons.add),
            onTap: () => toCreateCommunity(context),
          ),
          ref.watch(userCommunitiesProvider).when(
                data: (communities) {
                  return ListView.builder(
                    itemCount: communities.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(communities[index].avatar),
                        ),
                        title: Text(communities[index].name),
                      );
                    },
                  );
                },
                error: (error, stackTrace) => ErrorText(text: error.toString()),
                loading: () => const Loader(),
              )
        ],
      )),
    );
  }
}
