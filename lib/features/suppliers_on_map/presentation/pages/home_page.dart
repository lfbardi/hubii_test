import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hubii_test/injection_container.dart';
import '../bloc/bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => get<SuppliersOnMapBloc>(),
      child: BlocBuilder<SuppliersOnMapBloc, SuppliersOnMapState>(
        builder: _buildApp,
      ),
    );
  }

  Widget _buildApp(BuildContext context, SuppliersOnMapState state) {
    final bloc = BlocProvider.of<SuppliersOnMapBloc>(context);

    return Scaffold(
      appBar: AppBar(
        leading: bloc.state is! InitialSuppliersOnMapState
            ? IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => bloc.add(ResetAppEvent()),
              )
            : null,
        title: const Text('Hobii Test'),
        centerTitle: true,
      ),
      body: _buildBody(context, state, bloc),
    );
  }

  _buildBody(
    BuildContext context,
    SuppliersOnMapState state,
    SuppliersOnMapBloc bloc,
  ) {
    if (state is LoadingSuppliersOnMapState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is SuccessLoadingCustomersSuppliersOnMapState) {
      return Column(
        children: [
          const Text(
            'Escolha um cliente',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.customers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  key: Key('$index'),
                  title: Text(state.customers[index].name),
                  onTap: () => bloc.add(FindAllNearSuppliersEvent(
                      customer: state.customers[index])),
                );
              },
            ),
          )
        ],
      );
    } else if (state is SuccessSuppliersOnMapState) {
      return GoogleMap(
        initialCameraPosition: CameraPosition(
          target:
              LatLng(state.customer.address.lat, state.customer.address.long),
          zoom: 13,
        ),
        markers: state.markers,
        myLocationButtonEnabled: false,
      );
    } else if (state is FailureSuppliersOnMapState) {
      return const Center(
        child: Text(
          'Error Page',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return Center(
      child: ElevatedButton(
        child: const Text('Start'),
        onPressed: () => bloc.add(GetAllCustomersEvent()),
      ),
    );
  }
}
