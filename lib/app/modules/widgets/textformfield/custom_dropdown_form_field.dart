import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final List<DropdownMenuItem<String>>? items;
  final Future<List<T>> Function(String)? asyncItems;
  final String Function(T)? itemAsString;
  // final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final bool isShowSearchBox;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;

  const CustomDropdownFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.title,
    this.hintText,
    this.items,
    this.asyncItems,
    // this.selectedItemBuilder,
    this.itemAsString,
    this.isShowSearchBox = false,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != '')
          AutoSizeText(
            title,
            style: theme.textTheme.titleMedium,
            maxLines: 1,
          ),
        const Gap(8),
        DropdownSearch<T>(
          asyncItems: asyncItems,
          itemAsString: itemAsString,
          dropdownButtonProps: DropdownButtonProps(
            focusNode: focusNode,
          ),
          onChanged: onChanged,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          popupProps: PopupProps.menu(
            showSearchBox: isShowSearchBox,
            // showSelectedItems: true,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                hintText: 'Masukkan Pencarian',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: theme.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          // style: theme.textTheme.bodyMedium,
          validator: validator,
        ),
      ],
    );
  }
}
