// my_widget.dart

import 'package:dreambiztech/bloc/CartEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Connectivity Check'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Dispatch the CheckConnectivityEvent to the CartBloc
                context.read<CartBloc>().add(CheckConnectivityEvent());
              },
              child: const Text('Check Connectivity'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state.isNetworkConnected) {
                  return const Text('Connected to the network');
                } else {
                  return const Text('Not connected to the network');
                }
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state.isWifiConnected) {
                  return const Text('Connected to Wi-Fi');
                } else {
                  return const Text('Not connected to Wi-Fi');
                }
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state.isMobileDataConnected) {
                  return const Text('Connected to mobile data');
                } else {
                  return const Text('Not connected to mobile data');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
