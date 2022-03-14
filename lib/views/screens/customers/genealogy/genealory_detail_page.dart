import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class GenealoryDetailPage extends StatefulWidget {
  const GenealoryDetailPage({Key? key}) : super(key: key);

  @override
  _TreeViewPageState createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<GenealoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFDF2D7),
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  print(graph.toJson());
                },
                child: const Text(
                  'Lưu gia phả',
                  style: TextStyle(color: Colors.brown),
                ))
          ],
          centerTitle: false,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: secondaryColor,
          ),
          backgroundColor: primaryColor,
          title: const CustomTitleText(
            title: 'Họ Trần',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: InteractiveViewer(
                      constrained: false,
                      boundaryMargin: const EdgeInsets.all(100),
                      minScale: 0.01,
                      maxScale: 2.6,
                      child: GraphView(
                        graph: graph,
                        algorithm: BuchheimWalkerAlgorithm(
                            builder, TreeEdgeRenderer(builder)),
                        paint: Paint()
                          ..color = const Color(0xffAE0C01)
                          ..strokeWidth = 2
                          ..style = PaintingStyle.fill,
                        builder: (Node node) {
                          // I can decide what widget should be shown here based on the id
                          var a = node.key?.value as int;
                          return rectangleWidget(a);
                        },
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  Random r = Random();

  Widget rectangleWidget(int a) {
    return InkWell(
      onTap: () {
        print('clicked $a');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              a == 1
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Colors.transparent,
                      ))
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Colors.transparent,
                      )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star,
                    color: Colors.transparent,
                  )),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 186,
                width: 124,
                decoration: BoxDecoration(
                    color: primaryColor,
                    border: Border.all(color: Color(0xffAE0C01), width: 2)),
              ),
              Image.asset(
                'assets/images/giapha.png',
                height: 180,
                width: 115,
                fit: BoxFit.cover,
              ),
              Container(
                  height: 180,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(color: Colors.transparent, spreadRadius: 1),
                    ],
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/thanhvien.jpg'),
                        radius: 32,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        a == 1 ? 'Thủy Tổ' : "Thành viên",
                        style: const TextStyle(
                          color: secondaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text('24/12/1954'),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )),
            ],
          ),
          Column(
            children: [
              a == 1
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Colors.transparent,
                      ))
                  : IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Xóa thành viên ?'),
                                  content: const Text(
                                      'Thành viên sẽ được xóa khỏi cây gia phả'),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffFDF2D7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Center(
                                                      child: Text('Bỏ qua')),
                                                ))),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                graph.removeNode(
                                                    graph.getNodeUsingId(a));
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Container(
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    color: Colors.deepOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Center(
                                                      child: Text(
                                                    'Đồng ý',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ))),
                                      ],
                                    )
                                  ],
                                ));
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: secondaryColor,
                      )),
              IconButton(
                  onPressed: () {
                    final node3 = Node.Id(r.nextInt(900000000));
                    var edge = graph.getNodeUsingId(a);
                    print(edge);
                    graph.addEdge(edge, node3);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: secondaryColor,
                  )),
            ],
          )
        ],
      ),
    );
  }

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    graph.addEdge(node1, node2);

    builder
      ..siblingSeparation = (25)
      ..levelSeparation = (25)
      ..subtreeSeparation = (25)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
