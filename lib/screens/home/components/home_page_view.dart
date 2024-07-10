import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_service/bloc/home/home_bloc.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  final PageController controller = PageController();

  void _animateToPage(int page) {
    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, List<ValueNotifier<Widget>>>(
      builder: (context, views) {
        context.read<HomeBloc>().animateToPage(_animateToPage);
        return PageView.builder(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: views.length,
          itemBuilder: (_, index) {
            return _ViewTab(views[index]);
          },
        );
      },
    );
  }
}

class _ViewTab extends StatefulWidget {
  const _ViewTab(this.view);

  final ValueNotifier<Widget> view;

  @override
  State<_ViewTab> createState() => __ViewTabState();
}

class __ViewTabState extends State<_ViewTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ValueListenableBuilder(
      valueListenable: widget.view,
      builder: (_, view, __) {
        return view;
      },
    );
  }
}
