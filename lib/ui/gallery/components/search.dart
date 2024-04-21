import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../main.dart';
import '../../../providers/home_provider.dart';
import '../../../widgets/text_fields/custom_text_field.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final HomeProvider homeProvider =
      Provider.of<HomeProvider>(navigatorKey.currentContext!, listen: false);

  @override
  void dispose() {
    // TODO: implement dispose
    homeProvider.searchTC.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: CustomTextField(
        label: "",
        hint: AppStrings.search,
        textCapitalization: TextCapitalization.none,
        textEditingController: homeProvider.searchTC,
        textFieldType: TextFieldType.search,
        fillColor: AppColors.textFieldPrimaryBgColor,
        isRequiredField: false,
        autoValidate: false,
        labelColor: Colors.white,
        borderColor: Colors.transparent,
        borderRadius: 8,
        hintColor: AppColors.textLightGreyColor,
        prefixIconData: Icons.search,
        prefixIconColor:AppColors.secondary,
        onTextChanged: (v){
          homeProvider.searchInList(value: v);
        },
      ),
    );
  }
}
