import 'package:flutter/material.dart';
import 'package:warzone_companion_app/models/models.dart';
import 'package:warzone_companion_app/widgets/square_avatar.dart';

class PopularStreamerSection extends StatefulWidget {
  const PopularStreamerSection({super.key});

  @override
  State<PopularStreamerSection> createState() => _PopularStreamerSectionState();
}

class _PopularStreamerSectionState extends State<PopularStreamerSection> {
  late final PageController pageController;
  final popularUsers = <User>[annette, savanah, esther, albert];

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.70);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              'Popular Streamers',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              allowImplicitScrolling: true,
              itemCount: popularUsers.length,
              itemBuilder: buildUserCard,
              onPageChanged: print,
              padEnds: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserCard(BuildContext context, index) {
    final user = popularUsers[index];
    return Card(
      margin: const EdgeInsets.only(right: 18.0),
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      color: Colors.amber[200]!.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SquareAvatar(
              imageUrl: user.image,
              size: 42,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            user.name,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.lightGreenAccent[400],
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '${user.followers} Millions followers'.toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey[400],
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
