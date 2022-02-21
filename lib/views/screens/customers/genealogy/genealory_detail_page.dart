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
                          ..strokeWidth = 3
                          ..style = PaintingStyle.stroke,
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
                        'Trần Văn A ${a}',
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
                        setState(() {
                          graph.removeNode(Node.Id(a));
                        });
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        color: secondaryColor,
                      )),
              IconButton(
                  onPressed: () {
                    final node12 = Node.Id(r.nextInt(100));
                    var edge = graph.getNodeUsingId(a);
                    print(edge);
                    graph.addEdge(edge, node12);
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
      ..siblingSeparation = (30)
      ..levelSeparation = (30)
      ..subtreeSeparation = (30)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
}
