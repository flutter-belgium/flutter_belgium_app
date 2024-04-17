import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ImpaktfullScreen(
      title: 'Events',
      child: Center(
        child: Text(
          'Coming soon',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
