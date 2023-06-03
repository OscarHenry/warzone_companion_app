import 'package:flutter/material.dart';
import 'package:warzone_companion_app/models/models.dart';

class TagSection extends StatefulWidget {
  const TagSection({
    super.key,
  });

  @override
  State<TagSection> createState() => _TagSectionState();
}

class _TagSectionState extends State<TagSection> {
  final tags = <Tag>[
    Tag(name: 'all', isSelected: true),
    Tag(name: 'hackers'),
    Tag(name: 'ranked'),
    Tag(name: 'Multiplayer'),
    Tag(name: 'iso'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMinInteractiveDimension,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 12),
        itemCount: tags.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final tag = tags[index];
          return ChoiceChip(
            onSelected: (isSelected) {
              setState(() {
                tag.isSelected = isSelected;
              });
            },
            selected: tag.isSelected,
            label: Text('#${tag.name}'),
            labelStyle:
                TextStyle(color: tag.isSelected ? Colors.black : Colors.white),
            backgroundColor: Colors.amber[200]!.withOpacity(0.2),
            shape: const StadiumBorder(),
            side: BorderSide.none,
            selectedColor: Colors.lightGreenAccent[400],
          );
        },
      ),
    );
  }
}
