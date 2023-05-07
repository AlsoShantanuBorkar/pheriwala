import 'package:be_project/app_text_styles.dart';
import 'package:be_project/models/vendor_model.dart';
import 'package:be_project/providers/user_data_provider.dart';
import 'package:be_project/widgets/custom/custom_app_bar.dart';
import 'package:be_project/widgets/cards/vendor_card.dart';
import 'package:flutter/material.dart';

class SearchVendorScreem extends StatefulWidget {
  const SearchVendorScreem({super.key, required this.userDataProvider});
  final UserDataProvider userDataProvider;

  @override
  State<SearchVendorScreem> createState() => _SearchVendorScreemState();
}

class _SearchVendorScreemState extends State<SearchVendorScreem> {
  final List<Widget> fruits = <Widget>[
    const Text('Vendor'),
    const Text('Location'),
    const Text('Distance')
  ];

  int selectedIndex = 0;
  final List<bool> _selectedFruits = <bool>[true, false, false];

  final TextEditingController _searchController = TextEditingController();

  List<VendorCard> searchList = [];

  void search(String query) {
    List<VendorModel> list = widget.userDataProvider.vendors
        .where(
          (element) => selectedIndex == 0
              ? element.shopname!.toLowerCase().contains(query.toLowerCase())
              : selectedIndex == 1
                  ? element.location!
                      .toLowerCase()
                      .contains(query.toLowerCase())
                  : element.distancefromuser! < int.parse(query),
        )
        .toList();
    setState(
      () {
        searchList = List<VendorCard>.from(
          list.map(
            (e) => VendorCard(vendorModel: e),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: "Search Vendors",
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selectedFruits.length; i++) {
                    _selectedFruits[i] = i == index;
                    selectedIndex = index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.green[700],
              selectedColor: Colors.white,
              fillColor: Colors.green[200],
              color: Colors.green[400],
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedFruits,
              children: fruits,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                keyboardType: selectedIndex == 0 || selectedIndex == 1
                    ? TextInputType.text
                    : TextInputType.number,
                controller: _searchController,
                onChanged: (value) => search(value),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          _searchController.text.isEmpty
              ? Center(
                  child: Text(
                    "Enter Your Query!",
                    style: AppTextStyles.lato20Black500,
                  ),
                )
              : searchList.isEmpty
                  ? Center(
                      child: Text(
                        "No Matches Found!",
                        style: AppTextStyles.lato20Black500,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: searchList.length,
                      itemBuilder: (context, index) => searchList[index],
                    )
        ],
      ),
    );
  }
}
