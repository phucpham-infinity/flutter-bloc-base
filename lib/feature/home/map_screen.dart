import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/core/theme/txts/txts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/images/images.dart';
import '../../../core/theme/size.dart';
import '../../../generated/l10n.dart';
import '../widget/button/app_expand_button.dart';
import '../widget/column/column_builder.dart';
import '../widget/container/spacing_box.dart';
import '../widget/popup/show_sheet.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGoogle =
      CameraPosition(target: LatLng(10.227213, 106.062133), zoom: 16);

  Uint8List? marketimages;

  final List<Marker> _markers = <Marker>[];

  final List<LatLng> _latLen = <LatLng>[
    const LatLng(10.226727, 106.060502),
    const LatLng(10.227044, 106.059955),
    const LatLng(10.228934, 106.061532),
  ];

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  late String _mapStyle;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      rootBundle.loadString(Txts.mapStyle).then((string) {
        _mapStyle = string;
      });
    });
    loadData();
  }

  loadData() async {
    _markers.add(Marker(
      markerId: const MarkerId('default'),
      icon: BitmapDescriptor.fromBytes(await getImages(Images.icCurrent, 100)),
      position: const LatLng(10.227213, 106.062133),
      onTap: _showInfo,
    ));
    for (int i = 0; i < _latLen.length; i++) {
      final Uint8List markIcons = await getImages(Images.icMarker, 100);
      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        icon: BitmapDescriptor.fromBytes(markIcons),
        position: _latLen[i],
        onTap: _showInfo,
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              controller.setMapStyle(_mapStyle);
            },
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            compassEnabled: true,
            mapToolbarEnabled: true,
            initialCameraPosition: _kGoogle,
            markers: Set<Marker>.of(_markers),
          ),
          SafeArea(
            child: Container(
              height: 56,
              margin: EdgeInsets.symmetric(horizontal: Sz.i.s32)
                  .copyWith(top: Sz.i.s30),
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(AppIcons.icBackMap)),
                  Container(height: Sz.i.s24, width: 2, color: Colors.white30),
                  Text(S.current.findATMs,
                      style: ptButton(context).copyWith(
                          fontSize: Sz.i.s16, color: getColor(context).white)),
                  Container(height: Sz.i.s24, width: 2, color: Colors.white30),
                  GestureDetector(
                      onTap: _showFilter,
                      child: SvgPicture.asset(AppIcons.icFilter)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 30,
            child: SvgPicture.asset(AppIcons.icGPS),
          )
        ],
      ),
    );
  }

  List<String> get filter => [
        S.current.within(1),
        S.current.within(3),
        S.current.within(5),
        S.current.all
      ];
  void _showInfo() {
    showSheet(
      context,
      isBlurBarrier: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpacingBox(h: 40),
            Text(
              'ATM № 123  ',
              style: ptBodyLargeBold(context)
                  .copyWith(fontSize: Sz.i.s28, color: getColor(context).black),
            ),
            const SpacingBox(h: 16),
            Text(
              'Open until 6 p.m.',
              style: ptBodyLargeThin(context)
                  .copyWith(fontSize: Sz.i.s17, color: getColor(context).black),
            ),
            const SpacingBox(h: 32),
            Row(
              children: [
                _buildButton(
                  text: 'AED',
                  selected: true,
                  onTap: () {},
                  color: const Color(0xffF0ECEC),
                ),
                const SpacingBox(w: 9),
                _buildButton(
                  text: 'EUR',
                  selected: false,
                  onTap: () {},
                  color: const Color(0xffF0ECEC),
                ),
                const SpacingBox(w: 9),
                _buildButton(
                  text: 'USD',
                  selected: false,
                  onTap: () {},
                  color: const Color(0xffF0ECEC),
                ),
              ],
            ),
            const SpacingBox(h: 33),
            Text(
              S.current.ATMInTheBranch('Al Hilal Bank'),
              style: ptBodyLargeThin(context)
                  .copyWith(fontSize: Sz.i.s17, color: getColor(context).black),
            ),
            const SpacingBox(h: 24),
            AppExpandButton.primary(
              forceUppercase: false,
              onTap: () async {
                navigateToGoogleMap(19.0759837, 72.8776559);
              },
              label: S.current.createARoute,
              enabled: true,
            ),
            const SpacingBox(h: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      {required String text,
      required VoidCallback onTap,
      required Color color,
      required bool selected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Sz.i.s8, horizontal: Sz.i.s7),
        decoration: BoxDecoration(
            color: selected ? color : color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Row(
            children: [
              Text(
                text,
                style: ptBodyLargeBold(context).copyWith(
                    fontSize: Sz.i.s14,
                    color: getColor(context)
                        .primaryNormal
                        .withOpacity(selected ? 1 : 0.2)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<int> selected = [];
  void _showFilter() {
    showSheet(
      context,
      isBlurGradient: true,
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpacingBox(h: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                child: Text(
                  S.current.distance,
                  style: ptBodyLargeBold(context).copyWith(
                      fontSize: Sz.i.s28, color: getColor(context).black),
                ),
              ),
              const SpacingBox(h: 30),
              ColumnBuilder(
                data: filter,
                itemBuilder: (index) => ListTile(
                  onTap: () {
                    if (selected.contains(index)) {
                      selected.remove(index);
                      setState(() {});
                    } else {
                      selected.add(index);
                      setState(() {});
                    }
                  },
                  contentPadding: EdgeInsets.symmetric(horizontal: Sz.i.s24),
                  title: Text(filter[index],
                      style: ptBodyLargeThin(context)
                          .copyWith(fontSize: Sz.i.s17)),
                  trailing: SvgPicture.asset(selected.contains(index)
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

  navigateToGoogleMap(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
