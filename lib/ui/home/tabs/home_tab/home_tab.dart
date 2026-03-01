import 'package:flutter/material.dart';
import 'package:islami_c18_dokki/theme/colors.dart';
import 'package:islami_c18_dokki/theme/text_styles.dart';
import 'package:islami_c18_dokki/ui/home/tabs/home_tab/models/sura.dart';
import 'package:islami_c18_dokki/ui/home/tabs/home_tab/widgets/sura_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          "assets/images/quran_tab_bg.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.black.withAlpha(70), AppColors.black],
              end: AlignmentGeometry.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
        ),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/img_header.png",
                      width: width * 0.6,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.black.withAlpha(70),
                    prefixIcon: ImageIcon(
                      AssetImage("assets/images/ic_quran.png"),
                      color: AppColors.gold,
                    ),
                    hintText: "Sura Name",
                    hintStyle: TextStyles.labelLargeStyle(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1, color: AppColors.gold),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(width: 1, color: AppColors.gold),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("Suras", style: TextStyles.labelLargeStyle()),
              ),
            ),
            SliverList.separated(
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: SuraItem(sura: suraList[index]),
              ),
              separatorBuilder: (_, _) => Divider(
                thickness: 1,
                color: AppColors.white,
                indent: 40,
                endIndent: 40,
              ),
              itemCount: suraList.length,
            ),
          ],
        ),
      ],
    );
  }
}
