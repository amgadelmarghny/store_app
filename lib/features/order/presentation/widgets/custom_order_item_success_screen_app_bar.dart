import 'package:flutter/material.dart';
import 'package:soagmb/generated/l10n.dart';

class CustomOrderItemSuccessScreenAppBarDelegate
    extends SliverPersistentHeaderDelegate {
  const CustomOrderItemSuccessScreenAppBarDelegate({
    required this.id,
    required this.status,
    required this.date,
    required this.expandedHeight,
  });
  final double expandedHeight;
  final int id;
  final String status;
  final String date;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
          opacity: 1 - (shrinkOffset / expandedHeight),
          child: Image.asset('lib/core/global/assets/images/appbar_image.png',
              fit: BoxFit.cover),
        ),
        Opacity(
          opacity: (shrinkOffset / expandedHeight),
          child: AppBar(
            title: Text(S.of(context).order_details),
          ),
        ),
        Positioned(
          top: expandedHeight - shrinkOffset - 100 / 2,
          left: 20,
          right: 20,
          child: Opacity(
            opacity: 1 - (shrinkOffset / expandedHeight),
            child: SizedBox(
              height: 100,
              child: Card(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //! ID
                      Text(
                        '${S.of(context).order_id} : $id',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      //! status
                      Text('${S.of(context).status}: $status',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.amber)),
                      Text(
                        date,
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
  double get maxExtent => expandedHeight;
  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
