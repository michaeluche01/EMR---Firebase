// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emr_m_app/Pages/registration_sections/reg_stage2.dart';
import 'package:emr_m_app/components/adressform.dart';
import 'package:emr_m_app/components/my_button.dart';
import 'package:emr_m_app/components/my_textfield.dart';
import 'package:emr_m_app/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter an address';
//                 }
//                 return null;
//               },

class RegisterStage1 extends StatefulWidget {
  const RegisterStage1({super.key});

  @override
  State<RegisterStage1> createState() => _RegisterStage1State();
}

final firstnamecontroller = TextEditingController();
final lastnamecontroller = TextEditingController();
final addresscontroller = TextEditingController();

class _RegisterStage1State extends State<RegisterStage1> {
  String? _selectedGender;
  String? _selectedStatus;
  DateTime? _selectedDate;
  String? _selectedNationality = 'Nigerian';
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final List<String> _maritalStatuses = [
    'Single',
    'Married',
    'Divorced',
    'Rather not say',
  ];

  final List<String> _nationalities = [
    'Afghan',
    'Albanian',
    'Algerian',
    'American',
    'Andorran',
    'Angolan',
    'Antiguans',
    'Argentinean',
    'Armenian',
    'Australian',
    'Austrian',
    'Azerbaijani',
    'Bahamian',
    'Bahraini',
    'Bangladeshi',
    'Barbadian',
    'Barbudans',
    'Batswana',
    'Belarusian',
    'Belgian',
    'Belizean',
    'Beninese',
    'Bhutanese',
    'Bolivian',
    'Bosnian',
    'Brazilian',
    'British',
    'Bruneian',
    'Bulgarian',
    'Burkinabe',
    'Burmese',
    'Burundian',
    'Cambodian',
    'Cameroonian',
    'Canadian',
    'Cape Verdean',
    'Central African',
    'Chadian',
    'Chilean',
    'Chinese',
    'Colombian',
    'Comoran',
    'Congolese',
    'Costa Rican',
    'Croatian',
    'Cuban',
    'Cypriot',
    'Czech',
    'Danish',
    'Djibouti',
    'Dominican',
    'Dutch',
    'East Timorese',
    'Ecuadorean',
    'Egyptian',
    'Emirian',
    'Equatorial Guinean',
    'Eritrean',
    'Estonian',
    'Ethiopian',
    'Fijian',
    'Filipino',
    'Finnish',
    'French',
    'Gabonese',
    'Gambian',
    'Georgian',
    'German',
    'Ghanaian',
    'Greek',
    'Grenadian',
    'Guatemalan',
    'Guinea-Bissauan',
    'Guinean',
    'Guyanese',
    'Haitian',
    'Herzegovinian',
    'Honduran',
    'Hungarian',
    'I-Kiribati',
    'Icelander',
    'Indian',
    'Indonesian',
    'Iranian',
    'Iraqi',
    'Irish',
    'Israeli',
    'Italian',
    'Ivorian',
    'Jamaican',
    'Japanese',
    'Jordanian',
    'Kazakhstani',
    'Kenyan',
    'Kittian and Nevisian',
    'Kuwaiti',
    'Kyrgyz',
    'Laotian',
    'Latvian',
    'Lebanese',
    'Liberian',
    'Libyan',
    'Liechtensteiner',
    'Lithuanian',
    'Luxembourger',
    'Macedonian',
    'Malagasy',
    'Malawian',
    'Malaysian',
    'Maldivan',
    'Malian',
    'Maltese',
    'Marshallese',
    'Mauritanian',
    'Mauritian',
    'Mexican',
    'Micronesian',
    'Moldovan',
    'Monacan',
    'Mongolian',
    'Moroccan',
    'Mosotho',
    'Motswana',
    'Mozambican',
    'Namibian',
    'Nauruan',
    'Nepalese',
    'New Zealander',
    'Ni-Vanuatu',
    'Nicaraguan',
    'Nigerian',
    'Nigerien',
    'North Korean',
    'Northern Irish',
    'Norwegian',
    'Omani',
    'Pakistani',
    'Palauan',
    'Panamanian',
    'Papua New Guinean',
    'Paraguayan',
    'Peruvian',
    'Polish',
    'Portuguese',
    'Qatari',
    'Romanian',
    'Russian',
    'Rwandan',
    'Saint Lucian',
    'Salvadoran',
    'Samoan',
    'San Marinese',
    'Sao Tomean',
    'Saudi',
    'Scottish',
    'Senegalese',
    'Serbian',
    'Seychellois',
    'Sierra Leonean',
    'Singaporean',
    'Slovakian',
    'Slovenian',
    'Solomon Islander',
    'Somali',
    'South African',
    'South Korean',
    'Spanish',
    'Sri Lankan',
    'Sudanese',
    'Surinamer',
    'Swazi',
    'Swedish',
    'Swiss',
    'Syrian',
    'Taiwanese',
    'Tajik',
    'Tanzanian',
    'Thai',
    'Togolese',
    'Tongan',
    'Trinidadian or Tobagonian',
    'Tunisian',
    'Turkish',
    'Tuvaluan',
    'Ugandan',
    'Ukrainian',
    'Uruguayan',
    'Uzbekistani',
    'Venezuelan',
    'Vietnamese',
    'Welsh',
    'Yemenite',
    'Zambian',
    'Zimbabwean'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
      context
          .read<RegistrationProvider>()
          .updateDateOfBirth(_dateController.text);
    }
  }

  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedGender = value;
    });
    context.read<RegistrationProvider>().updateGender(value!);
  }

  void _nextPhase() {
    // userData();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterStage2()),
    );
  }

  // final CollectionReference myItems =
  //     FirebaseFirestore.instance.collection("userdata");

  // Future<void> userData() async {
  //   String firstname = firstnamecontroller.text;
  //   String lastname = lastnamecontroller.text;
  //   String address = addresscontroller.text;
  //   String dob = _dateController.text;
  //   final selectedGender = _selectedGender;
  //   final selectedmaritalStatus = _selectedStatus;
  //   final selectnationality = _selectedNationality;

  //   myItems.add({
  //     'First Name': firstname,
  //     'Last Name': lastname,
  //     'Address': address,
  //     'Date of Birth': dob,
  //     'Gender': selectedGender,
  //     'Marital Status': selectedmaritalStatus,
  //     'Nationality': selectnationality,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final registrationProvider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3E8EB),
      ),
      backgroundColor: const Color(0xFFF3E8EB),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "BIO DATA",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                "Click on Next to proceed to the next Registration Phase",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              const SizedBox(height: 50),
              MyTextField(
                hintText: 'First Name',
                controller: firstnamecontroller,
                obscureText: false,
                onChanged: (value) =>
                    registrationProvider.updateFirstName(value),
              ),
              const SizedBox(height: 25),
              MyTextField(
                hintText: 'Last Name',
                controller: lastnamecontroller,
                obscureText: false,
                onChanged: (value) =>
                    registrationProvider.updateLastName(value),
              ),
              const SizedBox(height: 20),
              AddressForm(
                addresscontroller: addresscontroller,
                onChanged: (value) => registrationProvider.updateAddress(value),
              ),
              const SizedBox(height: 20),
              dateofBirth(context),
              const SizedBox(height: 20),
              genderSelection(),
              const SizedBox(height: 20),
              maritalStatusDropdown(),
              const SizedBox(height: 20),
              nationalityselection(),
              MyButton(
                buttonName: 'Next',
                onTap: _nextPhase,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Date of birth Method
  Padding dateofBirth(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          TextField(
            style: const TextStyle(fontSize: 15),
            controller: _dateController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey.shade300,
              filled: true,
              icon: const Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              hintText: "Date of Birth",
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey[500],
              ),
            ),
            readOnly: true,
            onTap: () {
              _selectDate(context);
            },
          ),
          // const SizedBox(height: 10),
          // if (_selectedDate != null)
          //   Text("Selected Date: ${_selectedDate!.toLocal()}".split(' ')[0]),
        ],
      ),
    );
  }

  //Gender method
  Padding genderSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(
            child: Text(
              'Select your Gender:',
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Male',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  leading: Radio<String>(
                    value: "Male",
                    groupValue: _selectedGender,
                    onChanged: _handleRadioValueChange,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  leading: Radio<String>(
                    value: "Female",
                    groupValue: _selectedGender,
                    onChanged: _handleRadioValueChange,
                  ),
                ),
              ),
            ],
          ),
          // if (_selectedGender != null)
          //   Text(
          //       "Selected Gender: ${_selectedGender == Gender.male ? "Male" : "Female"}"),
        ],
      ),
    );
  }

  //marital Status Drop down list
  Column maritalStatusDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Select your Marital Status:',
          style: TextStyle(fontSize: 15.0),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: DropdownButton<String>(
            dropdownColor: const Color(0xFFF3E8EB),
            value: _selectedStatus,
            hint: const Text('Select Status'),
            onChanged: (String? newValue) {
              setState(() {
                _selectedStatus = newValue;
              });
              context
                  .read<RegistrationProvider>()
                  .updateMaritalStatus(newValue!);
            },
            items:
                _maritalStatuses.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        // SizedBox(height: 20),
        // if (_selectedStatus != null)
        //   Text("Selected Marital Status: $_selectedStatus"),
      ],
    );
  }

  //nationality
  Column nationalityselection() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Center(
          child: Text(
            'Select your Nationality:',
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: DropdownButton<String>(
            dropdownColor: const Color(0xFFF3E8EB),
            value: _selectedNationality,
            hint: const Text('Select Nationality'),
            onChanged: (String? newValue) {
              setState(() {
                _selectedNationality = newValue;
              });
              context.read<RegistrationProvider>().updateNationality(newValue!);
            },
            items: _nationalities.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        // const SizedBox(height: 20),
        // if (_selectedNationality != null)
        //   Text("Selected Nationality: $_selectedNationality"),
      ],
    );
  }
}
