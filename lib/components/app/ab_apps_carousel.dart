import 'package:ab_shared/components/widgets/elevated_container.dart';
import 'package:ab_shared/utils/constants.dart';
import 'package:ab_shared/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ABAppsCarousel extends StatefulWidget {
  const ABAppsCarousel({super.key});

  @override
  State<ABAppsCarousel> createState() => _ABAppsCarouselState();
}

class _ABAppsCarouselState extends State<ABAppsCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              autoPlay: true,
              height: 150,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: [
              Row(
                children: [
                  Expanded(
                    child: _buildAppItem(
                      context,
                      "assets/images/atomic_mail_logo.png",
                      "Atomic Mail",
                    ),
                  ),
                  Expanded(
                    child: _buildAppItem(
                      context,
                      "assets/images/atomic_task_logo.png",
                      "Atomic Task",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildAppItem(
                      context,
                      "assets/images/atomic_notes_logo.png",
                      "Atomic Notes",
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              [0, 1].map((i) {
                return GestureDetector(
                  onTap: () => _controller.jumpToPage(i),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == i ? Colors.blue : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildAppItem(BuildContext context, String assetName, String label) {
    return GestureDetector(
      onTap: () => {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedContainer(
            width: 60,
            height: 60,
            borderRadius: $constants.corners.lg,
            border: Border.all(
              color:
                  isDarkMode(context)
                      ? Colors.grey.shade600
                      : Colors.grey.shade300,
              width: 1,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular($constants.corners.lg),
              child: Image.asset(assetName, package: "ab_shared"),
            ),
          ),
          SizedBox(height: $constants.insets.xs),
          Text(label),
        ],
      ),
    );
  }
}
