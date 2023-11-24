import 'package:bank_genie_task/presentation/authentication/widgets/office_list_appbar.dart';
import 'package:bank_genie_task/domain/office/entity/office_data.dart';
import 'package:bank_genie_task/presentation/office_list/office_cubit/office_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfficeListScreen extends StatefulWidget {
  const OfficeListScreen({super.key});
  static const routeName = '/office_list';

  @override
  State<OfficeListScreen> createState() => _OfficeListScreenState();
}

class _OfficeListScreenState extends State<OfficeListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OfficeCubit>().getAllOffices();
  }
  @override
  Widget build(BuildContext context) {
    Iterable<OfficeData> officeList = [];
    final screenSize = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: const OfficeListAppBar(),
        body: BlocBuilder<OfficeCubit, OfficeState>(
          builder: (_, state) {
            if (state is OfficeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is OfficeLoaded){
              officeList = state.offices;
            }

            return screenSize < 600 
              ? _listView(officeList)
              : _paginatedTable(officeList);
          },
        ),         
      );
  }

  ListView _listView(Iterable<OfficeData> officeList) {
    return ListView.builder(
      itemCount: officeList.length,
      itemBuilder: (context, index) {
        final o = officeList.elementAt(index);
        return ListTile(
          title: Text(o.name),
          subtitle: Text('Opened on: ${o.openingDate.join('/')}'),
          onTap: () {
            
          },
        );
      },
    );
  }

  Widget _paginatedTable(Iterable<OfficeData> officeList) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PaginatedDataTable(
        columns: const [
          DataColumn(label: Text('Office Name')),
          DataColumn(label: Text('External Id')),
          DataColumn(label: Text('Parent Office')),
          DataColumn(label: Text('Opened On')),
        ],
        source: _OfficeDataSource(officeList),
      ),
    );
  }
  
}

class _OfficeDataSource extends DataTableSource {
  _OfficeDataSource(this._officeList);

  final Iterable<OfficeData> _officeList;

  @override
  DataRow getRow(int index) {
    final office = _officeList.elementAt(index);
    return DataRow(
      cells: [
        DataCell(Text(office.name)),
        DataCell(Text(office.externalId ?? '')),
        DataCell(Text(office.nameDecorated)),
        DataCell(Text(office.openingDate.join('/'))),
      ],
    );
  }

  @override
  int get rowCount => _officeList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
