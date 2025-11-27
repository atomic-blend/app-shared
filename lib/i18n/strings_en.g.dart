///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Atomic Blend'
	String get app_name => 'Atomic Blend';

	/// en: 'Atomic Blend Cloud'
	String get app_name_saas => 'Atomic Blend Cloud';

	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsAccountEn account = TranslationsAccountEn._(_root);
	late final TranslationsLoadingEn loading = TranslationsLoadingEn._(_root);
	late final TranslationsActionsEn actions = TranslationsActionsEn._(_root);
	late final TranslationsValidationEn validation = TranslationsValidationEn._(_root);
	Map<String, String> get errors => {
		'wrong_email_password': 'Email or password incorrect',
		'email_malformed': 'Email malformed',
		'connection_error': 'Could not connect to the server. Please check your internet connection and try again.',
		'unknown_error': 'Unknown error',
		'domain_required': 'Domain is required',
		'error_email_already_in_waiting_list': 'This email is already in the waiting list',
		'capacity_exceeded': 'We\'re at capacity! Please try again later.',
	};
	late final TranslationsNameGeneratorEn name_generator = TranslationsNameGeneratorEn._(_root);
	late final TranslationsPaywallEn paywall = TranslationsPaywallEn._(_root);
	late final TranslationsColorWheelEn color_wheel = TranslationsColorWheelEn._(_root);
	late final TranslationsDatesEn dates = TranslationsDatesEn._(_root);
	late final TranslationsTimeUnitsEn time_units = TranslationsTimeUnitsEn._(_root);
	late final TranslationsSyncStatusEn sync_status = TranslationsSyncStatusEn._(_root);
	late final TranslationsWaitingListEn waiting_list = TranslationsWaitingListEn._(_root);
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthNotLoggedInEn not_logged_in = TranslationsAuthNotLoggedInEn._(_root);
	late final TranslationsAuthLoginOrRegisterEn login_or_register = TranslationsAuthLoginOrRegisterEn._(_root);
	late final TranslationsAuthLoginEn login = TranslationsAuthLoginEn._(_root);
	late final TranslationsAuthRegisterEn register = TranslationsAuthRegisterEn._(_root);
	late final TranslationsAuthDeleteAccountEn delete_account = TranslationsAuthDeleteAccountEn._(_root);
	late final TranslationsAuthMnemonicKeyEn mnemonic_key = TranslationsAuthMnemonicKeyEn._(_root);
	late final TranslationsAuthResetPasswordEn reset_password = TranslationsAuthResetPasswordEn._(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	late final TranslationsSettingsAppSettingsEn app_settings = TranslationsSettingsAppSettingsEn._(_root);

	/// en: 'Logout'
	String get logout => 'Logout';
}

// Path: account
class TranslationsAccountEn {
	TranslationsAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Edit Profile'
	String get edit_profile => 'Edit Profile';

	late final TranslationsAccountSectionsEn sections = TranslationsAccountSectionsEn._(_root);
	late final TranslationsAccountActionsEn actions = TranslationsAccountActionsEn._(_root);
	late final TranslationsAccountProfileEn profile = TranslationsAccountProfileEn._(_root);
	late final TranslationsAccountAppSettingsEn app_settings = TranslationsAccountAppSettingsEn._(_root);
	late final TranslationsAccountSubscriptionPaymentsEn subscription_payments = TranslationsAccountSubscriptionPaymentsEn._(_root);
	late final TranslationsAccountSecurityAndPrivacyEn security_and_privacy = TranslationsAccountSecurityAndPrivacyEn._(_root);
}

// Path: loading
class TranslationsLoadingEn {
	TranslationsLoadingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading...'
	String get simple => 'Loading...';
}

// Path: actions
class TranslationsActionsEn {
	TranslationsActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Subscribe'
	String get subscribe => 'Subscribe';
}

// Path: validation
class TranslationsValidationEn {
	TranslationsValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'invalid URL'
	String get invalid_url => 'invalid URL';
}

// Path: name_generator
class TranslationsNameGeneratorEn {
	TranslationsNameGeneratorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<String> get animals => [
		'bat',
		'owl',
		'fox',
		'rabbit',
		'otter',
		'penguin',
		'panda',
		'squirrel',
		'koala',
		'tiger',
		'giraffe',
		'monkey',
		'raccoon',
		'zebra',
		'kangaroo',
		'parrot',
		'dolphin',
		'sloth',
		'wolf',
		'lion',
		'bear',
		'eagle',
		'elephant',
		'leopard',
		'cheetah',
		'hippo',
		'lemur',
		'frog',
		'chameleon',
		'lynx',
		'puffin',
		'seal',
		'falcon',
		'orca',
		'meerkat',
		'hedgehog',
		'weasel',
		'armadillo',
		'wombat',
		'platypus',
		'badger',
		'yak',
		'lizard',
		'beetle',
		'caterpillar',
		'jaguar',
		'buffalo',
		'stingray',
		'mole',
		'donkey',
		'toucan',
		'flamingo',
		'goat',
		'alpaca',
		'moose',
		'peacock',
		'rhino',
		'gecko',
		'turkey',
		'hamster',
		'otter',
		'gorilla',
		'walrus',
		'vulture',
		'stingray',
		'newt',
		'iguana',
		'porcupine',
		'python',
		'antelope',
		'gibbon',
		'boar',
		'crane',
		'emu',
		'pelican',
		'hyena',
		'heron',
		'lynx',
		'lamb',
		'tortoise',
		'shrimp',
		'lobster',
		'moth',
		'clam',
		'pufferfish',
		'starfish',
		'shrike',
		'robin',
		'quail',
		'koala',
		'snail',
		'slug',
		'owl',
		'viper',
		'duck',
		'swallow',
		'crab',
		'llama',
		'mongoose',
		'kitten',
	];
	List<String> get adjectives => [
		'happy',
		'brave',
		'cheerful',
		'jolly',
		'playful',
		'bright',
		'silly',
		'curious',
		'swift',
		'bold',
		'mighty',
		'clever',
		'sneaky',
		'gentle',
		'fuzzy',
		'quirky',
		'bouncy',
		'sparkly',
		'zippy',
		'chirpy',
		'glossy',
		'snappy',
		'shiny',
		'dreamy',
		'frisky',
		'sunny',
		'zany',
		'wild',
		'funky',
		'feisty',
		'snug',
		'crisp',
		'lively',
		'sassy',
		'witty',
		'spunky',
		'perky',
		'crafty',
		'jazzy',
		'dapper',
		'smiley',
		'lucky',
		'peppy',
		'peachy',
		'tidy',
		'chilly',
		'breezy',
		'giddy',
		'graceful',
		'plucky',
		'dizzy',
		'spry',
		'whimsical',
		'nimble',
		'chirpy',
		'jumpy',
		'quirky',
		'spicy',
		'perky',
		'speedy',
		'nifty',
		'wobbly',
		'crunchy',
		'cranky',
		'snazzy',
		'peppy',
		'bubbly',
		'splashy',
		'breezy',
		'bouncy',
		'twinkly',
		'gleeful',
		'squishy',
		'wacky',
		'zesty',
		'snappy',
		'jovial',
		'feathered',
		'prickly',
		'whizzy',
		'perky',
		'whiskery',
		'spotty',
		'stripy',
		'flicky',
		'chatty',
		'dandy',
		'wiggly',
		'giggly',
		'spiffy',
		'jumpy',
		'perky',
		'skippy',
		'fluffy',
		'chunky',
		'puffy',
		'loopy',
		'pinky',
		'spunky',
		'fancy',
	];
}

// Path: paywall
class TranslationsPaywallEn {
	TranslationsPaywallEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Get AtomicBlend Cloud'
	String get title => 'Get AtomicBlend Cloud';

	/// en: 'Enjoy Atomic Blend without restrictions and help the opensource initiative.'
	String get subtitle => 'Enjoy Atomic Blend without restrictions and help the opensource initiative.';

	/// en: 'All the apps you need, in one suite.'
	String get all_the_apps => 'All the apps you need, in one suite.';

	/// en: 'Why choose Atomic Blend Cloud?'
	String get why_choose_atomic_blend => 'Why choose Atomic Blend Cloud?';

	late final TranslationsPaywallAdvantagesEn advantages = TranslationsPaywallAdvantagesEn._(_root);
	Map<String, dynamic> get pricing => {
		'\$rc_annual': TranslationsPaywallPricing$rcAnnualEn._(_root),
		'\$rc_monthly': TranslationsPaywallPricing$rcMonthlyEn._(_root),
		'cloud_yearly': TranslationsPaywallPricingCloudYearlyEn._(_root),
		'cloud_monthly': TranslationsPaywallPricingCloudMonthlyEn._(_root),
	};

	/// en: 'No package selected'
	String get no_package_selected => 'No package selected';

	/// en: 'Purchase failed'
	String get purchase_failed => 'Purchase failed';

	/// en: 'Terms of Service'
	String get terms => 'Terms of Service';

	/// en: 'Privacy Policy'
	String get privacy_policy => 'Privacy Policy';

	/// en: 'Payment in progress'
	String get payment_in_progress => 'Payment in progress';

	/// en: 'Please wait while we process your payment.'
	String get payment_in_progress_description => 'Please wait while we process your payment.';

	/// en: 'Purchase successful'
	String get success => 'Purchase successful';

	/// en: 'Validation failed'
	String get validation_failed => 'Validation failed';

	/// en: 'Please check your internet connection and restart the app.'
	String get validation_failed_description => 'Please check your internet connection and restart the app.';

	/// en: 'Mobile app required'
	String get mobile_app_required => 'Mobile app required';

	/// en: 'To offer you the best experience possible, payment and account configuration is only available on the mobile app'
	String get payment_on_mobile_for_better_xp => 'To offer you the best experience possible, payment and account configuration is only available on the mobile app';

	/// en: 'iOS'
	String get ios => 'iOS';

	/// en: 'Android'
	String get android => 'Android';
}

// Path: color_wheel
class TranslationsColorWheelEn {
	TranslationsColorWheelEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Primary'
	String get primary => 'Primary';

	/// en: 'Accent'
	String get accent => 'Accent';

	/// en: 'Wheel'
	String get wheel => 'Wheel';
}

// Path: dates
class TranslationsDatesEn {
	TranslationsDatesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';
}

// Path: time_units
class TranslationsTimeUnitsEn {
	TranslationsTimeUnitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTimeUnitsShortEn short = TranslationsTimeUnitsShortEn._(_root);
	late final TranslationsTimeUnitsLongEn long = TranslationsTimeUnitsLongEn._(_root);
}

// Path: sync_status
class TranslationsSyncStatusEn {
	TranslationsSyncStatusEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'synced'
	String get synced => 'synced';
}

// Path: waiting_list
class TranslationsWaitingListEn {
	TranslationsWaitingListEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'We're at capacity!'
	String get title => 'We\'re at capacity!';

	/// en: 'Join the waiting list to get notified when a spot opens up.'
	String get description => 'Join the waiting list to get notified when a spot opens up.';

	/// en: 'Email is required'
	String get email_required => 'Email is required';

	/// en: 'Email is invalid'
	String get invalid_email => 'Email is invalid';

	/// en: 'Join the waiting list'
	String get join_waiting_list => 'Join the waiting list';

	/// en: 'I have a code'
	String get i_have_a_code => 'I have a code';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'brandon@atomic-blend.com'
	String get email_hint => 'brandon@atomic-blend.com';

	/// en: 'Back to home'
	String get back_to_home => 'Back to home';

	/// en: 'Proceed to registration'
	String get proceed_to_registration => 'Proceed to registration';
}

// Path: auth.not_logged_in
class TranslationsAuthNotLoggedInEn {
	TranslationsAuthNotLoggedInEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome to Atomic Blend'
	String get welcome => 'Welcome to Atomic Blend';

	/// en: 'Register to Atomic Blend'
	String get register_to_atomic_blend => 'Register to Atomic Blend';

	/// en: 'Atomic Blend is your end-to-end encrypted suite of apps. Log in to access your account.'
	String get log_in_to_your_account => 'Atomic Blend is your end-to-end encrypted suite of apps.\nLog in to access your account.';

	/// en: 'Atomic Blend is the first'
	String get description_start => 'Atomic Blend is the first';

	/// en: 'end-to-end encrypted app'
	String get e2e_app => 'end-to-end encrypted app';

	/// en: 'that combines all the tools you need to manage both work and personal life in one place. From task management to note-taking, document writing, time tracking, movie tracking, food tracking, everything stays'
	String get description_middle => 'that combines all the tools you need to manage both work and personal life in one place.\n\nFrom task management to note-taking, document writing, time tracking, movie tracking, food tracking, everything stays';

	/// en: 'secure and seamless.'
	String get description_middle_bold => 'secure and seamless.';

	/// en: 'No more juggling multiple apps—Atomic Blend brings it all together with privacy at its core, so you can focus on what truly matters.'
	String get description_end => 'No more juggling multiple apps—Atomic Blend brings it all together with privacy at its core, so you can focus on what truly matters.';

	/// en: 'Time to set things up!'
	String get time_to_set_things_up => 'Time to set things up!';

	/// en: 'To use Atomic Blend and sync your data across devices, you can choose between the cloud version or a self-hosted setup. Either way, your data is'
	String get set_up_start => 'To use Atomic Blend and sync your data across devices, you can choose between the cloud version or a self-hosted setup.\n\nEither way, your data is';

	/// en: 'end-to-end encrypted'
	String get set_up_middle => 'end-to-end encrypted';

	/// en: ', ensuring that only you have access to your encryption key —'
	String get set_up_end => ', ensuring that only you have access to your encryption key —';

	/// en: 'not us, not anyone else.'
	String get set_up_end_bold => 'not us, not anyone else.';

	/// en: 'Atomic Blend is a personal life management application that helps you organize your life, achieve your goals, and improve your well-being.'
	String get description => 'Atomic Blend is a personal life management application that helps you organize your life, achieve your goals, and improve your well-being.';
}

// Path: auth.login_or_register
class TranslationsAuthLoginOrRegisterEn {
	TranslationsAuthLoginOrRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Log in'
	String get login => 'Log in';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Connecting to: '
	String get connecting_to => 'Connecting to: ';
}

// Path: auth.login
class TranslationsAuthLoginEn {
	TranslationsAuthLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '👋 Welcome back!'
	String get title => '👋 Welcome back!';

	/// en: 'Use you email and password to log back in and access your data.'
	String get description => 'Use you email and password to log back in and access your data.';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Username'
	String get username => 'Username';

	/// en: 'Log in'
	String get login => 'Log in';
}

// Path: auth.register
class TranslationsAuthRegisterEn {
	TranslationsAuthRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What’s your email ?'
	String get email => 'What’s your email ?';

	/// en: 'Your email is used only for login and password recovery purposes.'
	String get email_description => 'Your email is used only for login and password recovery purposes.';

	/// en: 'We will never sell your data to third parties.'
	String get we_never_sell => 'We will never sell your data to third parties.';

	/// en: 'Choose a password'
	String get password => 'Choose a password';

	/// en: 'SuperSecure123!'
	String get password_hint => 'SuperSecure123!';

	/// en: 'Confirm your password'
	String get confirmation_hint => 'Confirm your password';

	/// en: 'Passwords do not match'
	String get password_mismatch => 'Passwords do not match';

	/// en: 'Let's get to know you!'
	String get lets_get_to_know_you => 'Let\'s get to know you!';

	/// en: 'First name'
	String get first_name => 'First name';

	/// en: 'Brandon'
	String get first_name_hint => 'Brandon';

	/// en: 'Guigo'
	String get last_name_hint => 'Guigo';

	/// en: 'Last name'
	String get last_name => 'Last name';

	/// en: 'Brandon'
	String get username_hint => 'Brandon';

	/// en: 'Setup account recovery'
	String get setup_account_recovery => 'Setup account recovery';

	/// en: 'Backup email'
	String get backup_email => 'Backup email';

	/// en: 'First name is required'
	String get first_name_required => 'First name is required';

	/// en: 'Last name is required'
	String get last_name_required => 'Last name is required';

	/// en: 'Backup email is required'
	String get backup_email_required => 'Backup email is required';

	/// en: 'Backup email is invalid'
	String get backup_email_invalid => 'Backup email is invalid';

	/// en: 'Password is required'
	String get password_required => 'Password is required';

	/// en: 'Password must be at least 8 characters long'
	String get password_invalid => 'Password must be at least 8 characters long';

	/// en: 'Username is required'
	String get username_required => 'Username is required';

	/// en: 'Domain is required'
	String get domain_required => 'Domain is required';

	/// en: 'We need a few informations to let you use Atomic Blend. You can modify these informations later in the settings of your account.'
	String get personal_info_description => 'We need a few informations to let you use Atomic Blend.\nYou can modify these informations later in the settings of your account.';

	/// en: 'We need a backup email to let you recover your account if you forget your password. If you don't have a backup email, you will not be able to recover your account.'
	String get backup_email_description => 'We need a backup email to let you recover your account if you forget your password.\nIf you don\'t have a backup email, you will not be able to recover your account.';

	/// en: 'Domain'
	String get domain => 'Domain';

	/// en: 'Giddy up Cowboy!'
	String get desktop_only_step => 'Giddy up Cowboy!';

	/// en: 'Setting up your Atomic Blend account is only available on desktop.'
	String get desktop_only_step_description => 'Setting up your Atomic Blend account is only available on desktop.';

	/// en: 'Go on desktop'
	String get go_on_desktop => 'Go on desktop';

	/// en: 'It may take a few minutes to complete the registration. App might look frozen, but it's working in the background. Click once the register button and please wait until the app redirects you to the next step.'
	String get web_register_slow => 'It may take a few minutes to complete the registration. App might look frozen, but it\'s working in the background.\nClick once the register button and please wait until the app redirects you to the next step.';

	late final TranslationsAuthRegisterPaymentEnabledEn payment_enabled = TranslationsAuthRegisterPaymentEnabledEn._(_root);
}

// Path: auth.delete_account
class TranslationsAuthDeleteAccountEn {
	TranslationsAuthDeleteAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete your account'
	String get title => 'Delete your account';

	/// en: 'Are you sure you want to delete your account?'
	String get description => 'Are you sure you want to delete your account?';

	/// en: 'This action cannot be undone.'
	String get cannot_be_undone => 'This action cannot be undone.';
}

// Path: auth.mnemonic_key
class TranslationsAuthMnemonicKeyEn {
	TranslationsAuthMnemonicKeyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your recovery key'
	String get title => 'Your recovery key';

	/// en: 'This is your recovery key.'
	String get description_start => 'This is your recovery key.';

	/// en: 'Write it down and keep it in a safe place.'
	String get description_mid => 'Write it down and keep it in a safe place.';

	/// en: 'You will need it to recover access to your data if you forget your password.'
	String get description_end => 'You will need it to recover access to your data if you forget your password.';

	/// en: 'Enter your recovery key'
	String get mnemonic_hint => 'Enter your recovery key';

	/// en: 'Invalid recovery key'
	String get mnemonic_error => 'Invalid recovery key';

	/// en: 'Recovery key copied to clipboard'
	String get copy_success => 'Recovery key copied to clipboard';
}

// Path: auth.reset_password
class TranslationsAuthResetPasswordEn {
	TranslationsAuthResetPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Reset your password'
	String get title => 'Reset your password';

	/// en: 'You don't remember your password?'
	String get subtitle => 'You don\'t remember your password?';

	/// en: 'You will receive an email with a code to confirm your identity, then you'll need your mnemonic key to get access to your data.'
	String get warning => 'You will receive an email with a code to confirm your identity, then you\'ll need your mnemonic key to get access to your data.';

	/// en: 'If you don't have your mnemonic key, you will lose access to your previous data.'
	String get no_mnemonic_data_loss => 'If you don\'t have your mnemonic key, you will lose access to your previous data.';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'The email address you used to register.'
	String get email_description => 'The email address you used to register.';

	/// en: 'No backup email found'
	String get no_backup_email => 'No backup email found';

	/// en: 'Contact support to get your account back. You will need a valid identification documents matching the account firstname and lastname.'
	String get no_backup_email_description => 'Contact support to get your account back. You will need a valid identification documents matching the account firstname and lastname.';

	/// en: 'atomicblend@gmail.com'
	String get email_hint => 'atomicblend@gmail.com';

	/// en: 'Email is required'
	String get email_required => 'Email is required';

	/// en: 'Confirmation code'
	String get confirmation_code => 'Confirmation code';

	/// en: 'Enter the code you received by email.'
	String get confirmation_code_description => 'Enter the code you received by email.';

	/// en: 'a1b5c3d4'
	String get confirmation_code_hint => 'a1b5c3d4';

	/// en: 'Confirmation code is required'
	String get confirmation_code_required => 'Confirmation code is required';

	/// en: 'Enter the confirmation code'
	String get enter_the_confirmation_code => 'Enter the confirmation code';

	/// en: 'A confirmation code has been sent to your email address.'
	String get confirmation_code_sent => 'A confirmation code has been sent to your email address.';

	/// en: 'Please check your inbox and enter the code below.'
	String get confirmation_code_sent_description => 'Please check your inbox and enter the code below.';

	/// en: 'Do you have your backup key?'
	String get do_you_have_your_mnemonic_key => 'Do you have your backup key?';

	/// en: 'This is a 12-word key that you received when you registered. It is used as a backup for your data and is required to recover your account.'
	String get backup_key_description => 'This is a 12-word key that you received when you registered. It is used as a backup for your data and is required to recover your account.';

	/// en: 'Yes, I have it, restore my data'
	String get yes_i_have => 'Yes, I have it, restore my data';

	/// en: 'No, I don't have it, delete my data'
	String get no_i_dont => 'No, I don\'t have it, delete my data';

	/// en: 'I understand by selecting this option that all my previous data will be deleted and I will not be able to recover it.'
	String get reset_data_warning => 'I understand by selecting this option that all my previous data will be deleted and I will not be able to recover it.';

	/// en: 'Mnemonic key'
	String get mnemonic_key => 'Mnemonic key';

	/// en: 'Enter the backup key you received when you registered.'
	String get mnemonic_key_description => 'Enter the backup key you received when you registered.';

	/// en: 'business theme rotate together surprise wisdom powder knee view border local runway'
	String get mnemonic_key_hint => 'business theme rotate together surprise wisdom powder knee view border local runway';

	/// en: 'Mnemonic key is required'
	String get mnemonic_key_required => 'Mnemonic key is required';

	/// en: 'Select your new password'
	String get select_your_new_password => 'Select your new password';

	/// en: 'Enter a new password to later access your account.'
	String get select_your_new_password_description => 'Enter a new password to later access your account.';

	/// en: 'New password'
	String get new_password => 'New password';

	/// en: 'Enter a new password to access your account.'
	String get new_password_description => 'Enter a new password to access your account.';

	/// en: 'SuperSecure123!'
	String get new_password_hint => 'SuperSecure123!';

	/// en: 'New password is required'
	String get new_password_required => 'New password is required';

	/// en: 'Confirm new password'
	String get confirm_new_password => 'Confirm new password';

	/// en: 'Confirm your new password.'
	String get confirm_new_password_description => 'Confirm your new password.';

	/// en: 'Confirm new password is required'
	String get confirm_new_password_required => 'Confirm new password is required';

	/// en: 'Passwords do not match'
	String get password_mismatch => 'Passwords do not match';

	/// en: 'Password is required'
	String get password_missing => 'Password is required';

	/// en: 'Password is too short'
	String get password_too_short => 'Password is too short';

	/// en: 'Recap of the process'
	String get recap_subtitle => 'Recap of the process';

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'No'
	String get no => 'No';

	/// en: 'Confirm reset'
	String get confirm_reset => 'Confirm reset';

	/// en: 'Password reset successful'
	String get success => 'Password reset successful';

	/// en: 'You can now log in with your new password.'
	String get success_description => 'You can now log in with your new password.';
}

// Path: settings.app_settings
class TranslationsSettingsAppSettingsEn {
	TranslationsSettingsAppSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'App Settings'
	String get title => 'App Settings';

	late final TranslationsSettingsAppSettingsSelfHostedUrlEn selfHostedUrl = TranslationsSettingsAppSettingsSelfHostedUrlEn._(_root);
}

// Path: account.sections
class TranslationsAccountSectionsEn {
	TranslationsAccountSectionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Account'
	String get account => 'Account';
}

// Path: account.actions
class TranslationsAccountActionsEn {
	TranslationsAccountActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Security & Privacy'
	String get security => 'Security & Privacy';

	/// en: 'Delete my Account'
	String get delete_account => 'Delete my Account';
}

// Path: account.profile
class TranslationsAccountProfileEn {
	TranslationsAccountProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'My Profile'
	String get my_profile => 'My Profile';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Undefined'
	String get undefined => 'Undefined';

	/// en: 'Email is required'
	String get email_missing => 'Email is required';

	/// en: 'Email must be different from the current email'
	String get email_same => 'Email must be different from the current email';
}

// Path: account.app_settings
class TranslationsAccountAppSettingsEn {
	TranslationsAccountAppSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'App Settings'
	String get title => 'App Settings';
}

// Path: account.subscription_payments
class TranslationsAccountSubscriptionPaymentsEn {
	TranslationsAccountSubscriptionPaymentsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subscription & Payments'
	String get title => 'Subscription & Payments';

	/// en: '${subName} Subscription'
	String subscription({required Object subName}) => '${subName} Subscription';

	/// en: 'This is your subscription with the earliest billing date.'
	String get latest_subscription => 'This is your subscription with the earliest billing date.';

	/// en: 'Billing Cycle'
	String get billing_cycle => 'Billing Cycle';

	/// en: 'Current Price'
	String get current_price => 'Current Price';

	/// en: 'Next Billing Date'
	String get next_billing_date => 'Next Billing Date';

	/// en: 'Payment History'
	String get payment_history => 'Payment History';

	/// en: 'No payments for now'
	String get no_payments => 'No payments for now';

	/// en: 'Manage my subscription'
	String get manage_my_subscription => 'Manage my subscription';

	/// en: 'You can only manage your subscription from the web.'
	String get management_url_web_only => 'You can only manage your subscription from the web.';

	/// en: 'Payments and subscriptions are disabled for this instance.'
	String get payment_disabled => 'Payments and subscriptions are disabled for this instance.';

	/// en: 'Payment Provider'
	String get payment_provider => 'Payment Provider';

	/// en: 'Payments are handled by Stripe. Your payment information is secure and is not stored on our servers.'
	String get stripe_description => 'Payments are handled by Stripe.\nYour payment information is secure and is not stored on our servers.';

	/// en: 'Can't load customer portal'
	String get cant_load_customer_portal => 'Can\'t load customer portal';
}

// Path: account.security_and_privacy
class TranslationsAccountSecurityAndPrivacyEn {
	TranslationsAccountSecurityAndPrivacyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Security & Privacy'
	String get title => 'Security & Privacy';

	late final TranslationsAccountSecurityAndPrivacyChangePasswordEn change_password = TranslationsAccountSecurityAndPrivacyChangePasswordEn._(_root);
}

// Path: paywall.advantages
class TranslationsPaywallAdvantagesEn {
	TranslationsPaywallAdvantagesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPaywallAdvantagesAllAppsOfTheSuiteEn all_apps_of_the_suite = TranslationsPaywallAdvantagesAllAppsOfTheSuiteEn._(_root);
	late final TranslationsPaywallAdvantagesEndToEndEncryptedEn end_to_end_encrypted = TranslationsPaywallAdvantagesEndToEndEncryptedEn._(_root);
	late final TranslationsPaywallAdvantagesSyncAcrossDevicesEn sync_across_devices = TranslationsPaywallAdvantagesSyncAcrossDevicesEn._(_root);
	late final TranslationsPaywallAdvantagesCommunityBackedEn community_backed = TranslationsPaywallAdvantagesCommunityBackedEn._(_root);
}

// Path: paywall.pricing.\$rc_annual
class TranslationsPaywallPricing$rcAnnualEn {
	TranslationsPaywallPricing$rcAnnualEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Yearly'
	String get title => 'Yearly';

	/// en: '\$39.99/year'
	String get price => '\$39.99/year';

	/// en: '1 month free trial'
	String get billed => '1 month free trial';

	/// en: '16% off'
	String get discount => '16% off';

	/// en: 'Start the 1-month free trial'
	String get start_button => 'Start the 1-month free trial';
}

// Path: paywall.pricing.\$rc_monthly
class TranslationsPaywallPricing$rcMonthlyEn {
	TranslationsPaywallPricing$rcMonthlyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Monthly'
	String get title => 'Monthly';

	/// en: '\$3.99/mo'
	String get price => '\$3.99/mo';

	/// en: '1 week free trial'
	String get billed => '1 week free trial';

	/// en: ''
	String get discount => '';

	/// en: 'Start the 1-week free trial'
	String get start_button => 'Start the 1-week free trial';
}

// Path: paywall.pricing.cloud_yearly
class TranslationsPaywallPricingCloudYearlyEn {
	TranslationsPaywallPricingCloudYearlyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Yearly'
	String get title => 'Yearly';

	/// en: '\$39.99/year'
	String get price => '\$39.99/year';

	/// en: '= \$3.33/month'
	String get billed => '= \$3.33/month';

	/// en: '16% off'
	String get discount => '16% off';

	/// en: 'Start the 1-month free trial'
	String get start_button => 'Start the 1-month free trial';
}

// Path: paywall.pricing.cloud_monthly
class TranslationsPaywallPricingCloudMonthlyEn {
	TranslationsPaywallPricingCloudMonthlyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Monthly'
	String get title => 'Monthly';

	/// en: '\$3.99/mo'
	String get price => '\$3.99/mo';

	/// en: ''
	String get billed => '';

	/// en: ''
	String get discount => '';

	/// en: 'Start the 1-week free trial'
	String get start_button => 'Start the 1-week free trial';
}

// Path: time_units.short
class TranslationsTimeUnitsShortEn {
	TranslationsTimeUnitsShortEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'd'
	String get day => 'd';

	/// en: 'h'
	String get hour => 'h';

	/// en: 'm'
	String get minute => 'm';
}

// Path: time_units.long
class TranslationsTimeUnitsLongEn {
	TranslationsTimeUnitsLongEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '(zero) {days} (one) {day} (other) {days}'
	String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'days',
		one: 'day',
		other: 'days',
	);

	/// en: '(zero) {hours} (one) {hour} (other) {hours}'
	String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'hours',
		one: 'hour',
		other: 'hours',
	);

	/// en: '(zero) {minutes} (one) {minute} (other) {minutes}'
	String minute({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'minutes',
		one: 'minute',
		other: 'minutes',
	);
}

// Path: auth.register.payment_enabled
class TranslationsAuthRegisterPaymentEnabledEn {
	TranslationsAuthRegisterPaymentEnabledEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Credit Card Required'
	String get title => 'Credit Card Required';

	/// en: 'Atomic Blend is an opensource project. As a solo builder bootstraping the project, I cannot offer a free tier.'
	String get description => 'Atomic Blend is an opensource project. As a solo builder bootstraping the project, I cannot offer a free tier.';
}

// Path: settings.app_settings.selfHostedUrl
class TranslationsSettingsAppSettingsSelfHostedUrlEn {
	TranslationsSettingsAppSettingsSelfHostedUrlEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Self-Hosted URL'
	String get title => 'Self-Hosted URL';

	/// en: 'If you are using a self-hosted instance of Atomic Blend, you can enter the URL here.'
	String get description => 'If you are using a self-hosted instance of Atomic Blend, you can enter the URL here.';

	/// en: 'Enter the URL of your instance'
	String get placeholder => 'Enter the URL of your instance';

	/// en: 'Not set'
	String get not_set => 'Not set';
}

// Path: account.security_and_privacy.change_password
class TranslationsAccountSecurityAndPrivacyChangePasswordEn {
	TranslationsAccountSecurityAndPrivacyChangePasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Change Password'
	String get title => 'Change Password';

	/// en: 'Old Password'
	String get old_password => 'Old Password';

	/// en: 'New Password'
	String get new_password => 'New Password';

	/// en: 'Confirm Password'
	String get confirm_password => 'Confirm Password';

	/// en: 'Old password is required'
	String get old_password_required => 'Old password is required';

	/// en: 'New password is required'
	String get new_password_required => 'New password is required';

	/// en: 'Confirm password is required'
	String get confirm_password_required => 'Confirm password is required';

	/// en: 'Passwords do not match'
	String get password_mismatch => 'Passwords do not match';

	/// en: 'SuperSecure123!'
	String get password_hint => 'SuperSecure123!';

	/// en: 'Changing your password will log you out of the app.'
	String get warning_changing_pws_will_log_you_out => 'Changing your password will log you out of the app.';
}

// Path: paywall.advantages.all_apps_of_the_suite
class TranslationsPaywallAdvantagesAllAppsOfTheSuiteEn {
	TranslationsPaywallAdvantagesAllAppsOfTheSuiteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All Apps of the Suite'
	String get title => 'All Apps of the Suite';

	/// en: 'Get access to all the apps of the suite: mail, calendar, etc...'
	String get description => 'Get access to all the apps of the suite: mail, calendar, etc...';
}

// Path: paywall.advantages.end_to_end_encrypted
class TranslationsPaywallAdvantagesEndToEndEncryptedEn {
	TranslationsPaywallAdvantagesEndToEndEncryptedEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'End-to-End Encryption'
	String get title => 'End-to-End Encryption';

	/// en: 'Your data is yours, forever.'
	String get description => 'Your data is yours, forever.';
}

// Path: paywall.advantages.sync_across_devices
class TranslationsPaywallAdvantagesSyncAcrossDevicesEn {
	TranslationsPaywallAdvantagesSyncAcrossDevicesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sync Across Devices'
	String get title => 'Sync Across Devices';

	/// en: 'Access your data from any device, anywhere.'
	String get description => 'Access your data from any device, anywhere.';
}

// Path: paywall.advantages.community_backed
class TranslationsPaywallAdvantagesCommunityBackedEn {
	TranslationsPaywallAdvantagesCommunityBackedEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Community Backed'
	String get title => 'Community Backed';

	/// en: '100% opensource : join a community of contributors.'
	String get description => '100% opensource : join a community of contributors.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app_name' => 'Atomic Blend',
			'app_name_saas' => 'Atomic Blend Cloud',
			'auth.not_logged_in.welcome' => 'Welcome to Atomic Blend',
			'auth.not_logged_in.register_to_atomic_blend' => 'Register to Atomic Blend',
			'auth.not_logged_in.log_in_to_your_account' => 'Atomic Blend is your end-to-end encrypted suite of apps.\nLog in to access your account.',
			'auth.not_logged_in.description_start' => 'Atomic Blend is the first',
			'auth.not_logged_in.e2e_app' => 'end-to-end encrypted app',
			'auth.not_logged_in.description_middle' => 'that combines all the tools you need to manage both work and personal life in one place.\n\nFrom task management to note-taking, document writing, time tracking, movie tracking, food tracking, everything stays',
			'auth.not_logged_in.description_middle_bold' => 'secure and seamless.',
			'auth.not_logged_in.description_end' => 'No more juggling multiple apps—Atomic Blend brings it all together with privacy at its core, so you can focus on what truly matters.',
			'auth.not_logged_in.time_to_set_things_up' => 'Time to set things up!',
			'auth.not_logged_in.set_up_start' => 'To use Atomic Blend and sync your data across devices, you can choose between the cloud version or a self-hosted setup.\n\nEither way, your data is',
			'auth.not_logged_in.set_up_middle' => 'end-to-end encrypted',
			'auth.not_logged_in.set_up_end' => ', ensuring that only you have access to your encryption key —',
			'auth.not_logged_in.set_up_end_bold' => 'not us, not anyone else.',
			'auth.not_logged_in.description' => 'Atomic Blend is a personal life management application that helps you organize your life, achieve your goals, and improve your well-being.',
			'auth.login_or_register.login' => 'Log in',
			'auth.login_or_register.register' => 'Register',
			'auth.login_or_register.next' => 'Next',
			'auth.login_or_register.connecting_to' => 'Connecting to: ',
			'auth.login.title' => '👋 Welcome back!',
			'auth.login.description' => 'Use you email and password to log back in and access your data.',
			'auth.login.email' => 'Email',
			'auth.login.username' => 'Username',
			'auth.login.login' => 'Log in',
			'auth.register.email' => 'What’s your email ?',
			'auth.register.email_description' => 'Your email is used only for login and password recovery purposes.',
			'auth.register.we_never_sell' => 'We will never sell your data to third parties.',
			'auth.register.password' => 'Choose a password',
			'auth.register.password_hint' => 'SuperSecure123!',
			'auth.register.confirmation_hint' => 'Confirm your password',
			'auth.register.password_mismatch' => 'Passwords do not match',
			'auth.register.lets_get_to_know_you' => 'Let\'s get to know you!',
			'auth.register.first_name' => 'First name',
			'auth.register.first_name_hint' => 'Brandon',
			'auth.register.last_name_hint' => 'Guigo',
			'auth.register.last_name' => 'Last name',
			'auth.register.username_hint' => 'Brandon',
			'auth.register.setup_account_recovery' => 'Setup account recovery',
			'auth.register.backup_email' => 'Backup email',
			'auth.register.first_name_required' => 'First name is required',
			'auth.register.last_name_required' => 'Last name is required',
			'auth.register.backup_email_required' => 'Backup email is required',
			'auth.register.backup_email_invalid' => 'Backup email is invalid',
			'auth.register.password_required' => 'Password is required',
			'auth.register.password_invalid' => 'Password must be at least 8 characters long',
			'auth.register.username_required' => 'Username is required',
			'auth.register.domain_required' => 'Domain is required',
			'auth.register.personal_info_description' => 'We need a few informations to let you use Atomic Blend.\nYou can modify these informations later in the settings of your account.',
			'auth.register.backup_email_description' => 'We need a backup email to let you recover your account if you forget your password.\nIf you don\'t have a backup email, you will not be able to recover your account.',
			'auth.register.domain' => 'Domain',
			'auth.register.desktop_only_step' => 'Giddy up Cowboy!',
			'auth.register.desktop_only_step_description' => 'Setting up your Atomic Blend account is only available on desktop.',
			'auth.register.go_on_desktop' => 'Go on desktop',
			'auth.register.web_register_slow' => 'It may take a few minutes to complete the registration. App might look frozen, but it\'s working in the background.\nClick once the register button and please wait until the app redirects you to the next step.',
			'auth.register.payment_enabled.title' => 'Credit Card Required',
			'auth.register.payment_enabled.description' => 'Atomic Blend is an opensource project. As a solo builder bootstraping the project, I cannot offer a free tier.',
			'auth.delete_account.title' => 'Delete your account',
			'auth.delete_account.description' => 'Are you sure you want to delete your account?',
			'auth.delete_account.cannot_be_undone' => 'This action cannot be undone.',
			'auth.mnemonic_key.title' => 'Your recovery key',
			'auth.mnemonic_key.description_start' => 'This is your recovery key.',
			'auth.mnemonic_key.description_mid' => 'Write it down and keep it in a safe place.',
			'auth.mnemonic_key.description_end' => 'You will need it to recover access to your data if you forget your password.',
			'auth.mnemonic_key.mnemonic_hint' => 'Enter your recovery key',
			'auth.mnemonic_key.mnemonic_error' => 'Invalid recovery key',
			'auth.mnemonic_key.copy_success' => 'Recovery key copied to clipboard',
			'auth.reset_password.title' => 'Reset your password',
			'auth.reset_password.subtitle' => 'You don\'t remember your password?',
			'auth.reset_password.warning' => 'You will receive an email with a code to confirm your identity, then you\'ll need your mnemonic key to get access to your data.',
			'auth.reset_password.no_mnemonic_data_loss' => 'If you don\'t have your mnemonic key, you will lose access to your previous data.',
			'auth.reset_password.email' => 'Email',
			'auth.reset_password.email_description' => 'The email address you used to register.',
			'auth.reset_password.no_backup_email' => 'No backup email found',
			'auth.reset_password.no_backup_email_description' => 'Contact support to get your account back. You will need a valid identification documents matching the account firstname and lastname.',
			'auth.reset_password.email_hint' => 'atomicblend@gmail.com',
			'auth.reset_password.email_required' => 'Email is required',
			'auth.reset_password.confirmation_code' => 'Confirmation code',
			'auth.reset_password.confirmation_code_description' => 'Enter the code you received by email.',
			'auth.reset_password.confirmation_code_hint' => 'a1b5c3d4',
			'auth.reset_password.confirmation_code_required' => 'Confirmation code is required',
			'auth.reset_password.enter_the_confirmation_code' => 'Enter the confirmation code',
			'auth.reset_password.confirmation_code_sent' => 'A confirmation code has been sent to your email address.',
			'auth.reset_password.confirmation_code_sent_description' => 'Please check your inbox and enter the code below.',
			'auth.reset_password.do_you_have_your_mnemonic_key' => 'Do you have your backup key?',
			'auth.reset_password.backup_key_description' => 'This is a 12-word key that you received when you registered. It is used as a backup for your data and is required to recover your account.',
			'auth.reset_password.yes_i_have' => 'Yes, I have it, restore my data',
			'auth.reset_password.no_i_dont' => 'No, I don\'t have it, delete my data',
			'auth.reset_password.reset_data_warning' => 'I understand by selecting this option that all my previous data will be deleted and I will not be able to recover it.',
			'auth.reset_password.mnemonic_key' => 'Mnemonic key',
			'auth.reset_password.mnemonic_key_description' => 'Enter the backup key you received when you registered.',
			'auth.reset_password.mnemonic_key_hint' => 'business theme rotate together surprise wisdom powder knee view border local runway',
			'auth.reset_password.mnemonic_key_required' => 'Mnemonic key is required',
			'auth.reset_password.select_your_new_password' => 'Select your new password',
			'auth.reset_password.select_your_new_password_description' => 'Enter a new password to later access your account.',
			'auth.reset_password.new_password' => 'New password',
			'auth.reset_password.new_password_description' => 'Enter a new password to access your account.',
			'auth.reset_password.new_password_hint' => 'SuperSecure123!',
			'auth.reset_password.new_password_required' => 'New password is required',
			'auth.reset_password.confirm_new_password' => 'Confirm new password',
			'auth.reset_password.confirm_new_password_description' => 'Confirm your new password.',
			'auth.reset_password.confirm_new_password_required' => 'Confirm new password is required',
			'auth.reset_password.password_mismatch' => 'Passwords do not match',
			'auth.reset_password.password_missing' => 'Password is required',
			'auth.reset_password.password_too_short' => 'Password is too short',
			'auth.reset_password.recap_subtitle' => 'Recap of the process',
			'auth.reset_password.yes' => 'Yes',
			'auth.reset_password.no' => 'No',
			'auth.reset_password.confirm_reset' => 'Confirm reset',
			'auth.reset_password.success' => 'Password reset successful',
			'auth.reset_password.success_description' => 'You can now log in with your new password.',
			'settings.title' => 'Settings',
			'settings.app_settings.title' => 'App Settings',
			'settings.app_settings.selfHostedUrl.title' => 'Self-Hosted URL',
			'settings.app_settings.selfHostedUrl.description' => 'If you are using a self-hosted instance of Atomic Blend, you can enter the URL here.',
			'settings.app_settings.selfHostedUrl.placeholder' => 'Enter the URL of your instance',
			'settings.app_settings.selfHostedUrl.not_set' => 'Not set',
			'settings.logout' => 'Logout',
			'account.edit_profile' => 'Edit Profile',
			'account.sections.account' => 'Account',
			'account.actions.security' => 'Security & Privacy',
			'account.actions.delete_account' => 'Delete my Account',
			'account.profile.my_profile' => 'My Profile',
			'account.profile.email' => 'Email',
			'account.profile.undefined' => 'Undefined',
			'account.profile.email_missing' => 'Email is required',
			'account.profile.email_same' => 'Email must be different from the current email',
			'account.app_settings.title' => 'App Settings',
			'account.subscription_payments.title' => 'Subscription & Payments',
			'account.subscription_payments.subscription' => ({required Object subName}) => '${subName} Subscription',
			'account.subscription_payments.latest_subscription' => 'This is your subscription with the earliest billing date.',
			'account.subscription_payments.billing_cycle' => 'Billing Cycle',
			'account.subscription_payments.current_price' => 'Current Price',
			'account.subscription_payments.next_billing_date' => 'Next Billing Date',
			'account.subscription_payments.payment_history' => 'Payment History',
			'account.subscription_payments.no_payments' => 'No payments for now',
			'account.subscription_payments.manage_my_subscription' => 'Manage my subscription',
			'account.subscription_payments.management_url_web_only' => 'You can only manage your subscription from the web.',
			'account.subscription_payments.payment_disabled' => 'Payments and subscriptions are disabled for this instance.',
			'account.subscription_payments.payment_provider' => 'Payment Provider',
			'account.subscription_payments.stripe_description' => 'Payments are handled by Stripe.\nYour payment information is secure and is not stored on our servers.',
			'account.subscription_payments.cant_load_customer_portal' => 'Can\'t load customer portal',
			'account.security_and_privacy.title' => 'Security & Privacy',
			'account.security_and_privacy.change_password.title' => 'Change Password',
			'account.security_and_privacy.change_password.old_password' => 'Old Password',
			'account.security_and_privacy.change_password.new_password' => 'New Password',
			'account.security_and_privacy.change_password.confirm_password' => 'Confirm Password',
			'account.security_and_privacy.change_password.old_password_required' => 'Old password is required',
			'account.security_and_privacy.change_password.new_password_required' => 'New password is required',
			'account.security_and_privacy.change_password.confirm_password_required' => 'Confirm password is required',
			'account.security_and_privacy.change_password.password_mismatch' => 'Passwords do not match',
			'account.security_and_privacy.change_password.password_hint' => 'SuperSecure123!',
			'account.security_and_privacy.change_password.warning_changing_pws_will_log_you_out' => 'Changing your password will log you out of the app.',
			'loading.simple' => 'Loading...',
			'actions.save' => 'Save',
			'actions.cancel' => 'Cancel',
			'actions.next' => 'Next',
			'actions.back' => 'Back',
			'actions.delete' => 'Delete',
			'actions.close' => 'Close',
			'actions.subscribe' => 'Subscribe',
			'validation.invalid_url' => 'invalid URL',
			'errors.wrong_email_password' => 'Email or password incorrect',
			'errors.email_malformed' => 'Email malformed',
			'errors.connection_error' => 'Could not connect to the server. Please check your internet connection and try again.',
			'errors.unknown_error' => 'Unknown error',
			'errors.domain_required' => 'Domain is required',
			'errors.error_email_already_in_waiting_list' => 'This email is already in the waiting list',
			'errors.capacity_exceeded' => 'We\'re at capacity! Please try again later.',
			'name_generator.animals.0' => 'bat',
			'name_generator.animals.1' => 'owl',
			'name_generator.animals.2' => 'fox',
			'name_generator.animals.3' => 'rabbit',
			'name_generator.animals.4' => 'otter',
			'name_generator.animals.5' => 'penguin',
			'name_generator.animals.6' => 'panda',
			'name_generator.animals.7' => 'squirrel',
			'name_generator.animals.8' => 'koala',
			'name_generator.animals.9' => 'tiger',
			'name_generator.animals.10' => 'giraffe',
			'name_generator.animals.11' => 'monkey',
			'name_generator.animals.12' => 'raccoon',
			'name_generator.animals.13' => 'zebra',
			'name_generator.animals.14' => 'kangaroo',
			'name_generator.animals.15' => 'parrot',
			'name_generator.animals.16' => 'dolphin',
			'name_generator.animals.17' => 'sloth',
			'name_generator.animals.18' => 'wolf',
			'name_generator.animals.19' => 'lion',
			'name_generator.animals.20' => 'bear',
			'name_generator.animals.21' => 'eagle',
			'name_generator.animals.22' => 'elephant',
			'name_generator.animals.23' => 'leopard',
			'name_generator.animals.24' => 'cheetah',
			'name_generator.animals.25' => 'hippo',
			'name_generator.animals.26' => 'lemur',
			'name_generator.animals.27' => 'frog',
			'name_generator.animals.28' => 'chameleon',
			'name_generator.animals.29' => 'lynx',
			'name_generator.animals.30' => 'puffin',
			'name_generator.animals.31' => 'seal',
			'name_generator.animals.32' => 'falcon',
			'name_generator.animals.33' => 'orca',
			'name_generator.animals.34' => 'meerkat',
			'name_generator.animals.35' => 'hedgehog',
			'name_generator.animals.36' => 'weasel',
			'name_generator.animals.37' => 'armadillo',
			'name_generator.animals.38' => 'wombat',
			'name_generator.animals.39' => 'platypus',
			'name_generator.animals.40' => 'badger',
			'name_generator.animals.41' => 'yak',
			'name_generator.animals.42' => 'lizard',
			'name_generator.animals.43' => 'beetle',
			'name_generator.animals.44' => 'caterpillar',
			'name_generator.animals.45' => 'jaguar',
			'name_generator.animals.46' => 'buffalo',
			'name_generator.animals.47' => 'stingray',
			'name_generator.animals.48' => 'mole',
			'name_generator.animals.49' => 'donkey',
			'name_generator.animals.50' => 'toucan',
			'name_generator.animals.51' => 'flamingo',
			'name_generator.animals.52' => 'goat',
			'name_generator.animals.53' => 'alpaca',
			'name_generator.animals.54' => 'moose',
			'name_generator.animals.55' => 'peacock',
			'name_generator.animals.56' => 'rhino',
			'name_generator.animals.57' => 'gecko',
			'name_generator.animals.58' => 'turkey',
			'name_generator.animals.59' => 'hamster',
			'name_generator.animals.60' => 'otter',
			'name_generator.animals.61' => 'gorilla',
			'name_generator.animals.62' => 'walrus',
			'name_generator.animals.63' => 'vulture',
			'name_generator.animals.64' => 'stingray',
			'name_generator.animals.65' => 'newt',
			'name_generator.animals.66' => 'iguana',
			'name_generator.animals.67' => 'porcupine',
			'name_generator.animals.68' => 'python',
			'name_generator.animals.69' => 'antelope',
			'name_generator.animals.70' => 'gibbon',
			'name_generator.animals.71' => 'boar',
			'name_generator.animals.72' => 'crane',
			'name_generator.animals.73' => 'emu',
			'name_generator.animals.74' => 'pelican',
			'name_generator.animals.75' => 'hyena',
			'name_generator.animals.76' => 'heron',
			'name_generator.animals.77' => 'lynx',
			'name_generator.animals.78' => 'lamb',
			'name_generator.animals.79' => 'tortoise',
			'name_generator.animals.80' => 'shrimp',
			'name_generator.animals.81' => 'lobster',
			'name_generator.animals.82' => 'moth',
			'name_generator.animals.83' => 'clam',
			'name_generator.animals.84' => 'pufferfish',
			'name_generator.animals.85' => 'starfish',
			'name_generator.animals.86' => 'shrike',
			'name_generator.animals.87' => 'robin',
			'name_generator.animals.88' => 'quail',
			'name_generator.animals.89' => 'koala',
			'name_generator.animals.90' => 'snail',
			'name_generator.animals.91' => 'slug',
			'name_generator.animals.92' => 'owl',
			'name_generator.animals.93' => 'viper',
			'name_generator.animals.94' => 'duck',
			'name_generator.animals.95' => 'swallow',
			'name_generator.animals.96' => 'crab',
			'name_generator.animals.97' => 'llama',
			'name_generator.animals.98' => 'mongoose',
			'name_generator.animals.99' => 'kitten',
			'name_generator.adjectives.0' => 'happy',
			'name_generator.adjectives.1' => 'brave',
			'name_generator.adjectives.2' => 'cheerful',
			'name_generator.adjectives.3' => 'jolly',
			'name_generator.adjectives.4' => 'playful',
			'name_generator.adjectives.5' => 'bright',
			'name_generator.adjectives.6' => 'silly',
			'name_generator.adjectives.7' => 'curious',
			'name_generator.adjectives.8' => 'swift',
			'name_generator.adjectives.9' => 'bold',
			'name_generator.adjectives.10' => 'mighty',
			'name_generator.adjectives.11' => 'clever',
			'name_generator.adjectives.12' => 'sneaky',
			'name_generator.adjectives.13' => 'gentle',
			'name_generator.adjectives.14' => 'fuzzy',
			'name_generator.adjectives.15' => 'quirky',
			'name_generator.adjectives.16' => 'bouncy',
			'name_generator.adjectives.17' => 'sparkly',
			'name_generator.adjectives.18' => 'zippy',
			'name_generator.adjectives.19' => 'chirpy',
			'name_generator.adjectives.20' => 'glossy',
			'name_generator.adjectives.21' => 'snappy',
			'name_generator.adjectives.22' => 'shiny',
			'name_generator.adjectives.23' => 'dreamy',
			'name_generator.adjectives.24' => 'frisky',
			'name_generator.adjectives.25' => 'sunny',
			'name_generator.adjectives.26' => 'zany',
			'name_generator.adjectives.27' => 'wild',
			'name_generator.adjectives.28' => 'funky',
			'name_generator.adjectives.29' => 'feisty',
			'name_generator.adjectives.30' => 'snug',
			'name_generator.adjectives.31' => 'crisp',
			'name_generator.adjectives.32' => 'lively',
			'name_generator.adjectives.33' => 'sassy',
			'name_generator.adjectives.34' => 'witty',
			'name_generator.adjectives.35' => 'spunky',
			'name_generator.adjectives.36' => 'perky',
			'name_generator.adjectives.37' => 'crafty',
			'name_generator.adjectives.38' => 'jazzy',
			'name_generator.adjectives.39' => 'dapper',
			'name_generator.adjectives.40' => 'smiley',
			'name_generator.adjectives.41' => 'lucky',
			'name_generator.adjectives.42' => 'peppy',
			'name_generator.adjectives.43' => 'peachy',
			'name_generator.adjectives.44' => 'tidy',
			'name_generator.adjectives.45' => 'chilly',
			'name_generator.adjectives.46' => 'breezy',
			'name_generator.adjectives.47' => 'giddy',
			'name_generator.adjectives.48' => 'graceful',
			'name_generator.adjectives.49' => 'plucky',
			'name_generator.adjectives.50' => 'dizzy',
			'name_generator.adjectives.51' => 'spry',
			'name_generator.adjectives.52' => 'whimsical',
			'name_generator.adjectives.53' => 'nimble',
			'name_generator.adjectives.54' => 'chirpy',
			'name_generator.adjectives.55' => 'jumpy',
			'name_generator.adjectives.56' => 'quirky',
			'name_generator.adjectives.57' => 'spicy',
			'name_generator.adjectives.58' => 'perky',
			'name_generator.adjectives.59' => 'speedy',
			'name_generator.adjectives.60' => 'nifty',
			'name_generator.adjectives.61' => 'wobbly',
			'name_generator.adjectives.62' => 'crunchy',
			'name_generator.adjectives.63' => 'cranky',
			'name_generator.adjectives.64' => 'snazzy',
			'name_generator.adjectives.65' => 'peppy',
			'name_generator.adjectives.66' => 'bubbly',
			'name_generator.adjectives.67' => 'splashy',
			'name_generator.adjectives.68' => 'breezy',
			'name_generator.adjectives.69' => 'bouncy',
			'name_generator.adjectives.70' => 'twinkly',
			'name_generator.adjectives.71' => 'gleeful',
			'name_generator.adjectives.72' => 'squishy',
			'name_generator.adjectives.73' => 'wacky',
			'name_generator.adjectives.74' => 'zesty',
			'name_generator.adjectives.75' => 'snappy',
			'name_generator.adjectives.76' => 'jovial',
			'name_generator.adjectives.77' => 'feathered',
			'name_generator.adjectives.78' => 'prickly',
			'name_generator.adjectives.79' => 'whizzy',
			'name_generator.adjectives.80' => 'perky',
			'name_generator.adjectives.81' => 'whiskery',
			'name_generator.adjectives.82' => 'spotty',
			'name_generator.adjectives.83' => 'stripy',
			'name_generator.adjectives.84' => 'flicky',
			'name_generator.adjectives.85' => 'chatty',
			'name_generator.adjectives.86' => 'dandy',
			'name_generator.adjectives.87' => 'wiggly',
			'name_generator.adjectives.88' => 'giggly',
			'name_generator.adjectives.89' => 'spiffy',
			'name_generator.adjectives.90' => 'jumpy',
			'name_generator.adjectives.91' => 'perky',
			'name_generator.adjectives.92' => 'skippy',
			'name_generator.adjectives.93' => 'fluffy',
			'name_generator.adjectives.94' => 'chunky',
			'name_generator.adjectives.95' => 'puffy',
			'name_generator.adjectives.96' => 'loopy',
			'name_generator.adjectives.97' => 'pinky',
			'name_generator.adjectives.98' => 'spunky',
			'name_generator.adjectives.99' => 'fancy',
			'paywall.title' => 'Get AtomicBlend Cloud',
			'paywall.subtitle' => 'Enjoy Atomic Blend without restrictions and help the opensource initiative.',
			'paywall.all_the_apps' => 'All the apps you need, in one suite.',
			'paywall.why_choose_atomic_blend' => 'Why choose Atomic Blend Cloud?',
			'paywall.advantages.all_apps_of_the_suite.title' => 'All Apps of the Suite',
			'paywall.advantages.all_apps_of_the_suite.description' => 'Get access to all the apps of the suite: mail, calendar, etc...',
			'paywall.advantages.end_to_end_encrypted.title' => 'End-to-End Encryption',
			'paywall.advantages.end_to_end_encrypted.description' => 'Your data is yours, forever.',
			'paywall.advantages.sync_across_devices.title' => 'Sync Across Devices',
			'paywall.advantages.sync_across_devices.description' => 'Access your data from any device, anywhere.',
			'paywall.advantages.community_backed.title' => 'Community Backed',
			'paywall.advantages.community_backed.description' => '100% opensource : join a community of contributors.',
			'paywall.pricing.\$rc_annual.title' => 'Yearly',
			'paywall.pricing.\$rc_annual.price' => '\$39.99/year',
			'paywall.pricing.\$rc_annual.billed' => '1 month free trial',
			'paywall.pricing.\$rc_annual.discount' => '16% off',
			'paywall.pricing.\$rc_annual.start_button' => 'Start the 1-month free trial',
			'paywall.pricing.\$rc_monthly.title' => 'Monthly',
			'paywall.pricing.\$rc_monthly.price' => '\$3.99/mo',
			'paywall.pricing.\$rc_monthly.billed' => '1 week free trial',
			'paywall.pricing.\$rc_monthly.discount' => '',
			'paywall.pricing.\$rc_monthly.start_button' => 'Start the 1-week free trial',
			'paywall.pricing.cloud_yearly.title' => 'Yearly',
			'paywall.pricing.cloud_yearly.price' => '\$39.99/year',
			'paywall.pricing.cloud_yearly.billed' => '= \$3.33/month',
			'paywall.pricing.cloud_yearly.discount' => '16% off',
			'paywall.pricing.cloud_yearly.start_button' => 'Start the 1-month free trial',
			'paywall.pricing.cloud_monthly.title' => 'Monthly',
			'paywall.pricing.cloud_monthly.price' => '\$3.99/mo',
			'paywall.pricing.cloud_monthly.billed' => '',
			'paywall.pricing.cloud_monthly.discount' => '',
			'paywall.pricing.cloud_monthly.start_button' => 'Start the 1-week free trial',
			'paywall.no_package_selected' => 'No package selected',
			'paywall.purchase_failed' => 'Purchase failed',
			'paywall.terms' => 'Terms of Service',
			'paywall.privacy_policy' => 'Privacy Policy',
			'paywall.payment_in_progress' => 'Payment in progress',
			'paywall.payment_in_progress_description' => 'Please wait while we process your payment.',
			'paywall.success' => 'Purchase successful',
			'paywall.validation_failed' => 'Validation failed',
			'paywall.validation_failed_description' => 'Please check your internet connection and restart the app.',
			'paywall.mobile_app_required' => 'Mobile app required',
			'paywall.payment_on_mobile_for_better_xp' => 'To offer you the best experience possible, payment and account configuration is only available on the mobile app',
			'paywall.ios' => 'iOS',
			'paywall.android' => 'Android',
			'color_wheel.primary' => 'Primary',
			'color_wheel.accent' => 'Accent',
			'color_wheel.wheel' => 'Wheel',
			'dates.today' => 'Today',
			'dates.tomorrow' => 'Tomorrow',
			'time_units.short.day' => 'd',
			'time_units.short.hour' => 'h',
			'time_units.short.minute' => 'm',
			'time_units.long.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'days', one: 'day', other: 'days', ), 
			'time_units.long.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'hours', one: 'hour', other: 'hours', ), 
			'time_units.long.minute' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'minutes', one: 'minute', other: 'minutes', ), 
			'sync_status.synced' => 'synced',
			'waiting_list.title' => 'We\'re at capacity!',
			'waiting_list.description' => 'Join the waiting list to get notified when a spot opens up.',
			'waiting_list.email_required' => 'Email is required',
			'waiting_list.invalid_email' => 'Email is invalid',
			'waiting_list.join_waiting_list' => 'Join the waiting list',
			'waiting_list.i_have_a_code' => 'I have a code',
			'waiting_list.email' => 'Email',
			'waiting_list.email_hint' => 'brandon@atomic-blend.com',
			'waiting_list.back_to_home' => 'Back to home',
			'waiting_list.proceed_to_registration' => 'Proceed to registration',
			_ => null,
		};
	}
}
