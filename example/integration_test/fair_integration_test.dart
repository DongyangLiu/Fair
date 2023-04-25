import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example/main.dart' as app;
import 'integration_test_util.dart' as util;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;


  List<TestData> testDataArray = [

    TestData('gridview test', '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"find.text","text":"Gridview >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"Image"},{"action":"expect","expect":8},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]')
    ,TestData('hotel_listview test', '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码","expect":0},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.text","text":"Listview >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pump"},{"action":"delayed"},{"action":"find.text","text":"Grand Royal Hotel"},{"action":"expect","expect":2},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]')
    ,TestData('list_card test', '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码","expect":0},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"ListView","text":""},{"action":"drag","offsetY":-600.0},{"action":"pump"},{"action":"find.text","text":"ListCard >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pump"},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]')
    ,TestData('list_page test', '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码","expect":0},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"ListView","text":""},{"action":"drag","offsetY":-600.0},{"action":"pump"},{"action":"find.text","text":"ListPage >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pump"},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]')
    ,TestData('login_page test', '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"ListView"},{"action":"drag","offsetY":-600.0},{"action":"pump"},{"action":"find.text","text":"Login >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"find.byType","type":"TextField"},{"action":"enterText","text":"hi"},{"action":"pump"},{"action":"takeScreenshot"},{"action":"find.text","text":"Login"},{"action":"tap"},{"action":"pump"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]')
    ,TestData('pageview test', '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.text","text":"PageView >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"find.byType","type":"Image"},{"action":"expect","expect":2},{"action":"takeScreenshot"}]')

  ];

  group('fair_integration_test ', () {
    testDataArray.forEach((element) {
      testWidgets(element.testWightName,
          (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await binding.convertFlutterSurfaceToImage();
        await tester.pumpAndSettle();
        await util.integrationTestByJson(tester, binding, element.testJsonString);
      });
    });
  });
}

class TestData {
  String testJsonString='';
  String testWightName='';
  TestData( this.testWightName,this.testJsonString);
}