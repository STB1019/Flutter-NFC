# nfc_app

App that allows the management of nfc tags

## Functions

This application allows you to enable the reading of a tag through the id.

There are 2 ways to enable a tag:
1) By manually inserting the key in the "TagManager" section
2) By scanning the Tag in the "ReadMode" section

If the tag is not enabled and has never been read, in the event of an access attempt, it will have 3 possibilities to be enabled.
If it is not enabled within the third attempt, the tag will be blocked.
if a tag is enabled, it is removed from the blocked list and its attempts are reset

If a tag is blocked it is always possible to unlock it by enabling it.

The library used to read the tag is:
- [flutter_nfc_kit](https://pub.dev/packages/flutter_nfc_kit)

The supported tags for reading are:
* ISO 14443 Type A & Type B (NFC-A / NFC-B / MIFARE Classic / MIFARE Plus / MIFARE Ultralight / MIFARE DESFire)
* ISO 18092 (NFC-F / FeliCa)
* ISO 15963 (NFC-V)