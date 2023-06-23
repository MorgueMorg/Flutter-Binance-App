import 'package:binance_clone/components/constants.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  EdgeInsets get searchBarPadding => const EdgeInsets.symmetric(horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 70.0),
      child: Padding(
        padding: searchBarPadding,
        child: _buildSearchInputField(context),
      ),
    );
  }

  Widget _buildSearchInputField(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 16,
        fontFamily: "Barlow",
        color: textLightColor,
        fontWeight: FontWeight.normal,
      ).copyWith(
        decorationColor: Colors.white,
        height: 1.2,
      ),
      decoration: buildSearchInputDecoration().copyWith(
        fillColor: primaryLightColor,
        hintText: "Search",
        hintStyle: const TextStyle(
          fontSize: 15,
          fontFamily: "Barlow",
          color: textLightColor,
          fontWeight: FontWeight.normal,
        ),
        isDense: true,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 45,
        ),
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 15,
          // onPressed: onCancelTap,
          onPressed: () {},
          icon: const Icon(Icons.cancel_outlined, color: textLightColor),
        ),
        counterText: "",
      ),
    );
  }
}

InputDecoration buildSearchInputDecoration() {
  var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
  );
  return InputDecoration(
    filled: true,
    border: border,
    enabledBorder: border,
    focusedBorder: border,
    prefixIconConstraints: const BoxConstraints(
      maxHeight: 45,
    ),
    prefixIcon: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search, color: textLightColor),
    ),
    contentPadding: EdgeInsets.zero,
  );
}
