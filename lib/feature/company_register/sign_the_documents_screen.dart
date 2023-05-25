import 'package:flutter/material.dart';
import 'package:pine_app/core/model/card_detail.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/util/navigation_utils.dart';
import 'package:pine_app/feature/company_register/widget/list_document.dart';
import 'package:pine_app/feature/open_account/choose_a_rate_screen.dart';
import 'package:pine_app/feature/widget/button/back_button.dart';
import 'package:pine_app/feature/widget/column/title_with_sub.dart';
import 'package:pine_app/feature/widget/container/build_card_detail.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/generated/l10n.dart';

class SignTheDocumentsScreen extends StatefulWidget {
  const SignTheDocumentsScreen({super.key});

  @override
  State<SignTheDocumentsScreen> createState() => _SignTheDocumentsScreenState();
}

class _SignTheDocumentsScreenState extends State<SignTheDocumentsScreen> {
  List<String> listFileDownload = [
    'https://elearning.ntu.edu.vn/pluginfile.php/760409/mod_resource/content/0/De%20cuong%20CTHP_PTUD%20Web-62.CNTT.pdf',
    'https://elearning.ntu.edu.vn/pluginfile.php/760404/mod_resource/content/0/Chu%20de%201%20-%20Tong%20Quan.pdf',
  ];

  final List<CardDetail> _cardDetails = [
    CardDetail(
        title: S.current.meetingWithACourier,
        description: S.current.showTheCourierTheCuarcode,
        icon: AppIcons.calendarCheck,
        nameCard: 'March 23\n13:00 – 17:00',
        descriptionCard: S.current.weWillSendACourierToYouAdress),
    CardDetail(
        title: S.current.willTakeTheDocumentstoTheEmbassy,
        description: S.current.weWillLetYouKnowWhenHeDeliversTheDocuments,
        icon: AppIcons.motorBike,
        nameCard: 'To March 25',
        descriptionCard: S.current.theCourierIsAlready),
    CardDetail(
      title: S.current.verificationStatus,
      description: S.current.documentsAccepted,
      icon: AppIcons.wavyCheck,
      nameCard: 'To March 25',
      descriptionCard: S.current.theDocumentsHaveBeenApproved,
    ),
    CardDetail(
        title: S.current.deliveryDocuments,
        description: S.current.showTheCourierTheCuarcode,
        icon: AppIcons.calendarCheck,
        nameCard: 'March 23\n13:00 – 17:00',
        descriptionCard: S.current.weWillSendACourierToYouAdress),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildBackButton(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildTitleWithSub(
                          title: S.current.signTheDocuments,
                          sub: S.current.ourRepresentativeWillDeliver),
                      const SpacingBox(h: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.current.documents,
                            style: ptBodyLargeBold(context)
                                .copyWith(fontSize: Sz.i.s20),
                          ),
                          const SpacingBox(h: 8),
                          Text(
                            S.current.reviewTheDocuments,
                            style: ptBodyLargeThin(context).copyWith(
                                fontSize: Sz.i.s14,
                                height: 1.7143,
                                color: getColor(context).white),
                          ),
                          const SpacingBox(h: 24),
                          ListDocument(
                            listFileDownload: listFileDownload,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.92,
              minChildSize: 0.3,
              builder: (_, controller) => BuildCardDetail(
                onTap: () {
                  navigateTo(ChooseARateScreen());
                },
                controller: controller,
                title: 'March 23\n13:00 – 17:00',
                subtitle: S.current.weWillSendACourierToYouAdress,
                icon: AppIcons.calendarCheck,
                listCard: _cardDetails,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
