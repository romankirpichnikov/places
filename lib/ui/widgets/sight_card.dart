import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_text_styles.dart';
import 'package:places/constants/domain/sight_types.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screens/res/custom_color_scheme.dart';
import 'package:places/ui/widgets/sight_details_card.dart';
import 'package:places/utils/loading_builder.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  final List<Widget> actions;
  final Widget? content;

  const SightCard({
    Key? key,
    required this.sight,
    required this.actions,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                sight.url,
                fit: BoxFit.cover,
                loadingBuilder: loadingBuilder,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<SightDetailsCard>(
                    fullscreenDialog: true,
                    builder: (context) => SightDetailsCard(
                      sight: sight,
                    ),
                  ),
                ),
              ),
            ),
            SightTitle(sight: sight, actions: actions),
            SightBottomInformation(sight: sight, content: content),
          ],
        ),
      ),
    );
  }
}

class SightBottomInformation extends StatelessWidget {
  final Sight sight;
  final Widget? content;

  const SightBottomInformation({
    super.key,
    required this.sight,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
        width: 400,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color: Theme.of(context).extension<CustomColors>()?.cardbackground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sight.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (content != null) ...[
              content!,
            ],
            const SizedBox(height: 10),
            Text(
              sight.workingHours,
              maxLines: 2,
              style: AppTextStyles.disabledTextSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class SightTitle extends StatelessWidget {
  final Sight sight;
  final List<Widget> actions;

  const SightTitle({
    super.key,
    required this.sight,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Container(
        padding: const EdgeInsets.only(top: 5, left: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sight.type.name,
                  style: const TextStyle(color: Colors.white),
                ),
                Row(
                  children: actions,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
