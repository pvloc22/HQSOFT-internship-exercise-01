import 'package:esale_sfa_2023r1_framework_sample_basic/core/view_components/base_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseAppbar extends StatefulWidget implements PreferredSizeWidget {
  const BaseAppbar({super.key});

  @override
  State<BaseAppbar> createState() => _BaseAppbarState();

  @override
  // TODO: implement child
  Size get preferredSize {
    return Size.fromHeight(
        kToolbarHeight + BaseBottomAppbar().preferredSize.height);
  }
}

class _BaseAppbarState extends State<BaseAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Thông báo",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: false,
      leading: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.checkDouble,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.sliders,
            color: Colors.white,
          ),
        ),
      ],
      backgroundColor: const Color(0xFF304384),
      bottom: BaseBottomAppbar(),
    );
  }
}
