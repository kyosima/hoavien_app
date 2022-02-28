import 'package:get/get.dart';

class TaisansoBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TaisansoController());
  }
}

class TaisansoController extends GetxController {
  final List<Map<String, dynamic>> allTaisanso = [
    {
      "name": 'PQ1.3-02-01',
      "location": "Khu Phú Quý 2",
      "host": "Nguyễn Văn Lộc"
    },
    {
      "name": 'PQ2.3-02-02',
      "location": "Khu Phú Quý 1",
      "host": "Nguyễn Văn Lượn"
    },
    {
      "name": 'PQ2.3-02-10',
      "location": "Khu Phú Quý 4",
      "host": "Nguyễn Văn Chuối"
    },
    {
      "name": 'PQ2.3-02-12',
      "location": "Khu Phú Quý 2",
      "host": "Nguyễn Hà Lộc"
    },
    {
      "name": 'PQ2.3-02-07',
      "location": "Khu Phú Quý 4",
      "host": "Nguyễn Phú Lộc"
    },
    {
      "name": 'PQ2.3-02-08',
      "location": "Khu Phú Quý 1",
      "host": "Nguyễn Lê Lộc"
    },
    {
      "name": 'PQ2.3-02-02',
      "location": "Khu Phú Quý 2",
      "host": "Nguyễn Vượn Lộc"
    },
    {
      "name": 'PQ2.3-02-01',
      "location": "Khu Phú Quý 3",
      "host": "Nguyễn Văng Lộc"
    },
    {
      "name": 'PQ2.3-02-03',
      "location": "Khu Phú Quý 4",
      "host": "Nguyễn Vóc Lộc"
    },
    {
      "name": 'PQ2.3-02-02',
      "location": "Khu Phú Quý 5",
      "host": "Nguyễn Văn Lộc"
    },
    {
      "name": 'PQ2.3-02-03',
      "location": "Khu Phú Quý 1",
      "host": "Nguyễn Văn Lộc"
    },
    {
      "name": 'PQ2.3-02-01',
      "location": "Khu Phú Quý 4",
      "host": "Nguyễn Văn Lộc"
    },
  ];

  Rx<List<Map<String, dynamic>>> foundTaisanso =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    foundTaisanso.value = allTaisanso;
  }

  void findTaisanso(String nameTaisanso) {
    List<Map<String, dynamic>> results = [];
    if (nameTaisanso.isEmpty) {
      results = allTaisanso;
      refresh();
    } else {
      results = allTaisanso
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(nameTaisanso.toLowerCase()))
          .toList();
    }
    foundTaisanso.value = results;
    refresh();
  }

  final phanLoaiKhu = <Map>[
    {"name": 'Tất cả', "isCheck": false},
    {"name": 'Khu Phú Quý 1', "isCheck": false},
    {"name": 'Khu Phú Quý 2', "isCheck": false},
    {"name": 'Khu Phú Quý 3', "isCheck": false},
    {"name": 'Khu Phú Quý 5', "isCheck": false},
    {"name": 'Thanh Long Cát Tường', "isCheck": false},
    {"name": 'Thanh Long Vương Tộc', "isCheck": false},
  ].obs;

  void isCheck(index) {
    phanLoaiKhu[index]['isCheck'] = !phanLoaiKhu[index]['isCheck'];
    refresh();
  }
}
