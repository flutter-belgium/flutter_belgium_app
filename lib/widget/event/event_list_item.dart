import 'package:flutter_belgium/model/data/event/event.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class EventListItem extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;

  const EventListItem({
    required this.event,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ClipRRect(
        borderRadius: BorderRadius.circular(theme.dimens.generalBorderRadius),
        child: ImpaktfullListItem(
          title: event.name,
          subTitle: event.date == null ? null : DateFormatterUtil.formatDateTime(event.date!),
          onTap: event.meetupUrl == null ? null : onTap,
        ),
      ),
    );
  }
}
