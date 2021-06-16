import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvvm_movieapp/const/styling.dart';
import 'package:mvvm_movieapp/viewmodels/movie_view_model.dart';

class Ticket extends StatefulWidget {
  final double width;
  final List<MovieViewModel> movies;
  final EdgeInsets padding;
  final double punchRadius;
  final double borderRadius;
  // final double height;
  // final Widget child;
  final Widget top;
  final Widget bottom;
  final Color color;
  final bool isCornerRounded;

  Ticket(
      {required this.width,
      required this.movies,
      // @required this.height,
      // @required this.child,
      required this.top,
      required this.bottom,
      required this.borderRadius,
      required this.punchRadius,
      this.padding = const EdgeInsets.all(5.0),
      this.color = Colors.white,
      this.isCornerRounded = false});

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  var movies;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      // color: Colors.transparent,
      // elevation: 0,
      child: ListView.builder(
          padding: EdgeInsets.only(top: 24),
          shrinkWrap: true,
          itemCount: widget.movies.length,
          itemBuilder: (context, index) {
            final movie = widget.movies[index];
            return Container(
              padding: widget.padding,
              decoration: new BoxDecoration(
                  // color: Colors.transparent,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black.withOpacity(.04),
                      blurRadius: 20,
                      offset: new Offset(0.0, 0.0),
                    ),
                    new BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 20,
                        offset: new Offset(0.0, 10.0),
                        spreadRadius: -15)
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipPath(
                    clipper: TicketClipper(widget.punchRadius),
                    child: Column(
                      children: <Widget>[
                        Container(
                          // duration: Duration(seconds: 1),
                          width: widget.width,
                          // minHeight: widget.height,
                          child: Row(
                            children: [
                              widget.top,
                              // Container(
                              //   margin: EdgeInsets.all(12),
                              //   decoration: BoxDecoration(
                              //       image: DecorationImage(
                              //           fit: BoxFit.cover,
                              //           image:
                              //               NetworkImage(movie.multimedia.src)),
                              //       borderRadius: BorderRadius.circular(14)),
                              //   width: 140,
                              //   height: 200,
                              // ),
                              Expanded(
                                  child: ListTile(
                                title: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Text(
                                    movie.title,
                                    style: TextStyle(
                                        fontSize: 28,
                                        height: 1.5,
                                        color: AppTheme.lightText,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.date_range_rounded,
                                        color: AppTheme.orange,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        movie.year,
                                        style: TextStyle(
                                            color: AppTheme.orange,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: widget.color,
                              borderRadius:
                                  BorderRadius.circular(widget.borderRadius)),
                        ),
                        SizedBox(
                          width: widget.width,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            color: AppTheme.dark_grey.withOpacity(0.6),
                            child: Dash(
                              width: 6,
                              height: 3,
                              color: AppTheme.searchBarColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // CustomPaint(painter: MyLinePainter()),
                  ClipPath(
                    clipper: TicketClipperBottom(widget.punchRadius),
                    child: Container(
                      // duration: Duration(seconds: 1),
                      width: widget.width,
                      // minHeight: widget.height,
                      child: widget.bottom,
                      decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius)),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  double punchRadius;
  TicketClipper(this.punchRadius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height), radius: punchRadius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height), radius: punchRadius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TicketClipperBottom extends CustomClipper<Path> {
  double punchRadius;
  TicketClipperBottom(this.punchRadius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: Offset(0.0, 0), radius: punchRadius));
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 0), radius: punchRadius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Dash extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const Dash({this.height = 1, this.width = 3, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
