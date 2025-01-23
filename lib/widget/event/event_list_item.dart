import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/model/data/event/event.dart';
import 'package:flutter_belgium/widget/provider/app_theme_localizer.dart';
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
    return AppThemeLocalizer(
      builder: (context, theme, localization) => ClipRRect(
        borderRadius: theme.dimens.borderRadius,
        child: ImpaktfullUiListItem(
          title: event.name,
          subtitle: event.date == null ? null : DateFormatterUtil.formatDateTime(event.date!),
          onTap: event.meetupUrl == null ? null : onTap,
        ),
      ),
    );
  }
}
