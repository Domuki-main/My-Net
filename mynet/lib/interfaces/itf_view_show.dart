//an example of a type of class which is used to show the information
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ViewShow extends StatefulWidget {
  // there are 2 ways to transfer data through pages
  // 1. use parameters inside the constructer of the class
  // ViewShow({....});
  // 2. use the arguments
  // example:
  //   sender side:
  //     Navigator.of(context).pushNamed('/<routename>', arguments: {
  //       'argument1': "argument1",
  //       'argument2': "argument2",
  //      });
  //   receiver side:
  //     Map<String, dynamic> DataSet = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  //     String userId = DataSet['argument1'].toString();
  //     String babyId = DataSet['argument2'].toString();
  const ViewShow({Key? key}) : super(key: key);

  // the lifecycle of stateful widgets
  // createState -> initState -> didChangeDependencies->
  // build -> deactivate -> dispose
  @override
  State<ViewShow> createState() {
    //createState ，该函数为 StatefulWidget 中创建 State 的方法，
    //当 StatefulWidget 被调用时会立即执行 createState 。
    return _ViewShowState();
  }
}

class _ViewShowState extends State<ViewShow> {
  // 假设进入页面时，加载没有结束
  bool loading = true;

  Future<void> _dataLoading() async {
    await Future.delayed(
      Duration(seconds: 3),
      () {},
    );
    loading = false;
  }

  Future<void> _onRefresh() async {
    await Future.delayed(
      Duration(seconds: 3),
      () {},
    );
  }

  @override
  void initState() {
    //initState ，该函数为 State 初始化调用，
    //因此可以在此期间执行 State 各变量的初始赋值，同时也可以在此期间与服务端交互，
    //获取服务端数据后调用 setState 来设置 State。
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // 当State对象的依赖发生变化时会被调用
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //主要是返回需要渲染的 Widget ，由于 build 会被调用多次，
    //因此在该函数中只能做返回 Widget 相关逻辑，
    //避免因为执行多次导致状态异常。
    if (loading) {
      // 如果还在加载，应该返回一个加载动画
      return const Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      );
    } else {
      // 如果加载结束，应该返回页面
      return WillPopScope(
        //controller of exiting the current page
        onWillPop: () async {
          return false;
        },
        child: RefreshIndicator(
          //下拉刷新
          onRefresh: _onRefresh,
          child: Scaffold(),
        ),
      );
    }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ViewShow oldWidget) {
    // 在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，
    // 然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    // 在 debug 模式下，每次热重载都会调用该函数
    super.reassemble();
  }
}
