import 'package:flutter/material.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';

class Programmer extends StatelessWidget {
  const Programmer({super.key});

  Widget imageProg() {
    return Positioned(
      // top: 20,
      right: 10,
      child: Image.asset(AppConstants.DATADOTS,
          height: 260,
          color: Colors.white.withOpacity(0.5),
          colorBlendMode: BlendMode.modulate),
    );
  }

  Widget logoProg() {
    return Positioned(
      top: 60,
      left: 20,
      child: Image.asset(
        AppConstants.LOGOPROG,
        height: 90,
      ),
    );
  }

  Widget firstTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(
        'Enhance the Future Worldd!!!',
        style: TextStyle(
          fontSize: 16,
          color: kBlack,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget dSDesc2() {
    return const Positioned(
      top: 60,
      left: 20,
      child: Text(
        'My Rewards! adasdadadadassaf asfad ddgdhd dgfgfd gszgyt ttt ggff gsgsgsgsg dffsfdsfsfs dfgggggsg gsgsgsg  ssdsds sd adafafa faafa sdafa daafaaf dadfa fafafafa af fafafdasdada adad asdadf fafa fdfsfsf  hs sggs gsgsgsgsgsgsgndfafafafafafaff,fzfzzffz fss sd dfdfdfdfdfdsfsfs sf s sfsfsfs ssdsddsff sdfsdsfsfsfsfs sfsfsf sfsfssfsfffffffffffff sdfsdsds fsfsf sfsfsf sdss ',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 9,
        style: TextStyle(
          fontSize: 15,
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget dSDesc3() {
    return const Expanded(
      child: Text(
        'My Rewards! adasdadadadassaf asfad ddgdhd dgfgfd gszgyt ttt ggff gsgsgsgsg dffsfdsfsfs dfgggggsg gsgsgsg  ssdsds sd adafafa faafa sdafa daafaaf dadfa fafafafa af fafafdasdada adad asdadf fafa fdfsfsf  hs sggs gsgsgsgsgsgsgndfafafafafafaff,fzfzzffz fss sd dfdfdfdfdfdsfsfs sf s sfsfsfs ssdsddsff sdfsdsfsfsfsfs sfsfsf sfsfssfsfffffffffffff sdfsdsds fsfsf sfsfsf sdss ',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 9,
        style: TextStyle(
          fontSize: 15,
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget dataScienceImage() {
    return Expanded(
      child: Expanded(
        child: Image.asset(
          AppConstants.PROGRAMMERIMG,
          height: 200,
        ),
      ),
    );
  }

  Widget simpleDesc() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(
        'Stay Skillful, Stay PreparEd',
        style: TextStyle(
          fontSize: 14,
          color: kBlack,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget submitButton() {
    return Container(
      height: 55,
      // width: 20,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: kPrimaryColor,
          shadowColor: Colors.greenAccent,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          minimumSize: const Size(30, 20),
        ),
        onPressed: () {},
        // onPressed: validateAndSave,
        child: const Center(
          child: Text(
            'Register for Demo',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: kWhite,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            logoProg(),
            firstTitle(),
            const SizedBox(
              height: 10,
            ),
            dSDesc2(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                dSDesc3(),
                dataScienceImage(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            simpleDesc(),
            submitButton(),
          ],
        ),
      ),
    );
  }
}
