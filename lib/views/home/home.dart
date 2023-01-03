import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/home_provider.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/shimmers/home_shimmer.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/views/home/navig.dart';
import 'package:prepared_academy/views/home/posts.dart';
import 'package:prepared_academy/views/home/suggested_video.dart';
import 'package:prepared_academy/views/home/story.dart';
import 'package:prepared_academy/widgets/icon_button.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => context.read<HomeProvider>().init());
  }

  Widget _logoWithText() => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Image.asset(AppConstants.LOGOWITHTEXT_IMAGE),
      );

  Widget _notificationButton() => CustomIconButton(
        onTap: () => OneContext().pushNamed(AppRoutes.NOTIFICATIONS),
        iconImage: AppConstants.NOTIFICATION_ICON,
      );

  Widget _bookmarkButton() => CustomIconButton(
        onTap: () {},
        iconImage: AppConstants.BOOKMARK_ICON,
      );

  Widget _menuButton() => Builder(
        builder: (context) => CustomIconButton(
          onTap: () => navigScaffoldKey.currentState!.openEndDrawer(),
          iconImage: AppConstants.MENU_ICON,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: _logoWithText(),
        actions: [
          _bookmarkButton(),
          _notificationButton(),
          _menuButton(),
        ],
      ),
      body: context.watch<HomeProvider>().isLoading
          ? const HomeShimmer()
          : RefreshIndicator(
              onRefresh: context.read<HomeProvider>().init,
              child: SingleChildScrollView(
                child: Column(
                  children: const [Story(), SuggestedVideo(), Posts()],
                ),
              ),
            ),
    );
  }
}
