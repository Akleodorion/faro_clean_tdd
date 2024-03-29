import 'package:faro_clean_tdd/core/util/general_spacers.dart';
import 'package:faro_clean_tdd/features/events/domain/entities/event.dart';
import 'package:faro_clean_tdd/features/tickets/presentation/pages/ticket_payment_page/widgets/tickets_checkout_layout.dart';
import 'package:flutter/material.dart';

class TicketPaymentPage extends StatelessWidget {
  const TicketPaymentPage({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Achetez vos tickets"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(42, 43, 42, 1),
              Color.fromRGBO(42, 43, 42, 0.2),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: GeneralSpacers().getMainColumnPadding(context),
              vertical: GeneralSpacers().getMainColumnPadding(context)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                event.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: GeneralSpacers().getBlocSeparation(context),
              ),
              TicketsCheckoutLayout(
                event: event,
                isFree: event.modelEco == ModelEco.gratuit ? true : false,
                isGoldTicketPresent:
                    event.goldTicketPrice == null ? false : true,
                isPlatinumTicketPresent:
                    event.platinumTicketPrice == null ? false : true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
