part of 'tabs_cubit.dart';

abstract class TabsState {}

class TabsInitial extends TabsState {}

class Tabs extends TabsState {
  final int selectedTabIndex;
  Tabs({required this.selectedTabIndex});
}
