import 'package:flutter/material.dart';
import 'package:places/constants/domain/sight_types.dart';
import 'package:places/custom_app_bar.dart';
import 'package:places/domain/sight.dart';
import 'package:places/utils/loading_builder.dart';

class SightDetailsCard extends StatelessWidget {
  final Sight sight;
  const SightDetailsCard({
    super.key,
    required this.sight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  sight.url,
                  fit: BoxFit.cover,
                  height: 360,
                  width: double.infinity,
                  loadingBuilder: loadingBuilder,
                ),
                const SizedBox(height: 24),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    sight.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        sight.type.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        sight.workingHours,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24.0, left: 8.0),
                  child: Text(
                    sight.details,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 20, top: 20),
                  constraints: const BoxConstraints(
                    maxWidth: 280,
                    maxHeight: 48,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green,
                  ),
                  child: const Center(child: Text('Построить маршрут')),
                ),
                const SizedBox(height: 5),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      width: 164,
                      height: 40,
                      child: Center(
                        child: Text(
                          'Запланировать',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 164,
                      height: 40,
                      child: Center(child: Text('В избранное')),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
