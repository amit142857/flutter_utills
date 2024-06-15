import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final List<Widget> children;
  final bool shrinkwrap;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;

  const CustomListView({
    Key? key,
    required this.children,
    this.shrinkwrap = false,
    this.physics,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkwrap,
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
