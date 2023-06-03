import 'package:flutter/material.dart';
import 'package:warzone_companion_app/widgets/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
          sliver: SliverToBoxAdapter(
            child: Text.rich(
              TextSpan(
                text: 'Your Warzone',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                    text: ' 2.0 ',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.lightGreenAccent[400],
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text: 'Companion App',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
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
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 18.0),
          sliver: SliverToBoxAdapter(
            child: LiveNowSection(),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 18.0),
          sliver: SliverToBoxAdapter(
            child: PopularStreamerSection(),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 18.0),
          sliver: SliverToBoxAdapter(
            child: ClipSection(),
          ),
        ),
      ],
    );
  }
}
