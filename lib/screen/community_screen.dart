import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/theme.dart/pallete.dart';
import 'package:reddit_clone/widgets/loader.dart';

import '../controllers/community_controller.dart';

class CreateCommunityScreen extends ConsumerStatefulWidget {
  const CreateCommunityScreen({super.key});

  static const routeName = '/create-community';

  @override
  ConsumerState<CreateCommunityScreen> createState() =>
      _CreateCommunityScreenConsumerState();
}

class _CreateCommunityScreenConsumerState
    extends ConsumerState<CreateCommunityScreen> {
  final TextEditingController communityNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    communityNameController.dispose();
  }

  void createCommunity() {
    ref
        .read(communityControllerProvider.notifier)
        .createCommunity(communityNameController.text.trim(), context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(communityControllerProvider);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a community'),
      ),
      body: isLoading
          ? const Loader()
          : Padding(
              padding: EdgeInsets.all(deviceSize.height * 0.02),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Community name'),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.02,
                  ),
                  TextField(
                    controller: communityNameController,
                    decoration: const InputDecoration(
                      hintText: 'r/Community_name',
                      filled: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(18),
                    ),
                    maxLength: 21,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () => createCommunity(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Pallete.blueColor,
                      minimumSize: Size(
                        double.infinity,
                        deviceSize.height * 0.062,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(deviceSize.aspectRatio * 100),
                      ),
                    ),
                    child: const Text('Create community'),
                  ),
                ],
              ),
            ),
    );
  }
}
