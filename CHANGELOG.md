# Changelog
All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

- - -
## v0.10.1 - 2025-10-30
#### Bug Fixes
- emit a logout event when the refresh user request get a 401 - (0d75f52) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.10.0 [skip ci] - (ebce6c5) - GitHub Actions

- - -

## v0.10.0 - 2025-10-28
#### Bug Fixes
- linter - (60fd501) - Brandon Guigo
- paywall callback - (6302a21) - Brandon Guigo
- when user is null in paywall, redirect to login - (3d7f633) - Brandon Guigo
- redirections and some ui stuff - (1e71b8c) - Brandon Guigo
- layout infinite loop for paywall redirect - (c841900) - Brandon Guigo
- convert the paywall to go route page - (263b381) - Brandon Guigo
- add subscribe event + fix login issue - (4e0e846) - Brandon Guigo
- ui of paywall - (8f495b9) - Brandon Guigo
#### Features
- send redirect urls to backend when creating checkout session - (98765e7) - Brandon Guigo
- update the paywall ui - (3d093ae) - Brandon Guigo
- make paywall redirections works - (18df995) - Brandon Guigo
- support callback parameters for after stripe checkout - (745544c) - Brandon Guigo
- add subscribe_response model - (90f4131) - Brandon Guigo
- show paywall when payment is enabled and it's on web or desktop - (16ec0de) - Brandon Guigo
- add back the change self-hosted url button, except on web - (6361825) - Brandon Guigo
- add banners for no free tier + -50% off - (055d73a) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.9.1 [skip ci] - (81b11d7) - GitHub Actions

- - -

## v0.9.1 - 2025-10-21
#### Bug Fixes
- test gh solution - (9747adf) - Brandon Guigo
- add non empty actions - (cc5a967) - Brandon Guigo
- add params - (b031791) - Brandon Guigo
- add windows param for notif - (d431d37) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.9.0 [skip ci] - (0422468) - GitHub Actions

- - -

## v0.9.0 - 2025-10-21
#### Bug Fixes
- go back issue - (9c70779) - Brandon Guigo
- mnemonic key was missing form widget - (ee91101) - Brandon Guigo
- refactoring + fix login loading widget - (0cdae0f) - Brandon Guigo
- display error when capacity reached on register call + setup send code in register payload - (305e6f6) - Brandon Guigo
- step handling between waiting list or classic register - (470755b) - Brandon Guigo
- loading issue and register not displayed when there's spot - (6606025) - Brandon Guigo
- when user have a redeem code in his waiting list entry, allow registration - (26a03f1) - Brandon Guigo
- update to position and total in join waiting list - (60423cc) - Brandon Guigo
- send request to the backend to join waiting list and show error when already registered - (bf875fd) - Brandon Guigo
- add ui for waiting list start - (d64d494) - Brandon Guigo
- null errors on ABUserDisplay + return waiting screen when no remaining spots - (cc76d26) - Brandon Guigo
#### Features
- support checking status of waiting list - (9890436) - Brandon Guigo
- display position in waiting list when joining - (e9c265b) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.8.5 [skip ci] - (02ab028) - GitHub Actions

- - -

## v0.8.5 - 2025-10-17
#### Bug Fixes
- add missing scroll view - (7f6492f) - Brandon Guigo
- is synced working - (e0f18d8) - Brandon Guigo
- add sync status btn and refactor user display - (6008249) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.8.4 [skip ci] - (0ba036d) - GitHub Actions

- - -

## v0.8.4 - 2025-10-16
#### Bug Fixes
- is payment supported is now web or desktop only - (ab2aee6) - Brandon Guigo
- disable registering on mobile - (e92945e) - Brandon Guigo
- sso ui on mobile - (b021d7d) - Brandon Guigo
- make mnemonic key page look like other auth pages - (a98dc39) - Brandon Guigo
- ui issue on no backup key + recap returns to login page now - (bdf0417) - Brandon Guigo
- reset password confirm doesn't return to the homepage after completion - (e1f2db8) - Brandon Guigo
- handle the case where there's no backup email in the account - (e671f97) - Brandon Guigo
- allow empty backup email - (6e74cba) - Brandon Guigo
- handle no backup email in recovey process - (0947eac) - Brandon Guigo
- linter - (8d0d978) - Brandon Guigo
- add password conditions display in register - (beb428d) - Brandon Guigo
- broken logout - (5557d6c) - Brandon Guigo
- add labels - (cb0bde4) - Brandon Guigo
- add back button - (31afa90) - Brandon Guigo
- ui of new register pages - (8f940a7) - Brandon Guigo
- validation inside the email / pwd form - (f754efb) - Brandon Guigo
- setup new auth design + add steps when registering for backup email + kyc - (f53d51e) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.8.3 [skip ci] - (00761c8) - GitHub Actions

- - -

## v0.8.3 - 2025-10-13
#### Bug Fixes
- linter - (294e2e8) - Brandon Guigo
- lookup first the subitems for headers, then parents - (4647cfa) - Brandon Guigo
- be able to collapse the side menu - (2291946) - Brandon Guigo
- ui for tablet and iPad - (1a6a828) - Brandon Guigo
- desktop ui for iPad - (20e3092) - Brandon Guigo
- header on mobile - (e04af3c) - Brandon Guigo
- look recursively inside subitems - (1e90cab) - Brandon Guigo
- add clear btn for search bar - (6e7edd7) - Brandon Guigo
- search works on all app + disabled items in side menu - (c10dca5) - Brandon Guigo
- add search bar into header - (9ed8100) - Brandon Guigo
- refactor - (35a48b0) - Brandon Guigo
- remove static width on side menu + add generic header - (408459a) - Brandon Guigo
- wrap sidemenu with titlebar safe area on apple desktop - (533d64d) - Brandon Guigo
- don't send update device request when no update necessary - (2a76d9b) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.8.2 [skip ci] - (b42b74e) - GitHub Actions

- - -

## v0.8.2 - 2025-10-10
#### Bug Fixes
- linter - (3c0d87e) - Brandon Guigo
- add back the action in side menu if there's one for the item - (2020205) - Brandon Guigo
- remove unused field in navbar - (f6eb8c2) - Brandon Guigo
- go to homepage after mnemonic have been displayed - (0ce21b1) - Brandon Guigo
- migrate the last part to getIt - (fca9567) - Brandon Guigo
- migrate settings to getIt - (a699999) - Brandon Guigo
- migrating paywall to getIt - (74ddd65) - Brandon Guigo
- migrate auth screens to getIt - (5fc895d) - Brandon Guigo
- more refactoring using getIt - (e92d3e3) - Brandon Guigo
- convert more to getIt - (dacf35a) - Brandon Guigo
- use getIt to get services - (bb6c2c9) - Brandon Guigo
- udpate services to go_router - (271a0a3) - Brandon Guigo
- make the sidemenu selected using go router location - (ffad07e) - Brandon Guigo
- look for action in the parent if no action in sub item - (5ce6b95) - Brandon Guigo
- support the center action with the one in the navigationItem - (75c1930) - Brandon Guigo
- use go router location for navbar selected - (b81f58f) - Brandon Guigo
- migrate app_layout to go_router based version - (0b444d8) - Brandon Guigo
- add reset password into the auth module - (3985c94) - Brandon Guigo
- make sso a selection of pages, that are integrated into the app router - (2d5d067) - Brandon Guigo
- make ssoModule a standalone go_router module - (0fb2573) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.8.1 [skip ci] - (c8f132e) - GitHub Actions

- - -

## v0.8.1 - 2025-10-07
#### Bug Fixes
- update flutter_age to support 16kb page size on Android - (3be8c4e) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.8.0 [skip ci] - (902e398) - GitHub Actions

- - -

## v0.8.0 - 2025-10-07
#### Bug Fixes
- linter - (a142fe8) - Brandon Guigo
- error in settings (isDesktop in init state is not allowed) - (23e6a3e) - Brandon Guigo
- customize action per page using nav constants - (e794c58) - Brandon Guigo
- return mobile ui on web when screen size is small - (cd115ed) - Brandon Guigo
- desktop width for the toast display - (b698187) - Brandon Guigo
- add disable shadow option for elevated container - (a702095) - Brandon Guigo
- remove the more button in shared navbar - (553a488) - Brandon Guigo
- app theme surfaceContainer + search bar ui - (1bac36e) - Brandon Guigo
- completely close the sidebar on desktop + unified search bar ui - (5dae703) - Brandon Guigo
#### Features
- add settings screen with additional items - (9993b3d) - Brandon Guigo
- add shared app_layout for every apps - (52ce5a1) - Brandon Guigo
- add desktop ui for account pages - (158f024) - Brandon Guigo
- add padding and optional label to ab button - (b7999f4) - Brandon Guigo
- make the bulk edit clear the selection and the notification - (02d5901) - Brandon Guigo
- add selected email toast ui - (033db26) - Brandon Guigo
- add ab button and toast display - (adbdeec) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.7.0 [skip ci] - (ddf37d6) - GitHub Actions

- - -

## v0.7.0 - 2025-10-01
#### Bug Fixes
- sizes and linter - (8c53a72) - Brandon Guigo
- last ui enhancements for both mobile and desktop - (8113e0a) - Brandon Guigo
- make the UI bigger - (ca41856) - Brandon Guigo
- ab_apps popup dark mode - (f1e6b16) - Brandon Guigo
- dark mode issues for side menu - (f610084) - Brandon Guigo
- add hovering on items - (3be5265) - Brandon Guigo
- issue when main category alone was selected along with the old sub item - (420a004) - Brandon Guigo
- define center action as parameter, not by taking the middle item of the nav items - (0796425) - Brandon Guigo
#### Features
- add collapsible with animation - (fdf167a) - Brandon Guigo
- refactor side menu item to be self sufficient - (cfde14d) - Brandon Guigo
- add the app modal - (e2c1401) - Brandon Guigo
- add selected marker - (cfd1dea) - Brandon Guigo
- add the items of the navbar + desktop and mobile only tabs - (6c1b827) - Brandon Guigo
- make the desktop navbar working when clicking - (7b25ff7) - Brandon Guigo
- add header - (0007c10) - Brandon Guigo
- add a desktop only field to nav items, so some items are hidden on mobile - (4da91e0) - Brandon Guigo
- move to the footer and setup secondary items in navItems - (5d1d3e3) - Brandon Guigo
- add new side menu header - (31ed39a) - Brandon Guigo
- add a new ab_sidemenu component to be shared between the apps for desktop - (814843b) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.6.0 [skip ci] - (2e4a234) - GitHub Actions

- - -

## v0.6.0 - 2025-09-29
#### Bug Fixes
- linter issues - (d287d91) - Brandon Guigo
- width on mobile for the domain selector - (9d0a31f) - Brandon Guigo
- refactor login to ssomodule - (8f7d27e) - Brandon Guigo
- error handling in register and login - (0b3c4e4) - Brandon Guigo
- animations on register / login screens - (e6c62df) - Brandon Guigo
- setIdToken doesn't persist token inside prefs - (1c1697a) - Brandon Guigo
- mnemonic key display ui - (412ee19) - Brandon Guigo
- desktop ui for reset password - (0196257) - Brandon Guigo
- completely delegate back the loading / mnemonic to the shared component - (63acda6) - Brandon Guigo
- required revenue cat service + register ui on desktop - (fd46f7c) - Brandon Guigo
- make mnemonic key display work - (222d8a9) - Brandon Guigo
- adapt the new login ui to desktop - (342b2bb) - Brandon Guigo
- refactor welcome screen into new login or register + cleanup + fix wrong colors inside the app - (7ffb720) - Brandon Guigo
- abconfig loading error causing to loss of the auth state uppon app restart - (4837a1d) - Brandon Guigo
#### Features
- redo design for register page - (b447082) - Brandon Guigo
- make login or register change to register screen when needed - (f226f14) - Brandon Guigo
- make the welcome screen the default login screen - (f2e3585) - Brandon Guigo
- change the logo inside the welcome screen - (17fd129) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.5.1 [skip ci] - (95e52e4) - GitHub Actions

- - -

## v0.5.1 - 2025-09-19
#### Bug Fixes
- update to latest flutter_age - (9b6a8fc) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.5.0 [skip ci] - (93079b3) - GitHub Actions

- - -

## v0.5.0 - 2025-09-18
#### Features
- add the domain selector using a CustomPopup - (d88cfee) - Brandon Guigo
- get the appConfig from the backend on app startup - (741ca15) - Brandon Guigo
- add the config model + add it to the auth bloc - (561ca4c) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.4.0 [skip ci] - (ea28e53) - GitHub Actions

- - -

## v0.4.0 - 2025-09-17
#### Bug Fixes
- update revenue cat package - (9fd364c) - Brandon Guigo
- linter - (3c178bf) - Brandon Guigo
#### Features
- add more tools to the toolbar - (52b3f19) - Brandon Guigo
- add fleather based ABEditor widget and toolbar - (6f0566b) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.3.0 [skip ci] - (7273402) - GitHub Actions

- - -

## v0.3.0 - 2025-09-11
#### Bug Fixes
- text alignment in field - (ec1f934) - Brandon Guigo
#### Features
- support row layout for app text form field + label style - (294ef74) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.2.4 [skip ci] - (f4a72f8) - GitHub Actions

- - -

## v0.2.4 - 2025-09-11
#### Bug Fixes
- skip decryption for boolean type - (80ed530) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.2.3 [skip ci] - (cfbbdb9) - GitHub Actions

- - -

## v0.2.3 - 2025-09-08
#### Bug Fixes
- decryption service fix for complex types - (630ccad) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.2.2 [skip ci] - (1b723b8) - GitHub Actions

- - -

## v0.2.2 - 2025-09-08
#### Bug Fixes
- make the cupertino icon used inside the navbar - (5cc07e6) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.2.1 [skip ci] - (b145025) - GitHub Actions

- - -

## v0.2.1 - 2025-08-14
#### Bug Fixes
- add missing nav section - (8aa475c) - Brandon Guigo
#### Miscellaneous Chores
- **(release)** v0.2.0 [skip ci] - (5d58b92) - GitHub Actions

- - -

## v0.2.0 - 2025-08-14
#### Bug Fixes
- cicd + add new compoents - (2e4a08b) - Brandon Guigo
#### Features
- refactor the navbar into a new design - (3f81231) - Brandon Guigo
- add date time extension - (b7c0238) - Brandon Guigo

- - -

## v0.1.0 - 2025-08-13
#### Bug Fixes
- changelog content - (d50e1fa) - Brandon Guigo
- add missing tag config in cog.toml - (d798871) - Brandon Guigo
- linter - (e91008f) - Brandon Guigo
#### Features
- add sync entity - (12cc11d) - Brandon Guigo
- add cicd for the shared package - (46aaee9) - Brandon Guigo

- - -
