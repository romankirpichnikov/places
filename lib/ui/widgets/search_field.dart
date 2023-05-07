import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_strings.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Flexible(
          child: TextField(
            // controller: _searchController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppStrings.serach,
              // prefixIcon: SvgPicture.asset(AppIcons.search),
            ),
          ),
        ),
      ],
    );
  }
}
