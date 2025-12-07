import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/loading_widgets.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/address/cubit/address_cubit.dart';
import 'package:ecommerce_app/features/address/widgets/address_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            const HeightSpace(20),
            Text("Saved Address", style: AppStyles.black15BoldStyle),
            const HeightSpace(24),
            Expanded(
              child: BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) {
                  if (state is AddressLoading) {
                    return const Center(
                        child: LoadingWidgets(
                      width: 300,
                      height: 300,
                    ));
                  }
                  if (state is AddressLoaded) {
                    return SingleChildScrollView(
                      child: AddressItemWidget(
                        address:
                            "${state.addressModel.address?.street ?? ''}, ${state.addressModel.address?.city ?? ''}",
                        addressDetails:
                            "${state.addressModel.email ?? 'No email'}",
                      ),
                    );
                  } else {
                    return const Center(child: Text("Something went wrong"));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
