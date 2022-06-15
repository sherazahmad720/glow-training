import 'package:flutter/material.dart';
import 'package:training/constants.dart';

class TrainingCard extends StatelessWidget {
  const TrainingCard(
      {Key? key,
      this.onTap,
      this.title = '',
      this.isTopicCard = false,
      this.isEnable = true,
      this.status = false})
      : super(key: key);
  final String title;
  final bool status;
  final bool isEnable;
  final bool isTopicCard;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: isEnable ? 1 : 0.3,
        child: Card(
          // color: isEnable ? null : Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children: [
              if (isTopicCard)
                Icon(
                  Icons.check_circle_outline_outlined,
                  color: status ? Colors.green : Colors.grey,
                ),
              size5,
              Expanded(child: customText(text: title, size: 16)),
              const Icon(Icons.keyboard_arrow_right_outlined)
            ]),
          ),
        ),
      ),
    );
  }
}
