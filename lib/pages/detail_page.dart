import 'package:flutter/material.dart';
import 'package:warzone_companion_app/models/post.dart';
import 'package:warzone_companion_app/widgets/widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.post});
  static const String route = '/detail';
  final Post post;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final Post _post = widget.post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            floating: false,
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            pinned: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            automaticallyImplyLeading: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.2,
            collapsedHeight: MediaQuery.of(context).size.height * 0.2,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Hero(
                  tag: _post.image,
                  child: Image.network(_post.image, fit: BoxFit.cover),
                ),
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 4.0),
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
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kMinInteractiveDimension),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.crop_free_rounded),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(18.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '#1 Trending'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey[400],
                            ),
                      ),
                      Text(
                        '${(_post.views / 1000).ceil()}K watching'
                            .toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey[400],
                            ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _post.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 82,
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 18.0),
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
                        imageUrl: _post.user.image,
                        size: 42,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      _post.user.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
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
                                '${_post.user.followers} Millions followers'
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.grey[400],
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FloatingActionButton.small(
                            heroTag: 'search_btn',
                            backgroundColor: Colors.black,
                            onPressed: () {},
                            child: const Icon(
                              Icons.person_search_rounded,
                              color: Colors.white,
                            ),
                          ),
                          FloatingActionButton.small(
                            heroTag: 'like_btn',
                            backgroundColor: Colors.black,
                            onPressed: () {},
                            child: Icon(
                              Icons.heart_broken,
                              color: Colors.lightGreenAccent[400],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Theme(
                    data: ThemeData(brightness: Brightness.dark),
                    child: ExpansionPanelList.radio(
                      elevation: 0,
                      animationDuration: const Duration(milliseconds: 300),
                      expandedHeaderPadding: EdgeInsets.zero,
                      initialOpenPanelValue: 'chat',
                      children: [
                        ExpansionPanelRadio(
                          value: 'description',
                          canTapOnHeader: true,
                          backgroundColor: Colors.transparent,
                          headerBuilder: (context, isExpanded) => Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          body: const Text(
                              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'''),
                        ),
                        ExpansionPanelRadio(
                          value: 'chat',
                          canTapOnHeader: true,
                          backgroundColor: Colors.transparent,
                          headerBuilder: (context, isExpanded) => Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Chat',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          body: ChatSection(post: _post),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 33.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Write a comment',
            fillColor: Colors.grey[900],
            filled: true,
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey[400],
                ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send_rounded),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}
