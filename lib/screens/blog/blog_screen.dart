import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_service/bloc/blog/blog_bloc.dart';
import 'package:school_bus_service/components/cus_text.dart';
import 'package:school_bus_service/models/blog_model.dart';
import 'package:school_bus_service/screens/blog/components/blog_card.dart';
import 'package:school_bus_service/screens/blog/components/skeleton_blog_card.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogBloc()..add(LoadBlogEvent()),
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  Padding _body() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          const CusText.titleLarge(
            'THÔNG TIN MỚI NHẤT\nCỦA SBS',
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: BlocBuilder<BlogBloc, BlogState>(
              builder: (context, state) {
                if (state is BlogloadingState) {
                  return _skeleton();
                }
                if (state is BlogErrorState) {
                  return Center(
                    child: CusText.titleSmall(state.error),
                  );
                }
                if (state is BlogLoadedState) {
                  return _blogs(state.models);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _blogs(List<BlogModel> models) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 80),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: 8,
      itemBuilder: (_, index) {
        return BlogCard();
      },
    );
  }

  Widget _skeleton() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double heightItem = SkeletonBlogCard().height;
        double height = constraints.maxHeight != double.infinity
            ? constraints.maxHeight
            : heightItem;
        if (heightItem > height) {
          heightItem = height;
        }
        int count = (height / heightItem).round();
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemCount: count,
          itemBuilder: (_, __) {
            return SkeletonBlogCard();
          },
        );
      },
    );
  }
}

class CusScaffold {}
