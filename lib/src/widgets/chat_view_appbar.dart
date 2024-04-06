/*
 * Copyright (c) 2022 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/typedefs.dart';

class ChatViewAppBar extends StatelessWidget {
  const ChatViewAppBar({
    Key? key,
    required this.chatTitle,
    this.backGroundColor,
    this.userStatus,
    this.profilePicture,
    this.chatTitleTextStyle,
    this.userStatusTextStyle,
    this.backArrowColor,
    this.actions,
    this.elevation,
    this.onBackPress,
    this.padding,
    this.leading,
    this.showLeading = true,
  }) : super(key: key);

  /// Allow user to change colour of appbar.
  final Color? backGroundColor;

  /// Allow user to change title of appbar.
  final String chatTitle;

  /// Allow user to change whether user is available or offline.
  final String? userStatus;

  /// Allow user to change profile picture in appbar.
  final String? profilePicture;

  /// Allow user to change text style of chat title.
  final TextStyle? chatTitleTextStyle;

  /// Allow user to change text style of user status.
  final TextStyle? userStatusTextStyle;

  /// Allow user to change back arrow colour.
  final Color? backArrowColor;

  /// Allow user to add actions widget in right side of appbar.
  final List<Widget>? actions;

  /// Allow user to change elevation of appbar.
  final double? elevation;

  /// Provides callback when user tap on back arrow.
  final VoidCallBack? onBackPress;

  /// Allow user to change padding in appbar.
  final EdgeInsets? padding;

  /// Allow user to change leading icon of appbar.
  final Widget? leading;

  /// Allow user to turn on/off leading icon.
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: elevation ?? 1,
      child: Container(
        padding: padding ??
            EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: 4,
            ),
        color: Colors.transparent,
        child: Row(
          children: [
            if (showLeading)
              leading ??
                  CupertinoButton(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 16, right: 8),
                    child: Icon(
                      CupertinoIcons.back,
                      color: Color(0xFFBDC3C7),
                      // size: 30.0
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
            Expanded(
              child: Row(
                children: [
                  if (profilePicture != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(5, 7),
                            ),
                          ],
                        ),
                        child: ClipOval(
                            child: CachedNetworkImage(
                          imageUrl: profilePicture!,
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chatTitle,
                        style: chatTitleTextStyle ??
                            const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.25,
                            ),
                      ),
                      if (userStatus != null)
                        Text(
                          userStatus!,
                          style: userStatusTextStyle,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            // if (actions != null) ...actions!,
          ],
        ),
      ),
    );
  }
}
