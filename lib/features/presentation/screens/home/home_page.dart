import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/offer_bloc/offer_bloc.dart';
import 'widgets/offer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _fetchOffers() {
    BlocProvider.of<OfferBloc>(context).add(GetOfferEvent());
  }

  @override
  void initState() {
    _fetchOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers'),
      ),
      body: BlocBuilder<OfferBloc, OfferState>(builder: (context, state) {
        switch (state.status) {
          case OfferStatus.initial:
          case OfferStatus.loading:
            return Center(child: CircularProgressIndicator());
          case OfferStatus.error:
            return Center(child: Text(state.errorMsg!));
          case OfferStatus.loaded:
            final offers = state.offer;
            return OfferWidget(state: state, offers: offers!);
        }
      }),
    );
  }
}
