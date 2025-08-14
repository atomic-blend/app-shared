import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';

/// A customizable bottom navigation item for use with [BottomNavigation].
///
/// This widget wraps the Material [NavigationDestination] to provide additional
/// functionality like an optional onTap callback for individual items.
class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.icon,
    required this.cupertinoIcon,
    required this.label,
    this.selectedIcon,
    this.onTap,
    this.tooltip,
    this.enabled = true,
    this.body,
    this.initialsOnly,
    this.appBar,
    this.mainSecondaryKey,
    this.color,
    this.separatorBefore,
  });

  /// The icon displayed by the destination.
  final IconData icon;

  /// The Cupertino icon displayed by the destination.
  final IconData cupertinoIcon;

  /// The optional icon to display when this destination is selected.
  final Widget? selectedIcon;

  /// The label displayed by the destination.
  final String label;

  /// Optional tooltip for the destination.
  final String? tooltip;

  /// Optional body
  final Widget? body;

  /// Optional appbar
  final AppBar? appBar;

  /// Optional separatorBefore
  final bool? separatorBefore;

  /// Main secondary key (the default secondary screen)
  final String? mainSecondaryKey;

  /// Optional color
  final Color? color;

  /// Whether to show only initials in the destination.
  final bool? initialsOnly;

  /// Whether this destination is interactive.
  final bool enabled;

  /// Optional callback invoked when this item is tapped.
  ///
  /// The callback provides the index of the item in the navigation bar.
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
   return Icon(icon);
  }
}

class NavigationSection {
  const NavigationSection({
    required this.key,
    required this.items,
  });

  /// The key of the section.
  final Key key;

  /// The list of items in the section.
  final List<NavigationItem> items;
}



class ABNavbar extends StatefulWidget {
  final Function(String key) onPrimaryMenuSelected;
  final Function(String key) onSecondaryMenuSelected;
  final List<NavigationItem> destinations;
  final String primaryMenuKey;
  final Color? backgroundColor;
  final Function(int)? onTap;
  final double height = 65;
  const ABNavbar({super.key, required this.onPrimaryMenuSelected, required this.onSecondaryMenuSelected, required this.destinations, required this.primaryMenuKey, this.backgroundColor, this.onTap});

  @override
  State<ABNavbar> createState() => _ABNavbarState();
}

class _ABNavbarState extends State<ABNavbar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? getTheme(context).primaryContainer,
        borderRadius:
                BorderRadius.circular($constants.corners.full),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                offset: const Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                offset: const Offset(0, 8),
                blurRadius: 16,
                spreadRadius: -4,
              ),
            ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...widget.destinations.map((e) => GestureDetector(
            onTap: () {
              final index = widget.destinations.indexOf(e);
              setState(() {
                selectedIndex = index;
              }); 
              // Check if the tapped item has its own onTap handler
          if (widget.destinations.length > index && e.onTap != null) {
            e.onTap!(index);
          }
          // Otherwise use the default handler
          else if (widget.onTap != null) {
            widget.onTap!(index);
          } else {
            widget.onPrimaryMenuSelected((widget.destinations[index].key as ValueKey).value);
            if (e.mainSecondaryKey != null) {
              widget.onSecondaryMenuSelected(e.mainSecondaryKey!);
            }
          }
            },
            child: Container(
              padding: EdgeInsets.all($constants.insets.xxs),
              // always make the center button have a wrapper
              decoration: 2 == widget.destinations.indexOf(e) ? BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular($constants.corners.full),
                boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                offset: const Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: -4,
              ),
            ]
              ) : null,
              child: Container(
                padding: EdgeInsets.all($constants.insets.xs),
                decoration: 2 == widget.destinations.indexOf(e) ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular($constants.corners.full),
                boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                offset: const Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                offset: const Offset(0, 8),
                blurRadius: 4,
                spreadRadius: -4,
              ),
            ]
              ) : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(e.icon, color: selectedIndex == widget.destinations.indexOf(e) ? Colors.grey.shade800 : Colors.grey.shade600, size: 25,),
                    if (widget.destinations.indexOf(e) != 2) Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(e.label, style: getTextTheme(context).bodyMedium?.copyWith(fontSize: 10, fontWeight: FontWeight.w700, color: selectedIndex == widget.destinations.indexOf(e) ? Colors.grey.shade800 : Colors.grey.shade600),),
                    ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}