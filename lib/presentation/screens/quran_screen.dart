import 'package:flutter/material.dart';
import 'package:quran_20_3/presentation/widgets/instrucations_alert_dialog.dart';
import '../../core/constants/strings.dart';
import '../widgets/quran_page_view.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key, required this.pageNumber}) : super(key: key);
  final int pageNumber;

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!isOnDoubleTapInfoDismmised!) {
        showDialog(
          context: context,
          builder: (context) {
            return const InstrucationsAlertDialog();
          },
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuranPageView(
        pageController: PageController(initialPage: widget.pageNumber),
      ),
    );
  }
}
