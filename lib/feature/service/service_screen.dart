import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/mockups/mockup_image.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/app.dart';
import 'package:pine_app/feature/widget/button/round_button.dart';
import 'package:pine_app/feature/widget/column/column_builder.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';

import '../../core/theme/size.dart';
import '../../generated/l10n.dart';
import '../widget/column/title_with_sub.dart';
import '../widget/popup/show_sheet.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpacingBox(h: 30),
              BuildTitleWithSub(
                title: S.current.addOnServices,
                sub: S.current.servicesToHelpYouNanageYourCompany,
              ),
              const SpacingBox(h: 34),
              Row(
                children: [
                  _buildItem(
                    icon: AppIcons.icService,
                    text: S.current.myServices,
                  ),
                  const SpacingBox(w: 16),
                  _buildItem(
                    icon: AppIcons.icCounterparties,
                    text: S.current.myPartners,
                  ),
                ],
              ),
              const SpacingBox(h: 48),
              Row(
                children: [
                  Text(S.current.all,
                      style: ptButton(context).copyWith(
                          fontSize: Sz.i.s20, color: getColor(context).white)),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.search),
                ],
              ),
              const SpacingBox(h: 32),
              Row(
                children: [
                  RoundButton(
                    text: S.current.filter,
                    selected: false,
                    onTap: _showFilter,
                    borderRadius: 20,
                    textStyle:
                        ptBodyLargeThin(context).copyWith(fontSize: Sz.i.s14),
                  ),
                  const SpacingBox(w: 8),
                  RoundButton(
                    text: S.current.pineServices('10'),
                    selected: false,
                    onTap: () {},
                    textStyle:
                        ptBodyLargeThin(context).copyWith(fontSize: Sz.i.s14),
                    borderRadius: 20,
                  ),
                  const SpacingBox(w: 8),
                  RoundButton(
                    text: S.current.newFilter('10'),
                    selected: false,
                    onTap: () {},
                    borderRadius: 20,
                    textStyle:
                        ptBodyLargeThin(context).copyWith(fontSize: Sz.i.s14),
                  )
                ],
              ),
              const SpacingBox(h: 32),
              ColumnBuilder(
                data: services,
                itemBuilder: (index) =>
                    _buildService(serviceModel: services[index]),
              ),
              const SpacingBox(h: 100),
            ],
          ),
        ),
      ),
    );
  }

  List<ServiceModel> get services => [
        ServiceModel(
            title: 'Accounting',
            description: 'Pine Bank',
            image: MockupImage.mockup1),
        ServiceModel(
            title: 'Drinking Water Delivery',
            description: 'SuperWater LLC',
            image: MockupImage.mockup2),
        ServiceModel(title: 'CRM', description: '', image: MockupImage.mockup3),
      ];

  Widget _buildService({required ServiceModel serviceModel}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: Sz.i.s196,
        width: context.width,
        child: Stack(
          children: [
            Image.asset(serviceModel.image,
                height: Sz.i.s196, width: context.width, fit: BoxFit.cover),
            Positioned(
              bottom: 0,
              width: context.width,
              height: Sz.i.s90,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: const Color(0xff1D484E).withOpacity(0.2),
                    padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SpacingBox(h: 16),
                        Text(serviceModel.title,
                            style: ptButton(context).copyWith(
                                fontSize: Sz.i.s16,
                                color: getColor(context).white)),
                        const SpacingBox(h: 20),
                        Text(serviceModel.description,
                            style: ptBodyLargeThin(context).copyWith(
                                fontSize: Sz.i.s12,
                                color: getColor(context).white))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> get companyManagement => [
        'Financial Management',
        'Payroll & HR Solutions',
        'Risk Management & Compliance',
        'Staffing & Outsourcing',
        'Payment Processing',
      ];
  List<String> get officeManagement => [
        'Facility Maintenance & Cleaning',
        'Office Management Solutions',
      ];
  List<int> selectedCompany = [];
  List<int> selectedOffice = [];
  void _showFilter() {
    showSheet(
      context,
      isBlurBarrier: true,
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpacingBox(h: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: Text(
                  S.current.filter,
                  style: ptBodyLargeBold(context).copyWith(
                      fontSize: Sz.i.s28, color: getColor(context).black),
                ),
              ),
              const SpacingBox(h: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: Text(
                  S.current.companyManagement,
                  style: ptBodyLargeThin(context).copyWith(
                      fontSize: Sz.i.s14, color: getColor(context).gray3),
                ),
              ),
              const SpacingBox(h: 16),
              ColumnBuilder(
                data: companyManagement,
                itemBuilder: (index) => ListTile(
                  onTap: () {
                    if (selectedCompany.contains(index)) {
                      selectedCompany.remove(index);
                      setState(() {});
                    } else {
                      selectedCompany.add(index);
                      setState(() {});
                    }
                  },
                  contentPadding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                  title: Text(companyManagement[index],
                      style: ptBodyLargeThin(context)
                          .copyWith(fontSize: Sz.i.s17)),
                  trailing: SvgPicture.asset(selectedCompany.contains(index)
                      ? AppIcons.checkboxOn
                      : AppIcons.checkboxOff),
                ),
              ),
              const SpacingBox(h: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: Text(
                  S.current.officeManagement,
                  style: ptBodyLargeThin(context).copyWith(
                      fontSize: Sz.i.s14, color: getColor(context).gray3),
                ),
              ),
              const SpacingBox(h: 16),
              ColumnBuilder(
                data: officeManagement,
                itemBuilder: (index) => ListTile(
                  onTap: () {
                    if (selectedOffice.contains(index)) {
                      selectedOffice.remove(index);
                      setState(() {});
                    } else {
                      selectedOffice.add(index);
                      setState(() {});
                    }
                  },
                  contentPadding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                  title: Text(officeManagement[index],
                      style: ptBodyLargeThin(context)
                          .copyWith(fontSize: Sz.i.s17)),
                  trailing: SvgPicture.asset(selectedOffice.contains(index)
                      ? AppIcons.checkboxOn
                      : AppIcons.checkboxOff),
                ),
              ),
              const SpacingBox(h: 20),
            ],
          );
        },
      ),
    );
  }

  Widget _buildItem({required String text, required String icon}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s16),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(Sz.i.s20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpacingBox(h: 14),
            SvgPicture.asset(icon),
            const SpacingBox(h: 20),
            Text(text,
                style: ptBodyLargeThin(context).copyWith(fontSize: Sz.i.s17)),
            const SpacingBox(h: 4),
            Text(
              S.current.connected('2'),
              style: ptBodyLargeThin(context)
                  .copyWith(fontSize: Sz.i.s12, color: getColor(context).gray1),
            ),
            const SpacingBox(h: 28),
          ],
        ),
      ),
    );
  }
}

class ServiceModel {
  final String title;
  final String description;
  final String image;
  ServiceModel({
    required this.title,
    required this.description,
    required this.image,
  });
}
