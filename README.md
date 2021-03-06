# Microsoft Mobile ARM64 Windows Driver pack
## For Lumia 950 (incomplete), Lumia 950 XL, RX-130/id330-1 (EB0.X/EB1.X/EB2.X)

![Devices](banner.png)

This pack is a work in progress and may be getting updates at a later time.

If you are deploying this driver pack using WOA Deployer for Lumia, make sure WOA Deployer version is greater or equal than 2.5.

## Copryright, License, Disclaimers and end of user license agreement

**Below notice must be present in all redistributed portions of this software**

- By installing this driver pack, you agree that any damage done to your phone or any loss of data is your entire responsibility and we cannot be taken responsible for data loss if it ever happens. We believe however this driver pack is safe to install. Try at your own risk!

- Charging an extra fee for a phone where you would have installed those drivers and you are selling online or to users is immoral and illegal due to where those drivers come from. An end user may not know how to update their system in the future and will most likely spent a lot more than what it should have for a driver pack he can find for free online. Selling a device with an extra fee also ruins the work of others that worked on this project. While we can't enforce this policy, we decided to put this notice here in the hopes of some people understanding the morality of this.

**Contributors**

We would like to thank the following people that helped:

- ADeltaX
- Googulator
- gus33000
- imbushuo
- @never_released
- Heathcliff74 for WPInternals
- Our friends in China that worked hard to bring the Hapanero ARM64 firmware into the public
  and that provided test hardware for us.
- Our testers, you know who you are :)
- The Windows RT Lumia projects
- Qualcomm and Microsoft
- and many other friends and contacts which would be too long to list here

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Project Status

The following items are not functional yet on specific devices, reason when available is specified:

Hapanero:

- Fingerprint reader (missing drivers)
- Cameras (missing drivers)
- Any kind of sensor (except ALS)
- Audio volume control for Speakers (stuck at 100%)
- Vibration motor
- x86 DirectX support is missing.
- FM Radio

Hapanero (EB0.x and EB1.x):

- GPU and display
- Fingerprint reader (missing drivers)
- Cameras (missing drivers)
- Any kind of sensor (except ALS)
- Audio
- Microphones
- Shutdown (Reboots instead)
- Vibration motor
- Cellular
- FM Radio

Cityman:

- Iris biometric sensor (missing drivers)
- Cameras (missing drivers)
- Any kind of sensor (except ALS)
- Audio volume control for Speakers (stuck at 100%)
- Vibration motor
- HDMI out via USB-C
- x86 DirectX support is missing.
- Cellular (No Nokia Security Simlock support for retail devices, disable halt_subscription feature on engineering modems)
- FM Radio

Talkman:

- PEP (root cause of every difference with other devices right now)
- GPU
- Iris biometric sensor (missing drivers)
- Cameras (missing drivers)
- Any kind of sensor (except ALS)
- Audio
- Microphones
- Vibration motor
- WLAN (requires PEP)
- HDMI out via USB-C
- Cellular
- FM Radio

## Readme

### Packages

Packages below are 'cumulative', you can stack them if applicable.

- For Qualcomm Snapdragon 810 devices, install everything under MSM8994
- For Qualcomm Snapdragon 810 (Rev 1) devices, install everything under MSM8994AA
- For Qualcomm Snapdragon 808 devices, install everything under MSM8992

---

- For Microsoft Mobile Oy Devices, install everything under Device Specifics\MMO

---

- For Microsoft Lumia 950 XL Devices, install everything under Device Specifics\Cityman\Common
- For Microsoft Lumia 950 Devices, install everything under Device Specifics\Talkman\Common

---

- For Microsoft Lumia 950 XL Single SIM Devices, install everything under Device Specifics\Cityman\SingleSIM
- For Microsoft Lumia 950 XL Dual SIM Devices, install everything under Device Specifics\Cityman\DualSIM

---

- For Microsoft Lumia 950 Single SIM Devices, install everything under Device Specifics\Talkman\SingleSIM
- For Microsoft Lumia 950 Dual SIM Devices, install everything under Device Specifics\Talkman\DualSIM

---

- For Microsoft Hapanero EB2.0+ Devices running Qualcomm UEFI, install everything under Device Specifics\Hapanero\QcomPkg
- For Microsoft Hapanero EB2.0+ Devices running Lumia950XlPkg UEFI, install everything under Device Specifics\Hapanero\Lumia950XlPkg
- For Microsoft Hapanero EB0.5+ (< EB2.0) Devices running Qualcomm UEFI, install everything under Device Specifics\Hapanero\EB1

---

### Notes

- To install drivers, you'll need to follow the usual Dism procedure before first boot of the operating system.
  ie: Dism /Image:DriveLetterOfOS /Add-Driver /Driver:PathToDeviceFolder\Pre-OOBE /Recurse
  nointegritychecks and testsigning must be enabled in the OSLoader entry in BCD for the operating system
  
## Cellular disclaimers

Currently cellular connectivity only works properly on engineering devices properly provisioned for modem due to apperso halt_subscription.

We've also been telling people on engineering devices to make backups, this is especially true here.
Flashing an entire eMMC img on an engineering devices will not only risk you damaging the device, but you will also lose for *ever* the modem partitions for *your* phone.
Those are unique, there's ways to recover them but it's borderline legal. If you do not have the correct modem partitions for your device, you will *never* get Cellular to work on your device.
You have been warned.

## USB for Lumia 950 and Lumia 950 XL

- You may have to manually right click the xHCI device in device manager
  properties -> update driver -> pick the qualcomm xhci driver

- The USB driver provided requires you to provide external power to the device (or use a Dock)

## GPU Testing for Hapanero (not Hapaneros with Lumia950XLPkg)

- Install from Supplemental\GPU:
  The correct Panel driver for your device (Hapanero, Cityman..)
  Screen may go black, after installing oempanel, it's recommended to use RDP to install those drivers
  Note: a patch is coming to ACPI tables to avoid this issue in a future UEFI update.

  Install Supplemental\GPU\Display into the Microsoft Generic Display adapter device and reboot

  Important notes:
  x86 / CHPE DirectX support is missing.

## USB Debugging

- It is advised to not install LumiaUSBKm when using USB debugging (it is under Device Specifics/DeviceName/USB)
- In order to enable USB debugging, you must have your phone put in mass storage mode and have access to the WoA ESP desktop
  partition.
  You need to go to /EFI/Microsoft/Boot/ (there you'll find a BCD file)
  Run the following commands from a command prompt running as administrator inside that directory:
  
  bcdedit /store BCD /dbgsettings usb TARGETNAME:WOATARGET
  bcdedit /store BCD /set {default} debug on

## Hapanero setup

It is highly recommended you do not install the leaked ARM64 firmware on Hapanero devices. This firmware is really buggy and is prone to lots of overheating problems and may ultimately damage your device.
Instead, please install Lumia950XLPkg like on Citymans and Talkmans, on a RnD firmware specifically made for Hapanero (like 10586, 10240) and use the Hapanero2 drivers.

On Hapanero pre-EB2 devices, you'll currently have to use the leaked ARM64 firmware. The ARM64 Windows 10 Mobile present will not boot, and will crash in qcsubsys.

## Changelog

You can find the changelog for releases before this repository in CHANGELOG_LEGACY.md
For current changelogs, please see the commit history.
