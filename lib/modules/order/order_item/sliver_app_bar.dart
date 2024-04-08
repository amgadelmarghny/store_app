import 'package:flutter/material.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const CustomSliverAppBarDelegate({required this.expandedHeigh});
  final double expandedHeigh;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
            opacity: 1 - (shrinkOffset / expandedHeigh),
            child: Image.asset('lib/assets/images/appbar_iamge.png',
                fit: BoxFit.cover)),
        Opacity(
          opacity: (shrinkOffset / expandedHeigh),
          child: AppBar(
            title: const Text('Order Details'),
          ),
        ),
        Positioned(
          top: expandedHeigh - shrinkOffset - 100 / 2,
          left: 20,
          right: 20,
          child: Opacity(
            opacity: 1 - (shrinkOffset / expandedHeigh),
            child: SizedBox(
              height: 100,
              child: Card(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //! ID
                      Text(
                        'Order ID: 3435666',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      //! sratus
                      Text('Status: New',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.amber)),
                      Text(
                        '12 / 07 / 2021',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeigh;
  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
