import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: const Color(0xffeeee00),
                  height: 360.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    sight.name,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              elevation: 0,
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
