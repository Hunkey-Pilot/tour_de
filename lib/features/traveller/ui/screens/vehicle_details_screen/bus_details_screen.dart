import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tour_de/app/app_colors.dart';
import 'package:tour_de/features/common/widget/app_logo.dart';
import 'package:tour_de/features/common/widget/show_snack_bar_message.dart';

class BusDetailsScreen extends StatefulWidget {
  const BusDetailsScreen({super.key});

  static final String name = '/bus-details';

  @override
  State<BusDetailsScreen> createState() => _BusDetailsScreenState();
}

class _BusDetailsScreenState extends State<BusDetailsScreen> {
  final _fromPlaceList = [
    "From",
    "Cox's Bazar",
    "Dhaka",
    "Rangamati",
    "Rangpur",
    "Gabtoli",
    "Sylhet"
  ];
  final _toPlaceList = [
    "To",
    "Cox's Bazar",
    "Dhaka",
    "Rangamati",
    "Rangpur",
    "Gabtoli",
    "Sylhet"
  ];

  String? _fromDestination;
  String? _toDestination;
  DateTime _selectedDate = DateTime(2025, 8, 9);

  @override
  void initState() {
    super.initState();
    _fromDestination = _fromPlaceList[0];
    _toDestination = _toPlaceList[0];
  }

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      appBar: AppBar(
        title: const Text("Bus Booking"),
        titleSpacing: 1.2,
      ),
      body: Column(
        children: [
          Center(child: AppLogo(height: 250)),
          Card(
            child: Column(
              children: [
                _getPlaceDropDown(
                  value: _fromDestination,
                  onChanged: (val) => setState(() => _fromDestination = val),
                  options: _fromPlaceList,
                ),
                _getPlaceDropDown(
                  value: _toDestination,
                  onChanged: (val) => setState(() => _toDestination = val),
                  options: _toPlaceList,
                ),
                _getDatePickerField(context),
                SizedBox(height: 70,),
                ElevatedButton(onPressed: _onTapSearchButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white
                ), child:
                Text("SEARCH",style: TextStyle(
                  fontSize: 24
                ),),
                ),
                SizedBox(height: 60,)

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPlaceDropDown({
    required String? value,
    required List<String> options,
    required void Function(String?) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: options.map(buildMenuItem).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String place) => DropdownMenuItem(
    value: place,
    child: Text(place),
  );

  Widget _getDatePickerField(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDate(context),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                DateFormat('dd MMMM yyyy').format(_selectedDate),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
  void _onTapSearchButton(){
     if(_fromDestination == 'From' || _toDestination == "To"){
       showSnackBarMessage(context, "Enter Valid Location");
     } else if(_fromDestination == _toDestination){
       showSnackBarMessage(context, "Choose Different places");
     }
  }
}
