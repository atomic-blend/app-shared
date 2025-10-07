# Changelog
All notable changes to this project will be documented in this file. See [conventional commits](https://www.conventionalcommits.org/) for commit guidelines.

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
