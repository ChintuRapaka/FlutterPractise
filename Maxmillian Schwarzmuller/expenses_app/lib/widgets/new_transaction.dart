import "package:flutter/material.dart";
import "package:intl/intl.dart";

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _selectedDate == null
                        ? "No date Chosen"
                        : DateFormat.yMMMd().format(_selectedDate!),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      child: Text(
                        "Choose date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
                child: Text("Add Expense"),
                onPressed: _submitData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
