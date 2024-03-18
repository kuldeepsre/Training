import 'package:dreambiztech/bloc/tree_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class TreeView extends StatefulWidget {
  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic TreeView'),
      ),
      body: BlocBuilder<TreeBloc, TreeState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.nodes.length,
            itemBuilder: (context, index) {
              return TreeNodeWidget(node: state.nodes[index]);
            },
          );
        },
      ),
    );
  }
}

class TreeNodeWidget extends StatelessWidget {
  final TreeNode node;

  TreeNodeWidget({required this.node});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(node.label),
      children: node.children
          .map((childNode) => TreeNodeWidget(node: childNode))
          .toList(),
    );
  }
}
