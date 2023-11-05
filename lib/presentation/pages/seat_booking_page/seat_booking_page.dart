import 'dart:math';

import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/pages/seat_booking_page/methods/movie_screen.dart';
import 'package:flix_id/presentation/pages/seat_booking_page/methods/seat_section.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/router/router_provider.dart';
import '../../widgets/seat.dart';

class SeatBookingPage extends ConsumerStatefulWidget {
  final (MovieDetail, Transaction) transactionDetail;
  const SeatBookingPage({Key? key, required this.transactionDetail})
      : super(key: key);

  @override
  ConsumerState<SeatBookingPage> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends ConsumerState<SeatBookingPage> {
  List<int> selectedSeats = [];
  List<int> reservedSeats = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Random random = Random();

    int reservedNumber = random.nextInt(36) + 1;

    while (reservedSeats.length < 8) {
      if (!reservedSeats.contains(reservedNumber)) {
        reservedSeats.add(reservedNumber);
      }

      reservedNumber = random.nextInt(36) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final (movieDetail, transaction) = widget.transactionDetail;

    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              BackNavigationBar(
                movieDetail.title,
                onTap: ref.read(routerProvider).pop,
              ),
              //movieScreen
              movieScreen(),
              // seats (2 sections)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  seatSection(
                    seatNumber: List.generate(18, (index) => index + 1),
                    onTap: (seatNumber) {
                      if (!selectedSeats.contains(seatNumber)) {
                        setState(() {
                          selectedSeats.add(seatNumber);
                        });
                      } else {
                        setState(() {
                          selectedSeats.remove(seatNumber);
                        });
                      }
                    },
                    seatStatusChecker: (seatNumber) =>
                        reservedSeats.contains(seatNumber)
                            ? SeatStatus.reserved
                            : selectedSeats.contains(seatNumber)
                                ? SeatStatus.selected
                                : SeatStatus.available,
                  ),
                  horizontalSpace(30),
                  seatSection(
                    seatNumber: List.generate(18, (index) => index + 19),
                    onTap: (seatNumber) {
                      if (!selectedSeats.contains(seatNumber)) {
                        setState(() {
                          selectedSeats.add(seatNumber);
                        });
                      } else {
                        setState(() {
                          selectedSeats.remove(seatNumber);
                        });
                      }
                    },
                    seatStatusChecker: (seatNumber) =>
                        reservedSeats.contains(seatNumber)
                            ? SeatStatus.reserved
                            : selectedSeats.contains(seatNumber)
                                ? SeatStatus.selected
                                : SeatStatus.available,
                  ),
                ],
              ),
              // legend
              // number of selected seats
              //button
            ],
          ),
        )
      ]),
    );
  }
}
