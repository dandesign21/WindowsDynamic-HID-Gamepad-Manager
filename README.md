# WindowsDynamic-HID-Gamepad-Manager

A PowerShell script that dynamically manages and customizes the activation order of HID-compliant game controllers in Windows.

## Features

- Lists active HID-compliant game controllers
- Allows custom activation order for player assignments
- Bilingual support (English/Spanish)
- User-friendly wizard interface
- Automatic device reordering

## Requirements

- Windows operating system
- PowerShell 5.0 or later
- Administrator privileges
- HID-compliant game controllers

## Quick Start

1. Download `OrdenControladores.ps1`
2. Right-click the script and select "Run with PowerShell (Admin)"
3. Select your language (English/Spanish)
4. Follow the on-screen instructions to reorder your controllers

## Usage Example

```powershell
PS C:\> .\OrdenControladores.ps1

Select language: 1 for English, 2 for Spanish.
Selecciona idioma: 1 para Ingles, 2 para Espanol.
Enter your choice: 1

Detected active devices:
1. HID-compliant game controller (Controller 1)
2. HID-compliant game controller (Controller 2)

Enter the desired order (for example, 2,1): 2,1

Disabling all devices...
Enabling devices in the specified order...
Enabled: Controller 2 as Player 1
Enabled: Controller 1 as Player 2

Configuration completed!

## How It Works

1. Device Detection: The script scans for active HID-compliant game controllers
2. User Input: You specify the desired controller order
3. Reordering Process:
  * Temporarily disables all controllers
  * Re-enables them in your specified order
  * Windows assigns player numbers based on activation order

## Troubleshooting

* Make sure to run the script as Administrator
* All controllers should be connected and recognized by Windows
* If a controller is not detected, try disconnecting and reconnecting it
* Ensure controllers are HID-compliant

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Feel free to:
* Report bugs
* Suggest improvements
* Submit pull requests

## Acknowledgments

* PowerShell PnP module for device management capabilities
* Gaming community for inspiration

## Contact

If you have questions or feedback, please:
* Open an issue on GitHub
* Submit a pull request

---
Made for the gaming community
