import 'package:flix_id/presentation/widgets/seat.dart';
import 'package:flutter/material.dart';

Widget seatSection({
  required List<int> seatNumber,
  required void Function(int seatNumber) onTap,
  required SeatStatus Function(int seatNumber) seatStatusChecker,
}) =>
    SizedBox(
      height: 240,
      width: 110,
      child: Wrap(
        spacing: 10,
        runAlignment: WrapAlignment.spaceBetween,
        direction: Axis.vertical,
        children: seatNumber
            .map(
              (number) => Seat(
                number: number,
                status: seatStatusChecker(number),
                onTap: () => onTap(number),
              ),
            )
            .toList(),
      ),
    );
