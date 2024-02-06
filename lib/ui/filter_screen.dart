import 'package:dreambiztech/bloc/filter_bloc.dart';
import 'package:dreambiztech/json_dummy_data/caliing_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderListWidget extends StatefulWidget {


  @override
  _OrderListWidgetState createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  final OrderBloc _orderBloc = OrderBloc();

  @override
  void initState() {
    super.initState();
    _orderBloc.loadItemsFromJson();
  }

  @override
  void dispose() {
    _orderBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter & Order List'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (query) {
              _orderBloc.updateFilterQuery(query);
            },
            decoration: InputDecoration(labelText: 'Filter'),
          ),
          StreamBuilder<bool>(
            stream: _orderBloc.sortOrderStream,
            builder: (context, snapshot) {
              bool sortOrder = snapshot.data ?? true; // Default to ascending
              return ElevatedButton(
                onPressed: () {
                  _orderBloc.toggleSortOrder();
                },
                child: Text(sortOrder ? 'Sort Ascending' : 'Sort Descending'),
              );
            },
          ),
          StreamBuilder<List<Item>>(
            stream: _orderBloc.orderedListStream,
            builder: (context, snapshot) {
              List<Item> orderedList = snapshot.data ?? [];
              return Expanded(
                child: ListView.builder(
                  itemCount: orderedList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item ${orderedList[index].id}: ${orderedList[index].name}'),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}