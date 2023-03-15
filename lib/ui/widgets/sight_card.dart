import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/constants/domain/app_text_styles.dart';

import 'package:places/constants/domain/sight_types.dart';
import 'package:places/domain/sight.dart';
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
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        clipBehavior: Clip.hardEdge,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                child: Stack(
                  children: [
                    Image.network(
                      sight.url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      loadingBuilder: loadingBuilder,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
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
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: AppColors.backgroundColor,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sight.name,
                        style: AppTextStyles.baseTextBold,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
