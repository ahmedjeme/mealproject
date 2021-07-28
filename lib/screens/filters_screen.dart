import 'package:flutter/material.dart';
import 'package:mealproject2/app_bar/app_bar.dart';
import 'package:mealproject2/provider/provider.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  SwitchListTile buildSwitchListTile(
      String title, String description, bool val, Function updatedVal) {
    return SwitchListTile(
      title: Text(title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.bold)),
      subtitle: Text(
        description,
        style: TextStyle(
            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
      value: val,
      onChanged: updatedVal,
    );
  }
  @override
  Widget build(BuildContext context) {
    var filterData = Provider.of<MealsProvider>(context).filters;
    Provider.of<MealsProvider>(context).setFilters(filterData);
    return Scaffold(
      appBar: AppBarComponent().appBar('Filters'),
      body: Column(
        children: [
          buildSwitchListTile(
            'Gluten-free',
            'Only include gluten-free meals',
            filterData['gluten'],
            (val) {
              setState(() {
                filterData['gluten'] = val;
              });
            },
          ),
          buildSwitchListTile(
            'vegetarian-free',
            'Only include vegetarian-free meals',
            filterData['vegetarian'],
            (val) {
              setState(() {
                filterData['vegetarian'] = val;
              });
            },
          ),
          buildSwitchListTile(
            'Vegan',
            'Only include vegan meals',
            filterData['vegan'],
            (val) {
              setState(() {
                filterData['vegan'] = val;
              });
            },
          ),
          buildSwitchListTile(
            'Lactose-free',
            'Only include lactose-free meals',
            filterData['lactoseFree'],
            (val) {
              setState(() {
                filterData['lactoseFree'] = val;
              });
            },
          )
        ],
      ),
    );
  }
}
