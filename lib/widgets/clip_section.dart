import 'package:flutter/material.dart';
import 'package:warzone_companion_app/models/models.dart';
import 'package:warzone_companion_app/pages/pages.dart';

class ClipSection extends StatefulWidget {
  const ClipSection({super.key});

  @override
  State<ClipSection> createState() => _ClipSectionState();
}

class _ClipSectionState extends State<ClipSection> {
  late final PageController pageController;
  final posts = <Post>[
    const Post(
      title: 'Ranked Play in AI Mazrah with my team!',
      views: 24000,
      image: 'https://picsum.photos/200/300?random=1',
      user: ronal,
    ),
    const Post(
      title: 'DMZ extraction mode!',
      views: 51000,
      image: 'https://picsum.photos/200/300?random=2',
      user: albert,
    ),
    const Post(
      title: 'Ranked Play in AI Mazrah with my team!',
      views: 24000,
      image: 'https://picsum.photos/200/300?random=3',
      user: esther,
    ),
    const Post(
      title: 'Ranked Play in AI Mazrah with my team!',
      views: 24000,
      image: 'https://picsum.photos/200/300?random=4',
      user: annette,
    ),
  ];

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.60);
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
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              'Clips',
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
              itemCount: posts.length,
              itemBuilder: buildPost,
              onPageChanged: print,
              padEnds: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPost(BuildContext context, index) {
    final post = posts[index];
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, DetailPage.route, arguments: post),
      child: Hero(
        tag: post.image,
        child: Card(
          margin: const EdgeInsets.only(right: 18.0),
          borderOnForeground: true,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  image: DecorationImage(
                    image: NetworkImage(post.image),
                    fit: BoxFit.cover,
                  ),
                ),
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.0, 0.75],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent[400],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        '${(post.views / 1000).ceil()}K views',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    const Spacer(),
                    // Row(
                    //   children: [
                    //     SquareAvatar(
                    //       imageUrl: post.user.image,
                    //     ),
                    //     Expanded(child: Text(post.user.name)),
                    //   ],
                    // ),
                    // const SizedBox(height: 8.0),
                    // SizedBox(
                    //   height: kMinInteractiveDimension,
                    //   child: Text(post.title),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
