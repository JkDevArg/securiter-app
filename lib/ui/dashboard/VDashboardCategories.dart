import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  final List<String> categories = const ['Phone', 'Calls', 'Urls', 'Enterprise'];
  final List<IconData> icons = const [Icons.phone_android, Icons.call, Icons.account_tree_rounded, Icons.insert_chart_outlined_outlined];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                categories[index],
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              trailing: Icon(
                  icons[index],
                  color: Colors.white
              ),
            ),
          );
        },
        shrinkWrap: true,
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 5,
            crossAxisCount: 1),
      ),
    );
  }
}
