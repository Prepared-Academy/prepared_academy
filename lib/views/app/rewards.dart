import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';

class Rewards extends StatelessWidget {
  const Rewards({super.key});

  Widget prefixRewardTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Text(
        'Welcome to',
        style: TextStyle(
          fontSize: 20,
          color: kBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget rewardTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(
        'My Rewards!',
        style: TextStyle(
          fontSize: 28,
          color: kPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget imageReward() {
    return Center(
        child: Image.asset(
      AppConstants.REWARDSTAR,
      height: 260,
    ));
  }

  Widget rewardDesc1() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Text(
        'My Rewards! adasdadadadassaf asfad adafafa faafa',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: kPrimaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget rewardDesc2() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(
        'My Rewards! adasdadadadassaf asfad adafafa faafa sdafa daafaaf dadfa fafafafa af fafafdasdada adad asdadf fafa fdfsfsf  hs sggs gsgsgsgsgsgsg',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget rewardDesc3() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(
        'Check back later after sometime. Thankyou for keep waiting!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: kBlack,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Rewards",
          style: TextStyle(
              color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              prefixRewardTitle(),
              rewardTitle(),
              imageReward(),
              rewardDesc1(),
              rewardDesc2(),
              rewardDesc3()
            ],
          ),
        ),
      ),
    );
  }
}
