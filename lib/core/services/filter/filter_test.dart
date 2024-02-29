import 'package:flutter/material.dart';

import '../../mixins/common.dart';
import '/core/services/filter/filter_item.dart';

class FilterTest extends FilterItem<String> {
  final List<String> values;
  FilterTest({required super.defaultValue, required this.values});

  @override
  TransitionBuilder get builder => (_, child) => MyWidget(filter: this);

  @override
  Widget get child => ChildA(filter: this);
}

class ChildA extends StatelessWidget {
  final FilterTest filter;
  const ChildA({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ElevatedButton(
          onPressed: () async {
            await showModalBottomSheet(
              context: context,
              builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  filter.build,
                ],
              ),
            );
          },
          child: Text('open filterA'));
    });
  }
}

class MyWidget extends StatelessWidget {
  final FilterTest filter;

  const MyWidget({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (final String value in filter.values)
          InkWell(
            onTap: () {
              filter.update(
                value,
              );
            },
            child: Container(
                width: 40,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: value == filter.value ? Fx.amber400 : Fx.blue400),
                child: Text(value)),
          ),
      ],
    );
  }
}
