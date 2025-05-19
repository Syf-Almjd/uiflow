import 'package:flutter/material.dart';
import 'package:uiflow/src/components/reposnsiveness.dart';

/// A widget for choosing items with optional multi-selection support.
class MultipleItemSelect extends StatefulWidget {
  /// The list of item names.
  final List<String> name;

  /// The primary color of the selected item.
  final Color? primaryColor;

  /// The secondary color of unselected items.
  final Color? secondaryColor;

  /// The width of each item.
  final double? width;

  /// The height of each item.
  final double? height;

  /// Flag indicating whether multi-selection is allowed.
  final bool? multiSelection;

  /// The number of items to display per row.
  final int? itemPerRow;

  /// Callback function when an item is tapped.
  final Function onTap;

  /// Constructs a [MultipleItemSelect].
  const MultipleItemSelect({
    Key? key,
    required this.name,
    this.primaryColor,
    this.secondaryColor,
    this.width,
    this.height,
    this.multiSelection,
    this.itemPerRow,
    required this.onTap,
  }) : super(key: key);

  @override
  State<MultipleItemSelect> createState() => _MultipleItemSelectState();
}

class _MultipleItemSelectState extends State<MultipleItemSelect> {
  List<bool> isSelected = [];
  // Map<String, bool> userChoice = {};

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(widget.name.length, (_) => false);
    // for (int i = 0; i < isSelected.length; i++) {
    //   userChoice[widget.name[i].toString()] = isSelected[i];
    // }
  }

  void _toggleSelection(int index) {
    setState(() {
      if (widget.multiSelection == false || widget.multiSelection == null) {
        isSelected.fillRange(0, isSelected.length, false);
        // userChoice.forEach((key, value) {
        //   userChoice[key] = false;
        // });
        isSelected[index] = !isSelected[index];
        // userChoice[widget.name[index].toString()] = isSelected[index];
      } else {
        isSelected[index] = !isSelected[index];
        // userChoice[widget.name[index].toString()] = isSelected[index];
      }
      // print(userChoice);
    });
  }

  // String FinalChoice(){
  //  List data=[];
  //   userChoice.forEach((key, value) {
  //     if (value == true) {
  //     data.add(key);
  //     }
  //   });
  //   return data.toString();
  // }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.itemPerRow ?? 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 50,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.name.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            _toggleSelection(index);
            widget.onTap(widget.name[index]);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width:
                widget.width ?? getWidth((100 ~/ widget.name.length), context),
            height: widget.height ?? getHeight(20, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: (isSelected[index])
                  ? widget.primaryColor ?? Colors.teal
                  : widget.secondaryColor ?? Colors.grey.withOpacity(0.3),
            ),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 900),
                child: Text(
                  widget.name[index],
                  textAlign: TextAlign.center,
                  style: (isSelected[index])
                      ? const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)
                      : TextStyle(
                          fontSize: 20,
                          color: Colors.grey.withOpacity(0.9),
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
