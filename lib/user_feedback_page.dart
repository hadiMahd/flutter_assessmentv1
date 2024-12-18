import 'package:flutter/material.dart';

class UserFeedbackPage extends StatefulWidget {
  @override
  _UserFeedbackPageState createState() => _UserFeedbackPageState();
}

class _UserFeedbackPageState extends State<UserFeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _gender = '';
  String _preferredContact = 'Email';
  bool _subscribeToNews = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String subscription = _subscribeToNews ? 'Yes' : 'No';

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Form Submitted'),
          content: Text(
              'Name: $name\n'
                  'Email: $email\n'
                  'Gender: $_gender\n'
                  'Preferred Contact Method: $_preferredContact\n'
                  'Subscribe to Newsletter: $subscription'
          ),
        ),
      );
    }
  }

  void _clear() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    setState(() {
      _gender = '';
      _preferredContact = 'Email';
      _subscribeToNews = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'A Simple Contact Form',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 12,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 18.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Text('Gender:'),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Male',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value.toString();
                            });
                          },
                        ),
                        Text('Male'),
                      ],
                    ),
                    SizedBox(width: 18.0),
                    Row(
                      children: [
                        Radio(
                          value: 'Female',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value.toString();
                            });
                          },
                        ),
                        Text('Female'),
                      ],
                    ),
                    SizedBox(width: 18.0),
                    Row(
                      children: [
                        Radio(
                          value: 'Other',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value.toString();
                            });
                          },
                        ),
                        Text('Other'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18.0),
                DropdownButtonFormField(
                  value: _preferredContact,
                  decoration: InputDecoration(
                    labelText: 'Preferred Contact Method',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  items: ['Email', 'Phone', 'SMS']
                      .map((method) => DropdownMenuItem(
                    value: method,
                    child: Text(method),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _preferredContact = value.toString();
                    });
                  },
                ),
                SizedBox(height: 18.0),
                Row(
                  children: [
                    Checkbox(
                      value: _subscribeToNews,
                      onChanged: (value) {
                        setState(() {
                          _subscribeToNews = value!;
                        });
                      },
                    ),
                    Text('Subscribe to newsletter'),
                  ],
                ),
                SizedBox(height: 18.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _submit,
                      child: Row(
                        children: [
                          Icon(Icons.check),
                          SizedBox(width: 8),
                          Text('Submit'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _clear,
                      child: Row(
                        children: [
                          Icon(Icons.close),
                          SizedBox(width: 8),
                          Text('Clear'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}