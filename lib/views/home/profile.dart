import 'package:flutter/material.dart';
import 'package:prepared_academy/components/change_image.dart';
import 'package:prepared_academy/providers/auth_provider.dart';
import 'package:prepared_academy/providers/profile_provider.dart';
import 'package:provider/provider.dart';
import '../../themes/color_theme.dart';
import '../../utils/app_constants.dart';
import '../../widgets/circle_image.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List options = [
    {"name": "My Reports", "icon": AppConstants.MYREPORTS},
    {"name": "About Us", "icon": AppConstants.ABOUTUS},
    {"name": "Privacy Policy", "icon": AppConstants.TERMS},
    {"name": "Password Reset", "icon": AppConstants.PASS_RESET},
    {"name": "Log Out", "icon": AppConstants.LOG_OUT},
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ProfileProvider>().getProfileDetails());
  }

  Widget userProfile() {
    return Consumer<ProfileProvider>(builder: (context, provider, __) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: CircularProfileAvatar(
                    "${AppConstants.BASE_URL}/upload/userProfile/${provider.profileModel.profileImage}", //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                    radius: 60,
                    isEdit: true,
                    animateFromOldImageOnUrlChange: true,
                    backgroundColor: Colors.white,
                    borderWidth: 6,
                    borderColor: kWhite,
                    elevation: 5.0,
                    cacheImage: true,
                    placeHolder: (context, url) =>
                        Image.asset(AppConstants.PLACEHOLDER_IMAGE),
                    errorWidget: (context, url, error) =>
                        Image.asset(AppConstants.PLACEHOLDER_IMAGE),

                    onTap: () {},
                    onEditTap: () {
                      changeImage(false);
                    },
                  ),
                ),
                studentNameEmail(),
              ],
            ),
          ),
          Positioned(
              top: 15,
              left: 10,
              child: ClipOval(
                child: Container(
                  color: kWhite.withOpacity(0.2),
                  height: 30.0, // height of the button
                  width: 30.0, // width of the button
                ),
              )),
          Positioned(
              top: 0,
              left: 50,
              child: ClipOval(
                child: Container(
                  color: kWhite.withOpacity(0.2),
                  height: 15.0, // height of the button
                  width: 15.0, // width of the button
                ),
              )),
          Positioned(
              bottom: 20,
              right: 30,
              child: ClipOval(
                child: Container(
                  color: kWhite.withOpacity(0.2),
                  height: 15.0, // height of the button
                  width: 15.0, // width of the button
                ),
              )),
          Positioned(
              top: 0,
              right: -10,
              child: ClipOval(
                child: Container(
                  color: kWhite.withOpacity(0.2),
                  height: 50.0, // height of the button
                  width: 50.0, // width of the button
                ),
              )),
        ],
      );
    });
  }

  Widget studentNameEmail() {
    return Flexible(
      child: Consumer<ProfileProvider>(builder: (context, provider, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.profileModel.schoolName ?? "",
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w800, color: kWhite),
            ),
            const SizedBox(height: 10),
            Text(
              provider.profileModel.name ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w800, color: kWhite),
            ),
            Text(
              provider.profileModel.email ?? "",
              style: const TextStyle(fontSize: 14, color: kWhite),
            ),
          ],
        );
      }),
    );
  }

  Widget statWidget(String count, String statName) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: kBlack),
        ),
        Text(
          statName,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: kgrey),
        ),
      ],
    );
  }

  Widget userStats() {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Consumer<ProfileProvider>(builder: (context, provider, __) {
          return provider.isLoading
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    statWidget(provider.profileModel.subjectsCount!.toString(),
                        "Subjects"),
                    statWidget(
                        provider.profileModel.totalCompletion!, "Completion"),
                    statWidget(
                        provider.profileModel.grade!.toString(), "Grade"),
                    statWidget(provider.profileModel.xp!.toString(), "XP"),
                  ],
                );
        }),
      ),
    );
  }

  Widget profileListings() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (context, index) => Card(
        elevation: 0,
        child: ListTile(
          dense: true,
          minLeadingWidth: 0,
          leading: Image.asset(
            options[index]["icon"],
            height: 25,
          ),
          title: Text(
            options[index]["name"],
          ),
          onTap: () {
            if (index == 4) {
              context.read<AuthProvider>().logout();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            title: const Text("Profile", style: TextStyle(color: kWhite)),
            foregroundColor: kWhite,
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
            ],
          ),
          SliverAppBar(
            expandedHeight: 150.0,
            snap: true,
            floating: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(background: userProfile()),
          ),
          SliverToBoxAdapter(child: userStats()),
          SliverToBoxAdapter(child: profileListings())
        ],
      ),
    );
  }
}
