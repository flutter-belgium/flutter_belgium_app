import 'package:flutter_belgium/model/data/event/talk.dart';
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
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ClipRRect(
        borderRadius: BorderRadius.circular(theme.dimens.generalBorderRadius),
        child: ImpaktfullListItem(
          title: talk.name,
          onTap: onTap,
        ),
      ),
    );
  }
}
