import 'package:flutter/material.dart';
import 'package:warzone_companion_app/models/models.dart';
import 'package:warzone_companion_app/pages/pages.dart';
import 'package:warzone_companion_app/widgets/widget.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final items = <Post>[
    const Post(
      title: 'Ranked Play in AI Mazrah with my team!',
      views: 44000,
      image: 'https://picsum.photos/200/300?random=15',
      user: annette,
    ),
    const Post(
      title: 'DMZ extraction mode!',
      views: 89000,
      image: 'https://picsum.photos/200/300?random=6',
      user: esther,
    ),
    const Post(
      title: 'Ranked Play in AI Mazrah with my team!',
      views: 100000,
      image: 'https://picsum.photos/200/300?random=7',
      user: albert,
    ),
    const Post(
      title: 'DMZ extraction mode!',
      views: 123000,
      image: 'https://picsum.photos/200/300?random=8',
      user: ronal,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
          sliver: SliverToBoxAdapter(
            child: Text.rich(
              TextSpan(
                text: 'Whatch a',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                    text: ' Live Stream!',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.lightGreenAccent[400],
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: TagSection(),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(12.0),
          sliver: SliverToBoxAdapter(
            child: SearchBar(
              backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
              textStyle: const MaterialStatePropertyAll(
                  TextStyle(color: Colors.white)),
              hintText: 'Find your favorite...',
              hintStyle: const MaterialStatePropertyAll(
                  TextStyle(color: Colors.white60)),
              trailing: const [
                Icon(
                  Icons.search_rounded,
                  color: Colors.white60,
                )
              ],
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.only(left: 8.0, right: 18.0)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              overlayColor:
                  MaterialStatePropertyAll(Colors.lightGreenAccent[50]),
              surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
            ),
          ),
        ),
        SliverList.builder(
          itemBuilder: itemBuilder,
          itemCount: items.length,
        ),
      ],
    );
  }

  Widget itemBuilder(BuildContext context, index) {
    final post = items[index];
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, DetailPage.route, arguments: post),
      child: SizedBox(
        height: 240,
        child: Hero(
          tag: post.image,
          child: Card(
            margin: const EdgeInsets.only(top: 8.0, bottom: 18.0),
            borderOnForeground: true,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
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
                          'live',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          SquareAvatar(
                            imageUrl: post.user.image,
                          ),
                          Expanded(
                              child: Text(
                            post.user.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          )),
                          Text(
                            '${(post.views / 1000).ceil()}K watching',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
