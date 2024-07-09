import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

enum TypeDropDown {
  menu,
  dialog,
  modal,
  bottomSheet,
}

class CustomDropdownFormField<T> extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final BoxConstraints? constraints;
  final List<T>? items;
  final Future<List<T>> Function(String)? asyncItems;
  final String Function(T)? itemAsString;
  final T? selectedItem;
  final bool isShowSearchBox;
  final Widget? suffix;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final TypeDropDown? type;

  const CustomDropdownFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.title,
    this.constraints,
    this.hintText,
    this.items,
    this.asyncItems,
    this.selectedItem,
    this.itemAsString,
    this.isShowSearchBox = false,
    this.suffix,
    this.onChanged,
    this.validator,
    this.type = TypeDropDown.menu,
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
          items: items ?? [],
          asyncItems: asyncItems,
          itemAsString: itemAsString,
          selectedItem: selectedItem,
          dropdownButtonProps: DropdownButtonProps(
            focusNode: focusNode,
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
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
              suffix: suffix,
            ),
          ),
          popupProps: builderPopupProps(theme),
          // style: theme.textTheme.bodyMedium,
          validator: validator,
        ),
      ],
    );
  }

  PopupProps<T> builderPopupProps(ThemeData theme) {
    final textTheme = theme.textTheme;

    switch (type) {
      case TypeDropDown.menu:
        return PopupProps.menu(
          showSearchBox: isShowSearchBox,
          constraints: constraints ?? const BoxConstraints(maxHeight: 350),
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
        );
      case TypeDropDown.dialog:
        return PopupProps.dialog(
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: AutoSizeText(
              'Pilih $title',
              style: textTheme.titleLarge,
            ),
          ),
          showSearchBox: isShowSearchBox,
          showSelectedItems: true,
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
        );
      case TypeDropDown.modal:
        return PopupProps.modalBottomSheet(
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: AutoSizeText(
              'Pilih $title',
              style: textTheme.titleLarge,
            ),
          ),
          showSearchBox: isShowSearchBox,
          showSelectedItems: true,
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
        );
      case TypeDropDown.bottomSheet:
        return PopupProps.bottomSheet(
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: AutoSizeText(
              'Pilih $title',
              style: textTheme.titleLarge,
            ),
          ),
          showSearchBox: isShowSearchBox,
          showSelectedItems: true,
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
        );
      default:
        return PopupProps.menu(
          showSearchBox: isShowSearchBox,
          showSelectedItems: true,
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
        );
    }
  }
}
