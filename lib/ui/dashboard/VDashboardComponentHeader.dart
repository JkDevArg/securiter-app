import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.headerTitle});
  final String headerTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 61,
        width: 360,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              headerTitle,
              style: GoogleFonts.roboto(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'See',
                        style: GoogleFonts.roboto(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'All',
                        style: GoogleFonts.roboto(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red,
                    size: 12,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}