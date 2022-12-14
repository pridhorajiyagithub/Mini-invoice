import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constatnt/Global.dart';

class YourDetails extends StatefulWidget {
  const YourDetails({Key? key}) : super(key: key);

  @override
  State<YourDetails> createState() => _YourDetailsState();
}

class _YourDetailsState extends State<YourDetails> {
  final ImagePicker _picker = ImagePicker();

  TextStyle tStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  final GlobalKey<FormState> your_details_formkey = GlobalKey<FormState>();
  final TextEditingController business_Name_controller =
      TextEditingController();
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController phone_controller = TextEditingController();
  final TextEditingController address_controller = TextEditingController();

  InputDecoration textFormFieldDeco = InputDecoration(
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
    focusColor: AppColors.secondaryColor,
    hintStyle: const TextStyle(
        color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
    hintText: "",
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(4.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondaryColor, width: 0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "New Business",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
          child: Form(
            key: your_details_formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Business Name",
                  style: tStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your business name first....";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.business_name = val;
                    });
                  },
                  cursorColor: AppColors.primaryColor,
                  controller: business_Name_controller,
                  decoration: textFormFieldDeco,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Email address",
                  style: tStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your email first....";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.email = val;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppColors.primaryColor,
                  controller: email_controller,
                  decoration: textFormFieldDeco,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Phone number",
                  style: tStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your phone number first....";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.phone = val;
                    });
                  },
                  keyboardType: TextInputType.phone,
                  cursorColor: AppColors.primaryColor,
                  controller: phone_controller,
                  decoration: textFormFieldDeco,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Address",
                  style: tStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your address first....";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.address = val;
                    });
                  },
                  cursorColor: AppColors.primaryColor,
                  controller: address_controller,
                  decoration: textFormFieldDeco,
                ),
                const SizedBox(
                  height: 10,
                ),
                //
                InkWell(
                  onTap: () async {
                    XFile? pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      Global.image = File(pickedFile!.path);
                    });
                  },
                  child: Center(
                    child: DottedBorder(
                      color: AppColors.primaryColor,
                      borderType: BorderType.Circle,
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: (Global.image != null)
                            ? Image.file(
                                Global.image!,
                                fit: BoxFit.cover,
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Add your Logo",
                                    style: tStyle,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                //
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const BeveledRectangleBorder(),
                            primary: AppColors.primaryColor,
                            padding: const EdgeInsets.all(10.0)),
                        onPressed: () {
                          if (your_details_formkey.currentState!.validate()) {
                            your_details_formkey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  const Text("All data successfully  saved..."),
                              backgroundColor: AppColors.primaryColor,
                              behavior: SnackBarBehavior.floating,
                            ));
                          }
                        },
                        child: const Text(
                          "SAVE",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    /* Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: AppColors.primaryColor,
                            padding: const EdgeInsets.all(10.0)),
                        onPressed: () {
                          your_details_formkey.currentState!.reset();
                          business_Name_controller.clear();
                          email_controller.clear();
                          phone_controller.clear();
                          address_controller.clear();

                          setState(() {
                            Global.business_name = "";
                            Global.email = "";
                            Global.phone = "";
                            Global.address = "";
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                const Text("All data successfully cleared..."),
                            backgroundColor: AppColors.primaryColor,
                            behavior: SnackBarBehavior.floating,
                          ));
                        },
                        child: const Text(
                          "CLEAR",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),*/
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
