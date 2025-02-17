import 'package:fair/fair.dart';
import 'package:example/plugins/net/fair_net_plugin.dart';
import 'package:flutter/material.dart';

@FairPatch()
class GridViewTemplate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GridViewTemplateState();
}

class _GridViewTemplateState extends State<GridViewTemplate> {
  final List<ItemData> _listData = <ItemData>[];
  int _page = 0;

  /// 生命周期回调，函数名不可修改
  void onLoad() {
    requestData();
  }

  /// 生命周期回调，函数名不可修改
  void onUnload() {}

  void requestData() {
    _page++;
    FairNet().request({
      'pageName': '#FairKey#',
      'method': 'GET',
      'url':
          'https://wos2.58cdn.com.cn/DeFazYxWvDti/frsupload/6f8e5d9e196cbaa4a46041928770b187_grid_data.json',
      'data': {'page': _page},
      'success': (resp) {
        if (resp == null) {
          return;
        }
        var data = resp['data'];
        data.forEach((item) {
          var dataItem = ItemData();
          try {
            dataItem.picUrl = item.imagePath;
          } catch (e) {
            dataItem.picUrl = item['imagePath'];
          }
          _listData.add(dataItem);
        });
        setState(() {});
      }
    });
  }

  bool isDataEmpty() {
    return _listData.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GridView模版'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: requestData,
          child: Icon(Icons.add),
        ),
        body: Sugar.ifEqualBool(isDataEmpty(),
            trueValue: Center(
              child: Text(
                '加载中...',
              ),
            ),
            falseValue: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: Sugar.map(_listData, builder: (ItemData item) {
                return AspectRatio(
                  aspectRatio: 1.5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    child: Image.network(item.picUrl, fit: BoxFit.cover),
                  ),
                );
              }),
            )));
  }
}

class ItemData extends Object {
  String picUrl = '';
}
