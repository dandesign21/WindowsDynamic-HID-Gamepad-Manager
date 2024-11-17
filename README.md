# WindowsDynamic-HID-Gamepad-Manager
A PowerShell script to dynamically manage and customize the activation order of HID-compliant game controllers. Designed for ease of use, it lists active devices, allows user-defined activation sequences, and supports multi-language instructions (English and Spanish)

# Dynamic HID Gamepad Manager

A PowerShell script to dynamically manage and customize the activation order of HID-compliant game controllers. This script lists active devices, allows user-defined activation sequences, and ensures a simple, user-friendly experience. Designed with multi-language support (English and Spanish).

## Features

- **Dynamic Device Management**: Lists only active HID-compliant game controllers.
- **Custom Activation Order**: Choose the order in which devices are enabled, ensuring Player 1, Player 2, etc., are set according to your preferences.
- **Multi-Language Instructions**: The script supports both English and Spanish instructions.
- **User-Friendly Wizard**: Provides step-by-step guidance to help you configure your devices with ease.

## How to Use

1. **Download the Script**  
   Save the `OrdenControladores.ps1` file to your computer.

2. **Run the Script**  
   Open PowerShell as an administrator and navigate to the directory where the file is located. Execute the script with:
   ```powershell
   .\OrdenControladores.ps1

Follow the Instructions

Select your preferred language (English or Spanish).
Review the list of active devices.
Enter the desired activation order (e.g., 3,1,2 to enable the third device as Player 1, the first as Player 2, and so on).
Let the Script Do the Work
The script will disable all devices first and then re-enable them in the specified order.

Example Output

Select language: 1 for English, 2 for Spanish.
1
Detected active devices:
1. HID-compliant game controller - HID\VID_1234&PID_5678...
2. HID-compliant game controller - HID\VID_8765&PID_4321...
Enter the order in which you want to enable the devices, separated by commas.
Example: 2,1
2,1
Disabling all devices...
Enabling devices in the specified order...
Enabled: HID-compliant game controller
Enabled: HID-compliant game controller
Configuration completed. Devices are now enabled in the specified order.

Requirements
PowerShell: This script requires PowerShell 5.0 or later.
Administrator Privileges: The script needs to run with admin rights to manage device settings.
Notes
Ensure all devices you wish to manage are connected and active before running the script.
This script is designed for HID-compliant game controllers but can be adjusted for other HID devices.
Modifications and improvements are welcome!
License
This project is licensed under the MIT License. See the LICENSE file for details.

Contributing
Contributions are welcome! Feel free to open issues or submit pull requests to improve the script or add new features.
