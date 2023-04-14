import 'package:flutter_bloc/flutter_bloc.dart';

part 'tabs_state.dart';

class TabsCubit extends Cubit<TabsState> {
  TabsCubit() : super(TabsInitial());

  selectedTab(int index) {
    emit(Tabs(selectedTabIndex: index));
  }
}
