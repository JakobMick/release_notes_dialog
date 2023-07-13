# Changelog

## [2.0.0] - 13.07.2023

This release is a complete rewrite of the package. It contains some very much needed naming changes.
Apologies for all the breaking changes in this and previous releases. The package is stable now.

- Breaking: Remove explicit width and height parameters

Upgrade Guide [1.3.0] -> [2.0.0]:

- change ```Release.versionNumber``` to ```Release.title``` (as a named parameter)
- change ```Release.subLists``` to ```Release.changes``` (as a named parameter)
- change ```ReleaseSublist``` to ```ChangeGroup```
- change ```ReleaseSublist.name``` to ```ChangeGroup.title```
- change ```ReleaseSublist.bulletPadding``` to ```ChangeGroup.bulletSpacing```

- change ```paddingBetweenReleaseSublists``` to ```releaseSpacing```
- change ```paddingBeneathVersionNumber``` to ```releaseTitleSpacing```
- change ```paddingBetweenReleaseSublists``` to ```changeGroupSpacing```
- change ```paddingBeneathReleaseSublistName``` to ```changeGroupTitleSpacing```
- change ```paddingBetweenChanges``` to ```changeSpacing```
- change ```versionNumberTextStyle``` to ```releaseTitleTextStyle```
- change ```releaseSublistNameTextStyle``` to ```changeGroupTitleTextStyle```

## [1.3.0] - 26.05.2023

- Breaking: Changed how default dialog sizing works
- Added custom bullets

## [1.2.0] - 20.03.2023

- Breaking: Update to Material 3 typography
- Breaking: Change default styles
- Added close button text style

## [1.1.0] - 16.04.2021

- Breaking: ReleaseNotesDialog is now a StatelessWidget. You can show it with showDialog().
- Breaking: Removed barrierDismissible. It it is now being handled by showDialog().
- Breaking: Removed context. It it is now being handled by showDialog().
- Added documentation comments

## [1.0.3] - 11.04.2021

- Fixed README

## [1.0.2] - 11.04.2021

- Added useful README
- Updated example app

## [1.0.1] - 09.04.2021

- Fixed glyph alignment for multiline changes

## [1.0.0] - 09.04.2021

- Release!
