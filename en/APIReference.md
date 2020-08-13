<!--
 * @Author: Carl
 * @Date: 2020-07-24 15:19:34
 * @LastEditors: Carl
 * @LastEditTime: 2020-08-13 18:41:13
--> 
# API Reference

## Manage Account

| Name   | API       | Description       |
|------|-----------|-----------|
| Create account | post /v2/user/register | You can create an account with your email. |
| Login   | post /v2/user/login     | You should log in before you access device data or other resources |
| SMS login | post /v2/user/sms-login     |  Only users registered by phone number in mainland China has access to this. |
| Send verification code | post /v2/user/verification-code| Send verification code to email or phone number.|
| Reset password | post /v2/user/reset-pwd    |  When you forgot your password, reset password with this endpoint. |
| Change password | post /v2/user/change-pwd     | After you have logged in, you can use this endpoint to change your password with your old password. |
| Get user info | get /v2/user/profile     | Get the information of current account such as the nickname. |
| Update user info | post /v2/user/profile     | Update the information of current account such as the nickname. |
| Refresh access token | post /v2/user/refresh     | “access token” expires in 30 days (for security reasons) by default. When this happens, no need to log in again to get 'access token', just use 'refresh token' endpoint to refresh the 'access token'.   |
| Set up extra push channel | post /v2/user/extra-push     | Google push is supported. |
| Log out | delete /v2/user/logout     | Log out |
| Delete account | post /v2/user/close-account     | Delete account |

## Homepage

| Name   | API       | Description       |
|------|-----------|-----------|
| Homepage | post /v2/homepage     |  Allows you to check messages, scenes, things, homes, and user info.  |

## Manage device

| Name   | API       | Description       |
|------|-----------|-----------|
| Get thing list | get /v2/device/thing     |  Get all the devices and groups under the specified home ID. 
| Get a specified thing |  post /v2/device/thing    | Get a specified group or device |
| Get the status of a device or a group | get /v2/device/thing/status     |  Get the status of one device or a group, such as the on/off of a switch. |
| Update one thing | post /v2/device/thing/status     | Set the status of a device or a group, such as the on/off of a switch. |
| Update multiple things | post /v2/device/thing/batch-status | Update the statuses of multiple devices or groups such as the on/off of switches. |
| Add WiFi device | post /v2/device/add     | Add a WiFi device  |
| Add GSM device | post /v2/device/add-gsm    | Add a device with IoT sim card. Scan its QR code to get its device ID.  |
| Update device name/location |post /v2/device/update-info    | Update the name or room of the device | 
| Delete device | delete /v2/device    | Delete your own devices or devices shared with you. |
| Change device tags | post /v2/device/tags    | Used to change the names of different channels of a multi-channel device or to create some special functions based on your own needs. |
| Get group list | get /v2/device/group    | Get the list of groups in current home |
| Add a group | post /v2/device/group    | Create a group of devices of the same type, to control all the grouped devices with one tap.  |
| Change group | put /v2/device/group    | Currently, this endpoint only allows you to change the name of the group.  |
| Delete group | delete /v2/device/group    | Delete a group |
| Change group status | post /v2/device/group/status    | Update the status of a group, such as turning on/off a group.  |
| Add device to group | post /v2/device/group/add    | The device to add should have the same UIID as existing devices in the group.  |
| Delete from group | post /v2/device/group/delete    | Delete a device from the group  |
| Add multiple devices to group | post /v2/device/group/update    | Add multiple devices to a group |
| Share devices | post /v2/device/share    | Share devices to another user (in the same region server) |
| Edit sharing permission | post /v2/device/share/permit    | Edit the timer permissions for the shared user |
| Cancel sharing | delete /v2/device/share    | Cancel sharing devices with a user |
| Get device logs | get /v2/device/history    | Get the action logs of a device |
| Clean device logs | delete /v2/device/history    |  Clean the action logs of a device |
| Check device OTA update | post /v2/device/ota/query | Check if there is any new firmware available for the device |

## Homes and rooms

| Name   | API       | Description       |
|------|-----------|-----------|
| Get homes and rooms | get /v2/family    |  Get the list of all the homes and rooms in the current account. Each account should have one home at least  |
| Add home | post /v2/family   | Add a new home |
| Add room | post /v2/family/room   | Add a new room |
| Edit home | put /v2/family    | Currently, it only allows you to change the name of a home  |
| Edit room | put /v2/family/room   | Currently, it only allows you to change the name of a room |
| Reorder rooms | post /v2/family/room/index  | To change the order, you must designate the order of each room in the home. |
| Delete home | delete /v2/family | Delete specified home |
| Delete room | delete /v2/family/room    | Delete specified room |
| Order things in home | post /v2/family/thing/sort    | To change the order, you must specify the order of each device or group in the home.  |
| Move things | post /v2/family/room/thing    | Move groups and devices to a specified room  |
| Switch current home | post /v2/family/current    | Switch to the default home |

## Message

| Name   | API       | Description       |
|------|-----------|-----------|
| Get message lists | get /v2/message/read |  Get share notifications, device notification, and other messages. |

## Manage and control device

| Name   | API       | Description       |
|------|-----------|-----------|
| Get persistent connection address | Fixed interface  | Get the distributed address of the persistent connection for the app |

# Summary

With all the endpoints above, you can develop an application with complete functions from register and login, add device, to manage device and control device. You may find an  API to call for each step of your workflow. 