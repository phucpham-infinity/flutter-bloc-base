import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final Widget child;
  final void Function(T?, int)? onChange;
  final List<DropdownItem<T>> items;
  final int currentIndex;
  final DropdownStyle dropdownStyle;

  /// dropdownButtonStyles passes styles to OutlineButton.styleFrom()
  final DropdownButtonStyle dropdownButtonStyle;

  /// dropdown button icon defaults to caret
  final Widget? icon;
  final bool hideIcon;

  /// if true the dropdown icon will as a leading icon, default to false
  final bool leadingIcon;

  const CustomDropdown({
    super.key,
    this.hideIcon = false,
    required this.child,
    required this.items,
    required this.currentIndex,
    this.dropdownStyle = const DropdownStyle(),
    this.dropdownButtonStyle = const DropdownButtonStyle(),
    this.icon,
    this.leadingIcon = false,
    this.onChange,
  });

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;

  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.dropdownButtonStyle;
    // link the overlay to the button
    return CompositedTransformTarget(
      link: _layerLink,
      child: SplashButton(
        borderRadius: BorderRadius.circular(style.radius),
        onTap: () {
          if (WidgetsBinding.instance.window.viewInsets.bottom != 0) {
            FocusManager.instance.primaryFocus?.unfocus();
          } else {
            _toggleDropdown();
          }
        },
        child: Container(
            padding: style.padding,
            width: style.width,
            height: style.height,
            decoration: BoxDecoration(
              color: style.backgroundColor,
              borderRadius: BorderRadius.circular(style.radius),
              border: Border.all(
                width: style.borderWidth,
                color: style.borderColor,
              ),
            ),
            child: widget.child),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    final screenSize = MediaQuery.of(context).size;
    // find the size and position of the current widget
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    final size = renderBox?.size;

    final offset = renderBox?.localToGlobal(Offset.zero);
    final topOffset = offset!.dy + size!.height + 5;

    bool showUnder = true;
    if (topOffset > screenSize.height / 1.5) {
      showUnder = false;
    }

    final marginOffset = showUnder ? size.height + 5 : -size.height - 5;
    final anchor = showUnder ? Alignment.topCenter : Alignment.bottomCenter;
    final maxHeight =
        showUnder ? screenSize.height - topOffset - 5 : screenSize.height / 2;

    return OverlayEntry(
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        // full screen container to register taps anywhere and close drop down
        child: WillPopScope(
          onWillPop: () async {
            if (_isOpen) {
              _toggleDropdown(close: true);
              return false;
            }
            return true;
          },
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Stack(
              children: [
                if (widget.items.isNotEmpty)
                  Positioned(
                    left: offset.dx,
                    top: topOffset,
                    width: widget.dropdownStyle.width ?? size.width,
                    child: CompositedTransformFollower(
                      offset: Offset(0, marginOffset),
                      link: _layerLink,
                      targetAnchor: anchor,
                      followerAnchor: anchor,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: widget.dropdownStyle.borderRadius ??
                              BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: showUnder
                                  ? const Offset(0, 1)
                                  : const Offset(0, -1),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Material(
                          borderRadius: widget.dropdownStyle.borderRadius ??
                              BorderRadius.circular(6),
                          color: widget.dropdownStyle.color,
                          child: SizeTransition(
                            axisAlignment: 1,
                            sizeFactor: _expandAnimation,
                            axis: Axis.vertical,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: maxHeight,
                              ),
                              child: ListView(
                                padding: widget.dropdownStyle.padding,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                children: widget.items.asMap().entries.map(
                                  (item) {
                                    return InkWell(
                                      onTap: () {
                                        widget.onChange?.call(
                                          item.value.value,
                                          item.key,
                                        );
                                        _toggleDropdown();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: item.value,
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}

/// DropdownItem is just a wrapper for each child in the dropdown list.\n
/// It holds the value of the item.
class DropdownItem<T> extends StatelessWidget {
  final T? value;
  final Widget child;

  const DropdownItem({super.key, this.value, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class DropdownButtonStyle {
  final double radius;
  final double? elevation;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final Color borderColor;
  final double borderWidth;
  final double? width;
  final double? height;
  final Color? primaryColor;

  const DropdownButtonStyle({
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderWidth = 1,
    this.primaryColor,
    this.height,
    this.width = 84,
    this.elevation,
    this.padding = const EdgeInsets.only(top: 17, bottom: 15),
    this.radius = 24,
  });
}

class DropdownStyle {
  final BorderRadius? borderRadius;
  final Color? color;
  final EdgeInsets? padding;

  ///button width must be set for this to take effect
  final double? width;

  const DropdownStyle({
    this.width,
    this.color = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
    this.borderRadius,
  });
}

class SplashButton extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final Color highlightColor;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final bool isDisabled;

  const SplashButton({
    super.key,
    required this.child,
    this.borderRadius,
    this.highlightColor = Colors.white24,
    this.isDisabled = false,
    this.onTap,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isDisabled) {
      return child;
    }

    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            borderRadius: borderRadius,
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: highlightColor,
              onTap: onTap,
              onDoubleTap: onDoubleTap,
            ),
          ),
        )
      ],
    );
  }
}
