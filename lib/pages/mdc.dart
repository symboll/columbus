
import 'package:flutter/material.dart';

import '/demo/mdc_demo/paginated_data_table_demo.dart';
import '/demo/form_demo/expansion_panel_demo.dart';
import '/demo/form_demo/snackbar_demo.dart';
import '/demo/form_demo/bottom_sheet_demo.dart';
import '/demo/form_demo/alert_dialog_demo.dart';
import '/demo/form_demo/simple_dialog_demo.dart';
import '/demo/form_demo/date_time_demo.dart';
import '/demo/form_demo/slider_demo.dart';
import '/demo/form_demo/switch_demo.dart';
import '/demo/form_demo/radio_demo.dart';
import '/demo/form_demo/checkbox_demo.dart';
import '/demo/form_demo/form.dart';
import '/demo/mdc_demo/popup_menu_demo.dart';
import '/demo/mdc_demo/button_demo.dart';
import '/demo/mdc_demo/floating_action_button_demo.dart';
import '/demo/mdc_demo/chip_demo.dart';
import '/demo/mdc_demo/data_table_demo.dart';
import '/demo/mdc_demo/card_demo.dart';
import '/demo/mdc_demo/stepper_demo.dart';

class MdcPage extends StatelessWidget {
  const MdcPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ListItem(title: "Stepper", page: StepperDemo()),
            const ListItem(title: "Card", page: CardDemo()),
            ListItem(title: "FloatingActionButton", page: FloatingActionButtonDemo()),
            ListItem(title: "Button", page: ButtonDemo()),
            const ListItem(title: "PopupMenu", page: PopupMenuDemo()),
            const ListItem(title: "Form", page: FormPage()),
            const ListItem(title: "Checkbox", page: CheckboxDemo()),
            const ListItem(title: "Radio", page: RadioDemo()),
            const ListItem(title: "Switch", page: SwitchDemo()),
            const ListItem(title: "Slider", page: SliderDemo()),
            const ListItem(title: "DateTime", page: DateTimeDemo()),
            const ListItem(title: "SimpleDialog", page: SimpleDialogDemo()),
            const ListItem(title: "AlertDialog", page: AlertDialogDemo()),
            const ListItem(title: "BottomSheet", page: BottomSheetDemo()),
            const ListItem(title: "SnackBar", page: SnackBarDemo()),
            const ListItem(title: "ExpansionPanel", page: ExpansionPanelDemo()),
            const ListItem(title: "Chip", page: ChipDemo()),
            const ListItem(title: "DataTable", page: DataTableDemo()),
            const ListItem(title: "PaginatedDataTable", page: PaginatedDataTableDemo()),
          ],
        )
      ),
    );
  }
} 

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  const ListItem({ required this.title, required this.page,  Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (content) => page)
        );
      },
    );
  }
}