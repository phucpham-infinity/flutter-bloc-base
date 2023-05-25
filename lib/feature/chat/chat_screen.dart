import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pine_app/core/theme/app_theme.dart';
import 'package:pine_app/core/theme/icons/icons.dart';
import 'package:pine_app/core/theme/size.dart';
import 'package:pine_app/core/theme/text_style.dart';
import 'package:pine_app/feature/widget/container/spacing_box.dart';
import 'package:pine_app/feature/widget/date_time/date_time.dart';
import 'package:pine_app/feature/widget/popup/feature_under_development.dart';
import 'package:pine_app/feature/widget/scaffold/base_gradient_scaffold.dart';
import 'package:pine_app/feature/widget/textfield/app_round_textfield.dart';
import '../../generated/l10n.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatController = TextEditingController();
  final ImagePicker picker = ImagePicker();
// Pick an image.
// final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  final List<Item> _listChat = [
    Item(
        text: 'Hello',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960',
        timestamp: '1683527509',
        isMe: true),
    Item(
        text: 'Hi, how are you?',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960',
        timestamp: '1683527509',
        isMe: false),
    Item(
        text: 'I\'m fine thank you, and you?',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960',
        timestamp: '1683527509',
        isMe: true),
    Item(
        text: 'ssss',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960',
        timestamp: '1683527509',
        isMe: false),
    Item(
        text: 'I\'m fine thank you, and you?',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960',
        timestamp: '1683527509',
        isMe: true),
    Item(
        text: 'ssss',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960',
        timestamp: '1683527509',
        isMe: false),
    Item(
        text: 'I\'m fine thank you, and you?',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960',
        timestamp: '1683527509',
        isMe: true),
    Item(
        text: 'ssss',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960',
        timestamp: '1683527509',
        isMe: false),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseGradientScaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sz.i.s17)
                  .copyWith(bottom: Sz.i.s60),
              child: _buildListChat(),
            ),
            _buildTextField(context)
          ],
        ),
      ),
    );
  }

  Widget _buildTextQuestion() {
    return Center(
      child: Text(
        S.current.askAnyQuestionBelow,
        style: ptBodyLargeThin(context).copyWith(
          fontSize: Sz.i.s17,
          height: 1.4118,
          color: getColor(context).white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildListChat() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: _listChat.length,
      itemBuilder: (context, index) {
        final Item item = _listChat[index];
        if (index == _listChat.length - 1) {
          return Padding(
            padding: EdgeInsets.only(bottom: Sz.i.s20),
            child: _buildItem(context, item: item),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(bottom: Sz.i.s24),
            child: _buildItem(context, item: item),
          );
        }
      },
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 8.0,
              sigmaY: 8.0,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sz.i.s24,
                vertical: Sz.i.s16,
              ).copyWith(bottom: Sz.i.s10),
              child: Container(
                height: Sz.i.s48,
                color: getColor(context).textActive.withOpacity(0.2),
                child: AppRoundTextField(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Sz.i.s26,
                    vertical: Sz.i.s10,
                  ),
                  borderRadius: BorderRadius.circular(Sz.i.s20),
                  controller: _chatController,
                  keyboardType: TextInputType.text,
                  suffixIcon: SizedBox(
                    width: Sz.i.s90,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showFeatureUnderDevelopment(context);
                          },
                          child: SvgPicture.asset(
                            AppIcons.mediaImage,
                            width: Sz.i.s24,
                            height: Sz.i.s24,
                            colorFilter: ColorFilter.mode(
                                getColor(context).black, BlendMode.srcIn),
                          ),
                        ),
                        SpacingBox(w: Sz.i.s16),
                        GestureDetector(
                          onTap: () {
                            showFeatureUnderDevelopment(context);
                          },
                          child: SvgPicture.asset(
                            AppIcons.emotionHappy,
                            width: Sz.i.s24,
                            height: Sz.i.s24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                  validation: (value) {
                    return "";
                  },
                  enabled: true,
                  hintText: S.current.writeAReply,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, {required Item item}) {
    return Column(
      crossAxisAlignment:
          item.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!item.isMe)
              Row(
                children: [
                  CircleAvatar(
                    minRadius: Sz.i.s24,
                    backgroundImage: NetworkImage(item.image),
                  ),
                  const SpacingBox(w: 12),
                ],
              )
            else
              const Spacer(),
            Container(
              width: deviceWidth(context) * 0.71,
              decoration: BoxDecoration(
                color: item.isMe
                    ? const Color(0xff8AB3A9)
                    : getColor(context).white,
                borderRadius: item.isMe
                    ? BorderRadius.circular(Sz.i.s20).copyWith(
                        bottomRight: const Radius.circular(0),
                      )
                    : BorderRadius.circular(Sz.i.s20).copyWith(
                        bottomLeft: const Radius.circular(0),
                      ),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: Sz.i.s20, vertical: Sz.i.s19),
              child: Text(
                item.text,
                style: ptBodyLargeThin(context).copyWith(
                    fontSize: Sz.i.s17,
                    height: 1.4118,
                    color: item.isMe
                        ? getColor(context).white
                        : getColor(context).black),
              ),
            ),
            if (!item.isMe) const Spacer(),
          ],
        ),
        const SpacingBox(h: 10),
        Padding(
          padding: EdgeInsets.only(left: Sz.i.s60),
          child: Text(
            timestampToTimeString(int.tryParse(item.timestamp)),
            style: pt12Poppins(context),
          ),
        )
      ],
    );
  }
}

class Item {
  final String text;
  final String image;
  final String timestamp;
  final bool isMe;

  Item(
      {required this.text,
      required this.image,
      required this.timestamp,
      this.isMe = false});
}
