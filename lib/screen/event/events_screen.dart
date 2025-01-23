import 'package:flutter/widgets.dart';
import 'package:flutter_belgium/di/injectable.dart';
import 'package:flutter_belgium/viewmodel/event/events_viewmodel.dart';
import 'package:flutter_belgium/widget/event/event_list_item.dart';
import 'package:flutter_belgium/widget/provider/provider_widget.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<EventsViewmodel>(
      create: () => getIt()..init(),
      builder: (context, viewModel) {
        return ImpaktfullUiScreen(
          title: 'Events',
          child: ImpaktfullUiListView.builder(
            items: viewModel.events,
            spacing: 8,
            isLoading: viewModel.isLoading,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, item, index) => EventListItem(
              event: item,
              onTap: () => viewModel.onEventTap(item),
            ),
            noDataLabel: 'No events found',
          ),
        );
      },
    );
  }
}
