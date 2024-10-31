import 'package:flutter/material.dart';

class SelectAdditionsWidget extends StatefulWidget {
  const SelectAdditionsWidget({
    super.key,
    required this.onTap,
    required this.additions,
    required this.hasHerbs,
    required this.hasChecken,
    required this.hasEgg,
    required this.selectAdditions,
  });
  final void Function(int) onTap;
  final void Function(bool herbs, bool checken, bool egg) selectAdditions;
  final List<Map<String, double>> additions;
  final bool hasHerbs;
  final bool hasChecken;
  final bool hasEgg;
  @override
  State<SelectAdditionsWidget> createState() => _SelectAdditionsWidgetState();
}

class _SelectAdditionsWidgetState extends State<SelectAdditionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Choose additions',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              widget.selectAdditions(
                  !widget.hasHerbs, widget.hasChecken, widget.hasEgg);
            },
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.pink,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: widget.hasHerbs,
                  onChanged: (value) {
                    widget.selectAdditions(
                        value!, widget.hasChecken, widget.hasEgg);
                  },
                ),
                Text(
                  widget.additions[0].entries.first.key,
                  style: const TextStyle(fontSize: 14),
                ),
                const Spacer(),
                Text(
                  '+ SAR ${widget.additions[0].entries.first.value}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              widget.selectAdditions(
                  widget.hasHerbs, !widget.hasChecken, widget.hasEgg);
            },
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.pink,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: widget.hasChecken,
                  onChanged: (value) {
                    widget.selectAdditions(
                        widget.hasHerbs, value!, widget.hasEgg);
                  },
                ),
                Text(
                  widget.additions[1].entries.first.key,
                  style: const TextStyle(fontSize: 14),
                ),
                const Spacer(),
                Text(
                  '+ SAR ${widget.additions[1].entries.first.value}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.selectAdditions(
                    widget.hasHerbs, !widget.hasChecken, !widget.hasEgg);
              });
            },
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.pink,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: widget.hasEgg,
                  onChanged: (value) {
                    widget.selectAdditions(
                        widget.hasHerbs, widget.hasChecken, value!);
                  },
                ),
                Text(
                  widget.additions[2].entries.first.key,
                  style: const TextStyle(fontSize: 14),
                ),
                const Spacer(),
                Text(
                  '+ SAR ${widget.additions[2].entries.first.value}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
