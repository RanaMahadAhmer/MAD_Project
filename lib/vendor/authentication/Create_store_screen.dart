import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';


import '../../views/screens/widgets/button_widget.dart';
import '../../views/screens/widgets/custom_text_Field.dart';


class CreateStoreScreen extends StatefulWidget {
  const CreateStoreScreen({super.key});

  @override
  State<CreateStoreScreen> createState() => _CreateStoreScreenState();
}

class _CreateStoreScreenState extends State<CreateStoreScreen>
    with TickerProviderStateMixin {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late AnimationController _formController;
  late Animation<Offset> _slideAnimation;
  String? _selectedCategory;
  late String description;
  bool _isLoading = false;

  List<String> _categoryList = [];
  Uint8List? _image;



  @override
  void initState() {

    super.initState();
    _formController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _formController,
      curve: Curves.easeOut,
    ));
    _formController.forward();
  }



  Widget buildDropdownField(String labelText) {
    return DropdownButtonFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'enter category';
        } else {
          return null;
        }
      },
      value: _selectedCategory,
      onChanged: (String? value) {
        if (value != null) {
          setState(() {
            _selectedCategory = value;
          });
        }
      },
      items: _categoryList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        labelText: labelText,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withValues(alpha: 0.95),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Your Store\n Reach Your Customers',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.6,
                    ),
                  ),
                  Text(
                    'We Will Help You Sell Your Products',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.7,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Add Store Image',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  TextFormField(
                    onTap: () {


                    },
                    decoration: InputDecoration(
                        prefixIcon: _image != null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      9,
                                    ),
                                    child: Image.memory(
                                      _image!,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              )
                            : const Icon(
                                CupertinoIcons.photo,
                              ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        labelText: _image != null
                            ? "Store Logo Selected"
                            : 'Select Your Store Logo',
                        suffixIcon: const Icon(
                          CupertinoIcons.down_arrow,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'About Your Bussiness',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _slideAnimation,
                    child: CustomTextField(
                      label: 'Write about your shop',
                      prefixIcon: const Icon(
                        Icons.store,
                      ),
                      text: 'Write about your shop',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter about your shop';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Area of Specialization',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  buildDropdownField('category'),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidgets(
                buttonChange: () async {

                },
                isLoading: _isLoading ? true : false,
                buttonTitle: 'Create Store')
          ],
        ),
      ),
    );
  }
}
