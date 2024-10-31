import 'package:flutter/material.dart';

class SelectSizeWidget extends StatefulWidget {
  const SelectSizeWidget({
    super.key,
    required this.selectedSizeInt,
    required this.onTap,
  });
  final int selectedSizeInt;
  final void Function(int) onTap;

  @override
  State<SelectSizeWidget> createState() => _SelectSizeWidgetState();
}

class _SelectSizeWidgetState extends State<SelectSizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0).copyWith(right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Choose your size',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              widget.onTap(0);
            },
            child: Row(
              children: [
                const Text(
                  'Small',
                  style: TextStyle(fontSize: 14),
                ),
                const Spacer(),
                const Text(
                  '- SAR 10.00',
                  style: TextStyle(fontSize: 14),
                ),
                Radio<int>(
                  activeColor: Colors.pink,
                  value: 0,
                  groupValue: widget.selectedSizeInt,
                  onChanged: (value) {
                    widget.onTap(value!);
                  },
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              widget.onTap(1);
            },
            child: Row(
              children: [
                const Text(
                  'Medium',
                  style: TextStyle(fontSize: 14),
                ),
                const Spacer(),
                Radio<int>(
                  activeColor: Colors.pink,
                  value: 1,
                  groupValue: widget.selectedSizeInt,
                  onChanged: (int? value) {
                    setState(() {
                      widget.onTap(value!);
                    });
                  },
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.onTap(2);
              });
            },
            child: Row(
              children: [
                const Text(
                  'Large',
                  style: TextStyle(fontSize: 14),
                ),
                const Spacer(),
                const Text(
                  '+ SAR 15.00',
                  style: TextStyle(fontSize: 14),
                ),
                Radio<int>(
                  activeColor: Colors.pink,
                  value: 2,
                  groupValue: widget.selectedSizeInt,
                  onChanged: (int? value) {
                    setState(() {
                      widget.onTap(value!);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
