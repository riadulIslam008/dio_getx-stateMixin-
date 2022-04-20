import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dio/Model/post_model.dart';
import 'package:getx_dio/View/Homepage/home_controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

//Pagination in my way
class HomeWithPagination extends GetWidget<HomeController> {
  const HomeWithPagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => ListView.separated(
        //  controller: controller.scrollController,
          itemCount: controller.dataList.length + 1,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemBuilder: (_, index) {
            if ((index < controller.dataList.length)) {
              return ListTile(
                title: Text(
                  controller.dataList[index].title.capitalizeFirst!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(controller.dataList[index].body.capitalizeFirst!),
                ),
              );
            } else {
              return Obx(
                () => Center(
                  child:
                      controller.showLoading.value && controller.hasMore.value
                          ? const Text("No More Data")
                          : const CircularProgressIndicator(),
                ),
              );
            }
          },
          separatorBuilder: (_, index) {
            return const Divider(
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}


//Pagination With infinity package
class ArticlesListView extends GetWidget<HomeController> {
  const ArticlesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PagedListView.separated(
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) {
              PostModel _postModel = item as PostModel;
              return ListTile(
                title: Text(
                  _postModel.title.capitalizeFirst!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(_postModel.body.capitalizeFirst!),
                ),
              );
            },
            firstPageErrorIndicatorBuilder: (_) {
              return Center(
                child: Text(controller.pagingController.error.toString()),
              );
            },
            noItemsFoundIndicatorBuilder: (_) {
              return const Center(
                child: Text("No Item Found 😑"),
              );
            },
            noMoreItemsIndicatorBuilder: (_) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("No More Item 😑"),
                ),
              );
            },
            newPageProgressIndicatorBuilder: (_) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          separatorBuilder: (_, index) {
            return const Divider(
              color: Colors.grey,
            );
          }),
    );
  }
}
