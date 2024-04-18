import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/viewmodel/talk/talks_viewmodel.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:flutter_belgium/widget/talk/talk_list_item.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class TalksScreen extends StatelessWidget {
  const TalksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TalksViewmodel>(
      create: () => getIt()..init(),
      builder: (context, viewModel) {
        return ImpaktfullScreen(
          title: 'Talks',
          child: ImpaktfullListView.builder(
            items: viewModel.talks,
            isLoading: viewModel.isLoading,
            itemBuilder: (context, item, index) => TalkListItem(
              talk: item,
              onTap: () => viewModel.onTalkTapped(item),
            ),
            noDataLabel: 'No talks found',
          ),
        );
      },
    );
  }
}
