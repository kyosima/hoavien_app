import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:hoavien_app/constance.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class GenealoryDetailPage extends StatefulWidget {
  @override
  _TreeViewPageState createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<GenealoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFDF2D7),
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  print(graph.toJson());
                },
                child: Text(
                  'Lưu gia phả',
                  style: TextStyle(color: Colors.brown),
                ))
          ],
          centerTitle: false,
          elevation: 0,
          iconTheme: IconThemeData(
            color: secondaryColor,
          ),
          backgroundColor: primaryColor,
          title: CustomTitleText(
            title: 'Họ Trần',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: InteractiveViewer(
                      constrained: false,
                      boundaryMargin: EdgeInsets.all(100),
                      minScale: 0.01,
                      maxScale: 2.6,
                      child: GraphView(
                        graph: graph,
                        algorithm: BuchheimWalkerAlgorithm(
                            builder, TreeEdgeRenderer(builder)),
                        paint: Paint()
                          ..color = Color(0xffAE0C01)
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
                      icon: Icon(
                        Icons.start,
                        color: Colors.transparent,
                      ))
                  : IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.start,
                        color: Colors.transparent,
                      )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.start,
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
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(color: Colors.transparent, spreadRadius: 1),
                    ],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/thanhvien.jpg'),
                        radius: 32,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        a == 1 ? 'Thủy Tổ' : "Thành viên",
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('24/12/1954'),
                      SizedBox(
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
                      icon: Icon(
                        Icons.start,
                        color: Colors.transparent,
                      ))
                  : IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => new AlertDialog(
                                  title: new Text('Xóa thành viên ?'),
                                  content: new Text(
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
                                                    color: Color(0xffFDF2D7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
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
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
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
                      icon: Icon(
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
                  icon: Icon(
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
