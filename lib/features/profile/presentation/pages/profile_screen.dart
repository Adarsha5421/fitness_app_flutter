import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController usernameController = TextEditingController(text: "Sand");
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String selectedGoal = "Maintain";
  File? profileImage;

  /// **Pick Image from Gallery**
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  /// **Call API to Update Profile**
  void updateProfile() {
    final String username = usernameController.text;
    final String age = ageController.text;
    final String weight = weightController.text;
    final String height = heightController.text;

    if (username.isEmpty || age.isEmpty || weight.isEmpty || height.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields!")),
      );
      return;
    }

    // Example API call
    print("Updating Profile with:");
    print("Username: $username, Age: $age, Weight: $weight, Height: $height, Goal: $selectedGoal");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Updated!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.brightness == Brightness.dark ? Colors.redAccent : Colors.red;
    final fieldColor = theme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white;
    final textColor = theme.brightness == Brightness.dark ? Colors.yellowAccent : Colors.yellow;

    return Scaffold(
      backgroundColor: theme.brightness == Brightness.dark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text("Your Profile"),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Image Section
              GestureDetector(
                onTap: pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.red,
                  backgroundImage: profileImage != null ? FileImage(profileImage!) : null,
                  child: profileImage == null ? const Icon(Icons.camera_alt, color: Colors.white, size: 40) : null,
                ),
              ),
              const SizedBox(height: 10),
              Text(usernameController.text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),

              const SizedBox(height: 20),
              _buildTextField("Username", usernameController),
              _buildTextField("Age", ageController, isNumber: true),
              _buildTextField("Weight (kg)", weightController, isNumber: true),
              _buildTextField("Height (cm)", heightController, isNumber: true),

              // Fitness Goal Dropdown
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButtonFormField<String>(
                  value: selectedGoal,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: fieldColor,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  items: ["Lose Weight", "Gain Muscle", "Maintain"].map((goal) {
                    return DropdownMenuItem(value: goal, child: Text(goal));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedGoal = value);
                    }
                  },
                ),
              ),

              // Update Profile Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: updateProfile,
                  child: const Text("Update Profile", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// **Reusable TextField Widget**
  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          // fillColor: Colors.grey[900],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
