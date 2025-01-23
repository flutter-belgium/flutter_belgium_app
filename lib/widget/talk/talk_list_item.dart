import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/model/data/event/talk.dart';
import 'package:flutter_belgium/widget/provider/app_theme_localizer.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class TalkListItem extends StatelessWidget {
  final Talk talk;
  final VoidCallback onTap;

  const TalkListItem({
    required this.talk,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeLocalizer(
      builder: (context, theme, localization) => ClipRRect(
        borderRadius: theme.dimens.borderRadius,
        child: ImpaktfullUiListItem(
          title: talk.name,
          onTap: onTap,
        ),
      ),
    );
  }
}
