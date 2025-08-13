///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
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

	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsTagsEn tags = TranslationsTagsEn._(_root);
	late final TranslationsTasksEn tasks = TranslationsTasksEn._(_root);
	late final TranslationsCalendarEn calendar = TranslationsCalendarEn._(_root);
	late final TranslationsAccountEn account = TranslationsAccountEn._(_root);
	late final TranslationsHabitsEn habits = TranslationsHabitsEn._(_root);
	late final TranslationsUnderConstructionEn under_construction = TranslationsUnderConstructionEn._(_root);
	late final TranslationsMoreEn more = TranslationsMoreEn._(_root);
	Map<String, String> get date_modes => {
		'date': 'Date',
		'duration': 'Duration',
	};
	late final TranslationsTimesEn times = TranslationsTimesEn._(_root);
	Map<String, String> get days_of_week => {
		'monday': 'Monday',
		'tuesday': 'Tuesday',
		'wednesday': 'Wednesday',
		'thursday': 'Thursday',
		'friday': 'Friday',
		'saturday': 'Saturday',
		'sunday': 'Sunday',
	};
	Map<String, dynamic> get days_before => {
		'none': TranslationsDaysBeforeNoneEn._(_root),
		'same_day': TranslationsDaysBeforeSameDayEn._(_root),
		'one_day': TranslationsDaysBeforeOneDayEn._(_root),
		'two_days': TranslationsDaysBeforeTwoDaysEn._(_root),
		'three_days': TranslationsDaysBeforeThreeDaysEn._(_root),
		'one_week': TranslationsDaysBeforeOneWeekEn._(_root),
		'custom': TranslationsDaysBeforeCustomEn._(_root),
	};
	Map<String, dynamic> get time_before => {
		'same_time': TranslationsTimeBeforeSameTimeEn._(_root),
		'five_minutes': TranslationsTimeBeforeFiveMinutesEn._(_root),
		'fifteen_minutes': TranslationsTimeBeforeFifteenMinutesEn._(_root),
		'thirty_minutes': TranslationsTimeBeforeThirtyMinutesEn._(_root),
		'one_hour': TranslationsTimeBeforeOneHourEn._(_root),
		'two_hours': TranslationsTimeBeforeTwoHoursEn._(_root),
		'one_day': TranslationsTimeBeforeOneDayEn._(_root),
		'custom': TranslationsTimeBeforeCustomEn._(_root),
	};
	late final TranslationsLoadingEn loading = TranslationsLoadingEn._(_root);
	late final TranslationsActionsEn actions = TranslationsActionsEn._(_root);
	late final TranslationsValidationEn validation = TranslationsValidationEn._(_root);
	Map<String, String> get errors => {
		'wrong_email_password': 'Email or password incorrect',
		'email_malformed': 'Email malformed',
		'unknown_error': 'Unknown error',
	};
	late final TranslationsNotificationsEn notifications = TranslationsNotificationsEn._(_root);
	late final TranslationsTimeUnitsEn time_units = TranslationsTimeUnitsEn._(_root);
	late final TranslationsNameGeneratorEn name_generator = TranslationsNameGeneratorEn._(_root);
	late final TranslationsEisenhowerEn eisenhower = TranslationsEisenhowerEn._(_root);
	late final TranslationsFeatureUnderConstructionEn feature_under_construction = TranslationsFeatureUnderConstructionEn._(_root);
	late final TranslationsInboxEn inbox = TranslationsInboxEn._(_root);
	late final TranslationsTimerEn timer = TranslationsTimerEn._(_root);
	late final TranslationsPaywallEn paywall = TranslationsPaywallEn._(_root);
	late final TranslationsSearchEn search = TranslationsSearchEn._(_root);
	late final TranslationsSyncEn sync = TranslationsSyncEn._(_root);
}

// Path: navigation
class TranslationsNavigationEn {
	TranslationsNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Back'
	String get back => 'Back';
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

// Path: tags
class TranslationsTagsEn {
	TranslationsTagsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tags'
	String get title => 'Tags';

	/// en: 'No tags'
	String get no_tags => 'No tags';

	/// en: 'Assign tags'
	String get assign_tags => 'Assign tags';

	late final TranslationsTagsAddModalEn add_modal = TranslationsTagsAddModalEn._(_root);
	late final TranslationsTagsDeleteEn delete = TranslationsTagsDeleteEn._(_root);
}

// Path: tasks
class TranslationsTasksEn {
	TranslationsTasksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tasks'
	String get title => 'Tasks';

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Overview'
	String get overview => 'Overview';

	/// en: 'Inbox'
	String get inbox => 'Inbox';

	/// en: 'Tags'
	String get tags => 'Tags';

	/// en: 'All tasks'
	String get all_tasks => 'All tasks';

	/// en: 'Completed tasks'
	String get completed_tasks => 'Completed tasks';

	/// en: 'My tags'
	String get my_tags => 'My tags';

	/// en: 'No tags for now'
	String get no_tags_for_now => 'No tags for now';

	/// en: 'My folders'
	String get my_folders => 'My folders';

	late final TranslationsTasksFoldersEn folders = TranslationsTasksFoldersEn._(_root);

	/// en: 'Nothing to do for now, enjoy your day!'
	String get nothing_to_do => 'Nothing to do for now, enjoy your day!';

	/// en: 'You have nothing planned for tomorrow, enjoy your day!'
	String get day_off => 'You have nothing planned for tomorrow, enjoy your day!';

	/// en: 'You have nothing planned for this week, try and take the time to do the stuff left behind!'
	String get week_off => 'You have nothing planned for this week, try and take the time to do the stuff left behind!';

	/// en: 'No tasks for now'
	String get no_tasks_for_now => 'No tasks for now';

	/// en: 'Task Details'
	String get task_details => 'Task Details';

	/// en: 'Time Log'
	String get time_log => 'Time Log';

	/// en: 'Log session'
	String get log_session => 'Log session';

	/// en: 'Timer'
	String get timer => 'Timer';

	/// en: 'Pomodoro'
	String get pomodoro => 'Pomodoro';

	/// en: 'Manual'
	String get manual => 'Manual';

	/// en: 'From'
	String get from => 'From';

	/// en: 'To'
	String get to => 'To';

	/// en: 'Priority'
	String get priority => 'Priority';

	Map<String, String> get priorities => {
		'none': 'None',
		'low': 'Low',
		'medium': 'Medium',
		'high': 'High',
	};
	late final TranslationsTasksDueDatesEn due_dates = TranslationsTasksDueDatesEn._(_root);
	late final TranslationsTasksAddTaskModalEn add_task_modal = TranslationsTasksAddTaskModalEn._(_root);

	/// en: 'Time spent'
	String get time_spent => 'Time spent';

	/// en: 'No time entries for now'
	String get no_time_entries => 'No time entries for now';

	late final TranslationsTasksAddTimeEntryEn add_time_entry = TranslationsTasksAddTimeEntryEn._(_root);
	late final TranslationsTasksConflictDetectedModalEn conflict_detected_modal = TranslationsTasksConflictDetectedModalEn._(_root);
}

// Path: calendar
class TranslationsCalendarEn {
	TranslationsCalendarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Calendar'
	String get title => 'Calendar';

	/// en: 'Month'
	String get month => 'Month';

	/// en: 'Day'
	String get day => 'Day';

	/// en: '3 Days'
	String get threeDays => '3 Days';

	/// en: 'Week'
	String get week => 'Week';

	/// en: 'Schedule'
	String get schedule => 'Schedule';

	late final TranslationsCalendarErrorsEn errors = TranslationsCalendarErrorsEn._(_root);
	late final TranslationsCalendarEventDetailEn event_detail = TranslationsCalendarEventDetailEn._(_root);
	late final TranslationsCalendarSettingsEn settings = TranslationsCalendarSettingsEn._(_root);
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
	late final TranslationsAccountSubscriptionPaymentsEn subscription_payments = TranslationsAccountSubscriptionPaymentsEn._(_root);
	late final TranslationsAccountSecurityAndPrivacyEn security_and_privacy = TranslationsAccountSecurityAndPrivacyEn._(_root);
}

// Path: habits
class TranslationsHabitsEn {
	TranslationsHabitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Habits'
	String get title => 'Habits';

	/// en: 'No habits for now'
	String get no_habits => 'No habits for now';

	/// en: 'Add your first habit to get started!'
	String get get_started_now => 'Add your first habit to get started!';

	late final TranslationsHabitsDeleteHabitEn delete_habit = TranslationsHabitsDeleteHabitEn._(_root);
	late final TranslationsHabitsAddEn add = TranslationsHabitsAddEn._(_root);

	/// en: 'Habits'
	String get list => 'Habits';

	/// en: 'Overview'
	String get overview => 'Overview';

	/// en: '${nb} times a day'
	String times_a_day({required Object nb}) => '${nb} times a day';

	/// en: '${nb} times a week'
	String times_a_week({required Object nb}) => '${nb} times a week';

	/// en: '${nb} times a month'
	String times_a_month({required Object nb}) => '${nb} times a month';

	late final TranslationsHabitsHabitDetailEn habit_detail = TranslationsHabitsHabitDetailEn._(_root);
}

// Path: under_construction
class TranslationsUnderConstructionEn {
	TranslationsUnderConstructionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'We're working on it!'
	String get title => 'We\'re working on it!';

	/// en: 'This feature is not yet available, but we're working hard to bring it to you soon. Stay tuned!'
	String get description => 'This feature is not yet available, but we\'re working hard to bring it to you soon.\n\nStay tuned!';
}

// Path: more
class TranslationsMoreEn {
	TranslationsMoreEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'More'
	String get title => 'More';
}

// Path: times
class TranslationsTimesEn {
	TranslationsTimesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';

	/// en: 'Yesterday'
	String get yesterday => 'Yesterday';

	/// en: 'This week'
	String get this_week => 'This week';

	/// en: 'Last week'
	String get last_week => 'Last week';

	/// en: 'This month'
	String get this_month => 'This month';

	/// en: 'Last month'
	String get last_month => 'Last month';

	/// en: 'This year'
	String get this_year => 'This year';

	/// en: 'Last year'
	String get last_year => 'Last year';

	/// en: 'All time'
	String get all_time => 'All time';

	/// en: '(zero) {${nb} minutes} (one) {${nb} minute} (other) {${nb} minutes}'
	String minutes({required num n, required Object nb}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: '${nb} minutes',
		one: '${nb} minute',
		other: '${nb} minutes',
	);
}

// Path: days_before.none
class TranslationsDaysBeforeNoneEn {
	TranslationsDaysBeforeNoneEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '0'
	String get value => '0';

	/// en: 'None'
	String get label => 'None';
}

// Path: days_before.same_day
class TranslationsDaysBeforeSameDayEn {
	TranslationsDaysBeforeSameDayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'same_day'
	String get value => 'same_day';

	/// en: 'Same day'
	String get label => 'Same day';
}

// Path: days_before.one_day
class TranslationsDaysBeforeOneDayEn {
	TranslationsDaysBeforeOneDayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-1'
	String get value => '-1';

	/// en: '1 day before'
	String get label => '1 day before';
}

// Path: days_before.two_days
class TranslationsDaysBeforeTwoDaysEn {
	TranslationsDaysBeforeTwoDaysEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-2'
	String get value => '-2';

	/// en: '2 days before'
	String get label => '2 days before';
}

// Path: days_before.three_days
class TranslationsDaysBeforeThreeDaysEn {
	TranslationsDaysBeforeThreeDaysEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-3'
	String get value => '-3';

	/// en: '3 days before'
	String get label => '3 days before';
}

// Path: days_before.one_week
class TranslationsDaysBeforeOneWeekEn {
	TranslationsDaysBeforeOneWeekEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-7'
	String get value => '-7';

	/// en: '1 week before'
	String get label => '1 week before';
}

// Path: days_before.custom
class TranslationsDaysBeforeCustomEn {
	TranslationsDaysBeforeCustomEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'null'
	String get value => 'null';

	/// en: 'Custom'
	String get label => 'Custom';
}

// Path: time_before.same_time
class TranslationsTimeBeforeSameTimeEn {
	TranslationsTimeBeforeSameTimeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '0'
	String get value => '0';

	/// en: 'Same time'
	String get label => 'Same time';
}

// Path: time_before.five_minutes
class TranslationsTimeBeforeFiveMinutesEn {
	TranslationsTimeBeforeFiveMinutesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-5'
	String get value => '-5';

	/// en: '5 minutes before'
	String get label => '5 minutes before';
}

// Path: time_before.fifteen_minutes
class TranslationsTimeBeforeFifteenMinutesEn {
	TranslationsTimeBeforeFifteenMinutesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-15'
	String get value => '-15';

	/// en: '15 minutes before'
	String get label => '15 minutes before';
}

// Path: time_before.thirty_minutes
class TranslationsTimeBeforeThirtyMinutesEn {
	TranslationsTimeBeforeThirtyMinutesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-30'
	String get value => '-30';

	/// en: '30 minutes before'
	String get label => '30 minutes before';
}

// Path: time_before.one_hour
class TranslationsTimeBeforeOneHourEn {
	TranslationsTimeBeforeOneHourEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-60'
	String get value => '-60';

	/// en: '1 hour before'
	String get label => '1 hour before';
}

// Path: time_before.two_hours
class TranslationsTimeBeforeTwoHoursEn {
	TranslationsTimeBeforeTwoHoursEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-120'
	String get value => '-120';

	/// en: '2 hours before'
	String get label => '2 hours before';
}

// Path: time_before.one_day
class TranslationsTimeBeforeOneDayEn {
	TranslationsTimeBeforeOneDayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '-1440'
	String get value => '-1440';

	/// en: '1 day before'
	String get label => '1 day before';
}

// Path: time_before.custom
class TranslationsTimeBeforeCustomEn {
	TranslationsTimeBeforeCustomEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'null'
	String get value => 'null';

	/// en: 'Custom'
	String get label => 'Custom';
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

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Clear'
	String get clear => 'Clear';

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

	/// en: 'Required'
	String get required => 'Required';

	/// en: 'invalid URL'
	String get invalid_url => 'invalid URL';
}

// Path: notifications
class TranslationsNotificationsEn {
	TranslationsNotificationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The task is due'
	String get task_due_now => 'The task is due';

	/// en: 'The task is starting'
	String get task_starting => 'The task is starting';

	/// en: 'The task is starting in ${time}'
	String task_starting_in({required Object time}) => 'The task is starting in ${time}';

	/// en: 'Perform the habit now, one less thing to do!'
	String get habit_due_now => 'Perform the habit now, one less thing to do!';
}

// Path: time_units
class TranslationsTimeUnitsEn {
	TranslationsTimeUnitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTimeUnitsShortEn short = TranslationsTimeUnitsShortEn._(_root);
	late final TranslationsTimeUnitsLongEn long = TranslationsTimeUnitsLongEn._(_root);
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

// Path: eisenhower
class TranslationsEisenhowerEn {
	TranslationsEisenhowerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Eisenhower'
	String get small_title => 'Eisenhower';

	/// en: 'Eisenhower Matrix'
	String get title => 'Eisenhower Matrix';
}

// Path: feature_under_construction
class TranslationsFeatureUnderConstructionEn {
	TranslationsFeatureUnderConstructionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Feature under construction'
	String get title => 'Feature under construction';

	/// en: 'This feature is not yet available, but we're working hard to bring it to you soon. Stay tuned!'
	String get description => 'This feature is not yet available, but we\'re working hard to bring it to you soon.\n\nStay tuned!';
}

// Path: inbox
class TranslationsInboxEn {
	TranslationsInboxEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Inbox'
	String get title => 'Inbox';
}

// Path: timer
class TranslationsTimerEn {
	TranslationsTimerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Timer'
	String get title => 'Timer';

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'Stop'
	String get stop => 'Stop';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Pause'
	String get pause => 'Pause';

	/// en: 'Resume'
	String get resume => 'Resume';

	/// en: 'Duration'
	String get duration => 'Duration';

	/// en: 'Start pomodoro'
	String get start_pomodoro => 'Start pomodoro';

	/// en: 'Start stopwatch'
	String get start_stopwatch => 'Start stopwatch';

	/// en: 'Pomodoro running'
	String get pomo_running => 'Pomodoro running';

	/// en: 'Timer running'
	String get timer_running => 'Timer running';

	/// en: 'Time left: ${timeLeft}'
	String time_left({required Object timeLeft}) => 'Time left: ${timeLeft}';

	/// en: 'Start break'
	String get start_break => 'Start break';

	/// en: 'Elapsed time'
	String get elapsed_time => 'Elapsed time';

	/// en: 'Remaining time'
	String get remaining_time => 'Remaining time';

	/// en: 'No timer running'
	String get no_timer_running => 'No timer running';

	Map<String, String> get modes => {
		'pomodoro': 'Pomodoro',
		'stopwatch': 'Stopwatch',
	};

	/// en: 'Select a task'
	String get select_task => 'Select a task';

	/// en: 'Select a task to start the timer'
	String get select_task_to_start_timer => 'Select a task to start the timer';

	/// en: 'Completed!'
	String get completed => 'Completed!';

	/// en: 'Your pomodoro session has completed! Time for a break.'
	String get pomodoro_completed_message => 'Your pomodoro session has completed! Time for a break.';

	/// en: 'Your stopwatch session has been completed.'
	String get stopwatch_completed_message => 'Your stopwatch session has been completed.';

	/// en: 'Task'
	String get task_label => 'Task';
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

	/// en: 'Restore Purchase'
	String get restore_purchase => 'Restore Purchase';

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

// Path: search
class TranslationsSearchEn {
	TranslationsSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '(zero) {No results found} (one) {1 result found} (other) {${n} results found}'
	String results({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'No results found',
		one: '1 result found',
		other: '${n} results found',
	);
}

// Path: sync
class TranslationsSyncEn {
	TranslationsSyncEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Synchronization'
	String get title => 'Synchronization';

	/// en: 'Keep your data up to date across all your devices'
	String get description => 'Keep your data up to date across all your devices';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Up to date'
	String get up_to_date => 'Up to date';

	/// en: 'Conflicts'
	String get conflicts => 'Conflicts';

	/// en: '(zero) {No items have conflicts} (one) {1 item has conflicts} (other) {${n} items have conflicts}'
	String x_items_have_conflicts({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'No items have conflicts',
		one: '1 item has conflicts',
		other: '${n} items have conflicts',
	);

	late final TranslationsSyncDetailsEn details = TranslationsSyncDetailsEn._(_root);

	/// en: 'Sync now'
	String get sync_now => 'Sync now';

	late final TranslationsSyncConflictResolverEn conflict_resolver = TranslationsSyncConflictResolverEn._(_root);
}

// Path: auth.not_logged_in
class TranslationsAuthNotLoggedInEn {
	TranslationsAuthNotLoggedInEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome to Atomic Blend'
	String get welcome => 'Welcome to Atomic Blend';

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

	/// en: 'LifeOS is a personal life management application that helps you organize your life, achieve your goals, and improve your well-being.'
	String get description => 'LifeOS is a personal life management application that helps you organize your life, achieve your goals, and improve your well-being.';

	/// en: 'We use end-to-end encryption to protect your personal data. Your data is secure and accessible only by you.'
	String get e2ee => 'We use end-to-end encryption to protect your personal data. Your data is secure and accessible only by you.';

	/// en: 'Get started now'
	String get get_started_now => 'Get started now';

	/// en: 'I agree to the'
	String get i_agree_to => 'I agree to the';

	/// en: 'Terms of Service'
	String get terms_of_service => 'Terms of Service';
}

// Path: auth.login_or_register
class TranslationsAuthLoginOrRegisterEn {
	TranslationsAuthLoginOrRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unlock the potential of your life'
	String get title => 'Unlock the potential of your life';

	/// en: 'Log in or register'
	String get login_or_register => 'Log in or register';

	/// en: 'Log in'
	String get login => 'Log in';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'or'
	String get or => 'or';

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

	/// en: 'Forgot password'
	String get forgot_password => 'Forgot password';

	/// en: 'Log in'
	String get login => 'Log in';

	/// en: 'No account?'
	String get no_account => 'No account?';

	/// en: 'Enter your email address'
	String get email_hint => 'Enter your email address';
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

	/// en: 'email@example.com'
	String get email_hint => 'email@example.com';

	/// en: 'Choose a password'
	String get password => 'Choose a password';

	/// en: 'SuperSecure123!'
	String get password_hint => 'SuperSecure123!';

	/// en: 'Confirm your password'
	String get confirmation_hint => 'Confirm your password';

	/// en: 'Passwords do not match'
	String get password_mismatch => 'Passwords do not match';

	/// en: 'Forgot password'
	String get forgot_password => 'Forgot password';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'No account?'
	String get no_account => 'No account?';
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

	/// en: 'Enter your email address to initiate the password reset process.'
	String get description => 'Enter your email address to initiate the password reset process.';

	/// en: 'You will receive an email with a code to confirm your identity, then you'll need your mnemonic key to get access to your data.'
	String get warning => 'You will receive an email with a code to confirm your identity, then you\'ll need your mnemonic key to get access to your data.';

	/// en: 'If you don't have your mnemonic key, you will lose access to your previous data.'
	String get no_mnemonic_data_loss => 'If you don\'t have your mnemonic key, you will lose access to your previous data.';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'The email address you used to register.'
	String get email_description => 'The email address you used to register.';

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

// Path: tags.add_modal
class TranslationsTagsAddModalEn {
	TranslationsTagsAddModalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add a new tag'
	String get title => 'Add a new tag';

	/// en: 'Edit tag'
	String get edit_title => 'Edit tag';

	/// en: 'Name of the tag'
	String get name => 'Name of the tag';

	/// en: 'Work'
	String get name_hint => 'Work';

	/// en: 'Define a name for your tag, this will help you remember what it is about and be shown in notifications.'
	String get name_description => 'Define a name for your tag, this will help you remember what it is about and be shown in notifications.';

	/// en: 'Name is required'
	String get name_required => 'Name is required';

	/// en: 'Color'
	String get color => 'Color';

	/// en: 'Choose a color for your tag, this will help you remember what it is about and be shown in notifications.'
	String get color_description => 'Choose a color for your tag, this will help you remember what it is about and be shown in notifications.';

	/// en: 'Primary'
	String get primary => 'Primary';

	/// en: 'Accent'
	String get accent => 'Accent';

	/// en: 'Color wheel'
	String get wheel => 'Color wheel';
}

// Path: tags.delete
class TranslationsTagsDeleteEn {
	TranslationsTagsDeleteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete tag'
	String get title => 'Delete tag';

	/// en: 'Are you sure you want to delete this tag?'
	String get description => 'Are you sure you want to delete this tag?';

	/// en: 'This action cannot be undone and the tag will be removed from all tags associated.'
	String get warning => 'This action cannot be undone and the tag will be removed from all tags associated.';
}

// Path: tasks.folders
class TranslationsTasksFoldersEn {
	TranslationsTasksFoldersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Folders'
	String get title => 'Folders';

	/// en: 'No folders for now'
	String get no_folders => 'No folders for now';

	/// en: 'Add a folder'
	String get add_folder => 'Add a folder';

	/// en: 'Edit folder'
	String get edit_folder => 'Edit folder';

	/// en: 'Delete folder'
	String get delete_folder => 'Delete folder';

	/// en: 'Are you sure you want to delete this folder?'
	String get delete_folder_description => 'Are you sure you want to delete this folder?';

	/// en: 'This action cannot be undone and all the tasks will be unlinked'
	String get delete_folder_warning => 'This action cannot be undone and all the tasks will be unlinked';

	/// en: 'Name of the folder'
	String get name => 'Name of the folder';

	/// en: 'Work'
	String get name_hint => 'Work';

	/// en: 'Define a name for your folder, this will help you remember what it is about and be shown in notifications.'
	String get name_description => 'Define a name for your folder, this will help you remember what it is about and be shown in notifications.';

	/// en: 'Name is required'
	String get name_required => 'Name is required';

	/// en: 'Color'
	String get color => 'Color';

	/// en: 'Choose a color for your folder, this will help you remember what it is about and be shown in notifications.'
	String get color_description => 'Choose a color for your folder, this will help you remember what it is about and be shown in notifications.';

	/// en: 'Select a folder'
	String get select_a_folder => 'Select a folder';
}

// Path: tasks.due_dates
class TranslationsTasksDueDatesEn {
	TranslationsTasksDueDatesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';

	/// en: 'No due date'
	String get no_due_date => 'No due date';
}

// Path: tasks.add_task_modal
class TranslationsTasksAddTaskModalEn {
	TranslationsTasksAddTaskModalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What do you need to do?'
	String get task_title => 'What do you need to do?';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Due Date'
	String get due_date => 'Due Date';

	/// en: 'Dates'
	String get dates => 'Dates';

	/// en: 'Notes'
	String get notes => 'Notes';

	/// en: 'Start Date'
	String get start_date => 'Start Date';

	/// en: 'End Date'
	String get end_date => 'End Date';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Erase'
	String get erase => 'Erase';

	/// en: 'Task added'
	String get task_added => 'Task added';

	/// en: 'Your task has been added successfully.'
	String get task_added_description => 'Your task has been added successfully.';

	/// en: 'Task error'
	String get task_error => 'Task error';

	/// en: 'Title required'
	String get title_required => 'Title required';

	/// en: 'Please enter a title for your task'
	String get title_required_description => 'Please enter a title for your task';

	/// en: '(zero) {Reminder} (one) {Reminder} (other) {Reminders}'
	String reminders({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'Reminder',
		one: 'Reminder',
		other: 'Reminders',
	);

	/// en: 'Expected time'
	String get time_planned => 'Expected time';

	/// en: 'None'
	String get none => 'None';

	/// en: 'No reminders'
	String get no_reminders => 'No reminders';

	/// en: 'Add a Reminder'
	String get add_reminder => 'Add a Reminder';

	/// en: 'When would you like to be reminded?'
	String get when_would_you_like_to_be_reminded => 'When would you like to be reminded?';

	/// en: 'When would you like the task to start?'
	String get when_would_you_like_the_task_to_start => 'When would you like the task to start?';

	/// en: 'When would you like the task to end?'
	String get when_would_you_like_the_task_to_end => 'When would you like the task to end?';
}

// Path: tasks.add_time_entry
class TranslationsTasksAddTimeEntryEn {
	TranslationsTasksAddTimeEntryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add a time entry'
	String get title => 'Add a time entry';

	/// en: 'Manually add a time entry for this task.'
	String get description => 'Manually add a time entry for this task.';

	/// en: 'Start time'
	String get start_time => 'Start time';

	/// en: 'End time'
	String get end_time => 'End time';

	/// en: 'Not defined'
	String get not_defined => 'Not defined';

	/// en: 'Date is required'
	String get date_required => 'Date is required';
}

// Path: tasks.conflict_detected_modal
class TranslationsTasksConflictDetectedModalEn {
	TranslationsTasksConflictDetectedModalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Conflict Detected'
	String get title => 'Conflict Detected';

	/// en: 'Previous edits of this task made while offline conflicts with the current version of the task.'
	String get description => 'Previous edits of this task made while offline conflicts with the current version of the task.';

	/// en: 'You can either resolve the conflicts now or come back later to resolve them.'
	String get warning => 'You can either resolve the conflicts now or come back later to resolve them.';

	/// en: 'Resolve'
	String get resolve_now => 'Resolve';

	/// en: 'Later'
	String get later => 'Later';
}

// Path: calendar.errors
class TranslationsCalendarErrorsEn {
	TranslationsCalendarErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You cannot move a device calendar event'
	String get cannot_move_device_calendar_event => 'You cannot move a device calendar event';

	/// en: 'You cannot move a habit event'
	String get cannot_move_habit_event => 'You cannot move a habit event';

	/// en: 'You cannot resize a device calendar event'
	String get cannot_resize_device_calendar_event => 'You cannot resize a device calendar event';

	/// en: 'You cannot resize a habit event'
	String get cannot_resize_habit_event => 'You cannot resize a habit event';
}

// Path: calendar.event_detail
class TranslationsCalendarEventDetailEn {
	TranslationsCalendarEventDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'Time'
	String get time => 'Time';

	/// en: 'Organizer'
	String get organizer => 'Organizer';

	/// en: 'Reminder'
	String get reminders => 'Reminder';

	/// en: 'No reminders'
	String get no_reminders => 'No reminders';

	/// en: 'Details'
	String get details => 'Details';

	/// en: 'Join meeting'
	String get join_meeting => 'Join meeting';

	/// en: 'Google Meet Call'
	String get google_meet_call => 'Google Meet Call';

	/// en: 'Zoom Call'
	String get zoom_meet_call => 'Zoom Call';

	/// en: 'MS Teams Call'
	String get ms_teams_call => 'MS Teams Call';

	/// en: 'Join now'
	String get join_now => 'Join now';

	/// en: '(zero) {Attendee} (one) {Attendee} (other) {Attendees}'
	String attendee({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'Attendee',
		one: 'Attendee',
		other: 'Attendees',
	);

	/// en: 'No attendees'
	String get no_attendees => 'No attendees';

	/// en: 'No notes'
	String get no_notes => 'No notes';
}

// Path: calendar.settings
class TranslationsCalendarSettingsEn {
	TranslationsCalendarSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Calendar Settings'
	String get title => 'Calendar Settings';

	/// en: 'Display habits'
	String get display_habits => 'Display habits';
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

	/// en: '$'
	String get currency_symbol => '\$';

	/// en: 'Manage my subscription'
	String get manage_my_subscription => 'Manage my subscription';

	/// en: 'You can only manage your subscription from the iOS or Android app.'
	String get management_url_only_mobile => 'You can only manage your subscription from the iOS or Android app.';
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

// Path: habits.delete_habit
class TranslationsHabitsDeleteHabitEn {
	TranslationsHabitsDeleteHabitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete habit'
	String get title => 'Delete habit';

	/// en: 'Are you sure you want to delete this habit?'
	String get description => 'Are you sure you want to delete this habit?';

	/// en: 'This action cannot be undone and all the related entries will also be deleted.'
	String get warning => 'This action cannot be undone and all the related entries will also be deleted.';
}

// Path: habits.add
class TranslationsHabitsAddEn {
	TranslationsHabitsAddEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What do you want to achieve?'
	String get title => 'What do you want to achieve?';

	/// en: 'Habit name*'
	String get name => 'Habit name*';

	/// en: 'Drink water'
	String get name_hint => 'Drink water';

	/// en: 'Define a name for your habit, this will help you remember what it is about and be shown in notifications.'
	String get name_description => 'Define a name for your habit, this will help you remember what it is about and be shown in notifications.';

	/// en: 'Name is required'
	String get name_required => 'Name is required';

	/// en: 'Citation'
	String get citation => 'Citation';

	/// en: 'Add a citation to your habit, this will help you remember why you are doing it and motivate you.'
	String get citation_description => 'Add a citation to your habit, this will help you remember why you are doing it and motivate you.';

	/// en: '“Water is the only drink for a wise man.” — Henry David Thoreau'
	String get citation_hint => '“Water is the only drink for a wise man.” — Henry David Thoreau';

	/// en: 'Start date'
	String get start_date => 'Start date';

	/// en: 'End date'
	String get end_date => 'End date';

	/// en: 'When would you like the habit to start?'
	String get when_would_you_like_the_habit_to_start => 'When would you like the habit to start?';

	/// en: 'When would you like the habit to end?'
	String get when_would_you_like_the_habit_to_end => 'When would you like the habit to end?';

	/// en: 'No date selected'
	String get no_date_selected => 'No date selected';

	/// en: 'Frequency'
	String get frequency_label => 'Frequency';

	Map<String, String> get frequency => {
		'daily': 'Daily',
		'weekly': 'Weekly',
		'monthly': 'Monthly',
		'repeatition': 'Repeatition',
	};

	/// en: 'Number of times'
	String get number_of_times_label => 'Number of times';

	/// en: 'How many times do you want to do this habit? Each time the frequency is reached, it will be reseted (for example, if you set it to 3 times and a daily frequency, you will have to do it 3 times a day).'
	String get number_of_times_description => 'How many times do you want to do this habit?\nEach time the frequency is reached, it will be reseted (for example, if you set it to 3 times and a daily frequency, you will have to do it 3 times a day).';

	/// en: 'Days of the week'
	String get days_of_week_label => 'Days of the week';

	/// en: 'On which days of the week do you want to do this habit?'
	String get days_of_week_description => 'On which days of the week do you want to do this habit?';

	/// en: 'Search for an emoji'
	String get search_emoji_hint => 'Search for an emoji';

	/// en: 'Reminders'
	String get reminders_label => 'Reminders';

	/// en: 'Set a time for your reminders. You will be notified when the time is reached.'
	String get reminders_description => 'Set a time for your reminders. You will be notified when the time is reached.';

	/// en: 'Add a reminder'
	String get reminders_add => 'Add a reminder';

	/// en: 'Duration'
	String get duration_label => 'Duration';

	/// en: 'How long do you want to do this habit?'
	String get duration_description => 'How long do you want to do this habit?';

	/// en: '5 minutes'
	String get duration_hint => '5 minutes';

	/// en: 'The name of the habit should be at least 4 characters long'
	String get name_too_short => 'The name of the habit should be at least 4 characters long';

	/// en: 'You must select the same number of days as the number of times'
	String get days_of_week_mismatch => 'You must select the same number of days as the number of times';

	/// en: 'Repeatition in days'
	String get every_number_day_title => 'Repeatition in days';

	/// en: 'How many days do you want to wait before repeating this habit?'
	String get every_number_day_description => 'How many days do you want to wait before repeating this habit?';

	/// en: 'Days of the month'
	String get days_of_month_title => 'Days of the month';

	/// en: 'On which days of the month do you want to do this habit?'
	String get days_of_month_description => 'On which days of the month do you want to do this habit?';

	/// en: 'Select days'
	String get select_days => 'Select days';
}

// Path: habits.habit_detail
class TranslationsHabitsHabitDetailEn {
	TranslationsHabitsHabitDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No citation'
	String get no_citation => 'No citation';

	/// en: 'No end date'
	String get no_end_date => 'No end date';

	/// en: 'Delete habit'
	String get delete_habit => 'Delete habit';

	/// en: 'Are you sure you want to delete this habit?'
	String get delete_habit_description => 'Are you sure you want to delete this habit?';

	/// en: 'This action cannot be undone and all the related entries will also be deleted.'
	String get delete_habit_warning => 'This action cannot be undone and all the related entries will also be deleted.';

	/// en: 'Entries'
	String get entries => 'Entries';

	/// en: 'No entries for now'
	String get no_entries => 'No entries for now';

	/// en: 'Delete entry'
	String get delete_entry => 'Delete entry';

	/// en: 'Are you sure you want to delete this entry?'
	String get delete_entry_description => 'Are you sure you want to delete this entry?';

	/// en: 'This action cannot be undone.'
	String get delete_entry_warning => 'This action cannot be undone.';
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

// Path: paywall.advantages
class TranslationsPaywallAdvantagesEn {
	TranslationsPaywallAdvantagesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPaywallAdvantagesAllAppsOfTheSuiteEn all_apps_of_the_suite = TranslationsPaywallAdvantagesAllAppsOfTheSuiteEn._(_root);
	late final TranslationsPaywallAdvantagesEndToEndEncryptedEn end_to_end_encrypted = TranslationsPaywallAdvantagesEndToEndEncryptedEn._(_root);
	late final TranslationsPaywallAdvantagesUnlimitedTasksEn unlimited_tasks = TranslationsPaywallAdvantagesUnlimitedTasksEn._(_root);
	late final TranslationsPaywallAdvantagesUnlimitedHabitsEn unlimited_habits = TranslationsPaywallAdvantagesUnlimitedHabitsEn._(_root);
	late final TranslationsPaywallAdvantagesUnlimitedTagsEn unlimited_tags = TranslationsPaywallAdvantagesUnlimitedTagsEn._(_root);
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

// Path: sync.details
class TranslationsSyncDetailsEn {
	TranslationsSyncDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Details'
	String get title => 'Details';

	/// en: 'Tasks'
	String get tasks => 'Tasks';

	/// en: '(zero) {No tasks} (one) {1 task} (other) {${n} tasks}'
	String task_items({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'No tasks',
		one: '1 task',
		other: '${n} tasks',
	);
}

// Path: sync.conflict_resolver
class TranslationsSyncConflictResolverEn {
	TranslationsSyncConflictResolverEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Conflict Resolver'
	String get title => 'Conflict Resolver';

	/// en: 'Update date: ${date}'
	String patch_date({required Object date}) => 'Update date: ${date}';

	Map<String, String> get item_type => {
		'task': 'Task',
		'note': 'Note',
	};

	/// en: 'Choose between accepting or refusing the changes'
	String get choose_between => 'Choose between accepting or refusing the changes';

	/// en: 'Refuse'
	String get refuse => 'Refuse';

	/// en: 'Accept'
	String get accept => 'Accept';

	/// en: 'Upcoming'
	String get upcoming => 'Upcoming';

	/// en: 'In-app'
	String get in_app_version => 'In-app';

	/// en: 'Changes to apply'
	String get changes_to_apply => 'Changes to apply';

	/// en: 'Apply decision to all conflicts'
	String get apply_to_all => 'Apply decision to all conflicts';

	Map<String, dynamic> get fields => {
		'title': 'Title',
		'end_date': 'End date',
		'description': 'Notes',
		'start_date': 'Start date',
		'reminders_title': 'Reminders',
		'reminders': ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
			zero: 'No reminders',
			one: '1 reminder',
			other: '${n} reminders',
		),
		'undefined': 'Undefined',
		'priority': 'Priority',
		'folder': 'Folder',
		'tags': ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
			zero: 'No tags',
			one: '1 tag',
			other: '${n} tags',
		),
	};

	/// en: 'Progress'
	String get progress => 'Progress';
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

	/// en: 'Get access to all the apps of the suite, including Tasks, Habits, Calendar, Notes, and more.'
	String get description => 'Get access to all the apps of the suite, including Tasks, Habits, Calendar, Notes, and more.';
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

// Path: paywall.advantages.unlimited_tasks
class TranslationsPaywallAdvantagesUnlimitedTasksEn {
	TranslationsPaywallAdvantagesUnlimitedTasksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unlimited Tasks'
	String get title => 'Unlimited Tasks';

	/// en: 'Create as many tasks as you want, no limits.'
	String get description => 'Create as many tasks as you want, no limits.';
}

// Path: paywall.advantages.unlimited_habits
class TranslationsPaywallAdvantagesUnlimitedHabitsEn {
	TranslationsPaywallAdvantagesUnlimitedHabitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unlimited Habits'
	String get title => 'Unlimited Habits';

	/// en: 'Take a step towards a healthier life with unlimited habits.'
	String get description => 'Take a step towards a healthier life with unlimited habits.';
}

// Path: paywall.advantages.unlimited_tags
class TranslationsPaywallAdvantagesUnlimitedTagsEn {
	TranslationsPaywallAdvantagesUnlimitedTagsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unlimited Tags / Folders'
	String get title => 'Unlimited Tags / Folders';

	/// en: 'Use as many tags and folders as needed to organize your life.'
	String get description => 'Use as many tags and folders as needed to organize your life.';
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

	/// en: '100% opensource : join a community of users who support the project.'
	String get description => '100% opensource : join a community of users who support the project.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_name': return 'Atomic Blend';
			case 'app_name_saas': return 'Atomic Blend Cloud';
			case 'navigation.back': return 'Back';
			case 'auth.not_logged_in.welcome': return 'Welcome to Atomic Blend';
			case 'auth.not_logged_in.description_start': return 'Atomic Blend is the first';
			case 'auth.not_logged_in.e2e_app': return 'end-to-end encrypted app';
			case 'auth.not_logged_in.description_middle': return 'that combines all the tools you need to manage both work and personal life in one place.\n\nFrom task management to note-taking, document writing, time tracking, movie tracking, food tracking, everything stays';
			case 'auth.not_logged_in.description_middle_bold': return 'secure and seamless.';
			case 'auth.not_logged_in.description_end': return 'No more juggling multiple apps—Atomic Blend brings it all together with privacy at its core, so you can focus on what truly matters.';
			case 'auth.not_logged_in.time_to_set_things_up': return 'Time to set things up!';
			case 'auth.not_logged_in.set_up_start': return 'To use Atomic Blend and sync your data across devices, you can choose between the cloud version or a self-hosted setup.\n\nEither way, your data is';
			case 'auth.not_logged_in.set_up_middle': return 'end-to-end encrypted';
			case 'auth.not_logged_in.set_up_end': return ', ensuring that only you have access to your encryption key —';
			case 'auth.not_logged_in.set_up_end_bold': return 'not us, not anyone else.';
			case 'auth.not_logged_in.description': return 'LifeOS is a personal life management application that helps you organize your life, achieve your goals, and improve your well-being.';
			case 'auth.not_logged_in.e2ee': return 'We use end-to-end encryption to protect your personal data. Your data is secure and accessible only by you.';
			case 'auth.not_logged_in.get_started_now': return 'Get started now';
			case 'auth.not_logged_in.i_agree_to': return 'I agree to the';
			case 'auth.not_logged_in.terms_of_service': return 'Terms of Service';
			case 'auth.login_or_register.title': return 'Unlock the potential of your life';
			case 'auth.login_or_register.login_or_register': return 'Log in or register';
			case 'auth.login_or_register.login': return 'Log in';
			case 'auth.login_or_register.register': return 'Register';
			case 'auth.login_or_register.or': return 'or';
			case 'auth.login_or_register.connecting_to': return 'Connecting to: ';
			case 'auth.login.title': return '👋 Welcome back!';
			case 'auth.login.description': return 'Use you email and password to log back in and access your data.';
			case 'auth.login.email': return 'Email';
			case 'auth.login.forgot_password': return 'Forgot password';
			case 'auth.login.login': return 'Log in';
			case 'auth.login.no_account': return 'No account?';
			case 'auth.login.email_hint': return 'Enter your email address';
			case 'auth.register.email': return 'What’s your email ?';
			case 'auth.register.email_description': return 'Your email is used only for login and password recovery purposes.';
			case 'auth.register.we_never_sell': return 'We will never sell your data to third parties.';
			case 'auth.register.email_hint': return 'email@example.com';
			case 'auth.register.password': return 'Choose a password';
			case 'auth.register.password_hint': return 'SuperSecure123!';
			case 'auth.register.confirmation_hint': return 'Confirm your password';
			case 'auth.register.password_mismatch': return 'Passwords do not match';
			case 'auth.register.forgot_password': return 'Forgot password';
			case 'auth.register.register': return 'Register';
			case 'auth.register.no_account': return 'No account?';
			case 'auth.delete_account.title': return 'Delete your account';
			case 'auth.delete_account.description': return 'Are you sure you want to delete your account?';
			case 'auth.delete_account.cannot_be_undone': return 'This action cannot be undone.';
			case 'auth.mnemonic_key.title': return 'Your recovery key';
			case 'auth.mnemonic_key.description_start': return 'This is your recovery key.';
			case 'auth.mnemonic_key.description_mid': return 'Write it down and keep it in a safe place.';
			case 'auth.mnemonic_key.description_end': return 'You will need it to recover access to your data if you forget your password.';
			case 'auth.mnemonic_key.mnemonic_hint': return 'Enter your recovery key';
			case 'auth.mnemonic_key.mnemonic_error': return 'Invalid recovery key';
			case 'auth.mnemonic_key.copy_success': return 'Recovery key copied to clipboard';
			case 'auth.reset_password.title': return 'Reset your password';
			case 'auth.reset_password.subtitle': return 'You don\'t remember your password?';
			case 'auth.reset_password.description': return 'Enter your email address to initiate the password reset process.';
			case 'auth.reset_password.warning': return 'You will receive an email with a code to confirm your identity, then you\'ll need your mnemonic key to get access to your data.';
			case 'auth.reset_password.no_mnemonic_data_loss': return 'If you don\'t have your mnemonic key, you will lose access to your previous data.';
			case 'auth.reset_password.email': return 'Email';
			case 'auth.reset_password.email_description': return 'The email address you used to register.';
			case 'auth.reset_password.email_hint': return 'atomicblend@gmail.com';
			case 'auth.reset_password.email_required': return 'Email is required';
			case 'auth.reset_password.confirmation_code': return 'Confirmation code';
			case 'auth.reset_password.confirmation_code_description': return 'Enter the code you received by email.';
			case 'auth.reset_password.confirmation_code_hint': return 'a1b5c3d4';
			case 'auth.reset_password.confirmation_code_required': return 'Confirmation code is required';
			case 'auth.reset_password.enter_the_confirmation_code': return 'Enter the confirmation code';
			case 'auth.reset_password.confirmation_code_sent': return 'A confirmation code has been sent to your email address.';
			case 'auth.reset_password.confirmation_code_sent_description': return 'Please check your inbox and enter the code below.';
			case 'auth.reset_password.do_you_have_your_mnemonic_key': return 'Do you have your backup key?';
			case 'auth.reset_password.backup_key_description': return 'This is a 12-word key that you received when you registered. It is used as a backup for your data and is required to recover your account.';
			case 'auth.reset_password.yes_i_have': return 'Yes, I have it, restore my data';
			case 'auth.reset_password.no_i_dont': return 'No, I don\'t have it, delete my data';
			case 'auth.reset_password.reset_data_warning': return 'I understand by selecting this option that all my previous data will be deleted and I will not be able to recover it.';
			case 'auth.reset_password.mnemonic_key': return 'Mnemonic key';
			case 'auth.reset_password.mnemonic_key_description': return 'Enter the backup key you received when you registered.';
			case 'auth.reset_password.mnemonic_key_hint': return 'business theme rotate together surprise wisdom powder knee view border local runway';
			case 'auth.reset_password.mnemonic_key_required': return 'Mnemonic key is required';
			case 'auth.reset_password.select_your_new_password': return 'Select your new password';
			case 'auth.reset_password.select_your_new_password_description': return 'Enter a new password to later access your account.';
			case 'auth.reset_password.new_password': return 'New password';
			case 'auth.reset_password.new_password_description': return 'Enter a new password to access your account.';
			case 'auth.reset_password.new_password_hint': return 'SuperSecure123!';
			case 'auth.reset_password.new_password_required': return 'New password is required';
			case 'auth.reset_password.confirm_new_password': return 'Confirm new password';
			case 'auth.reset_password.confirm_new_password_description': return 'Confirm your new password.';
			case 'auth.reset_password.confirm_new_password_required': return 'Confirm new password is required';
			case 'auth.reset_password.password_mismatch': return 'Passwords do not match';
			case 'auth.reset_password.password_missing': return 'Password is required';
			case 'auth.reset_password.password_too_short': return 'Password is too short';
			case 'auth.reset_password.recap_subtitle': return 'Recap of the process';
			case 'auth.reset_password.yes': return 'Yes';
			case 'auth.reset_password.no': return 'No';
			case 'auth.reset_password.confirm_reset': return 'Confirm reset';
			case 'settings.title': return 'Settings';
			case 'settings.app_settings.title': return 'App Settings';
			case 'settings.app_settings.selfHostedUrl.title': return 'Self-Hosted URL';
			case 'settings.app_settings.selfHostedUrl.description': return 'If you are using a self-hosted instance of Atomic Blend, you can enter the URL here.';
			case 'settings.app_settings.selfHostedUrl.placeholder': return 'Enter the URL of your instance';
			case 'settings.app_settings.selfHostedUrl.not_set': return 'Not set';
			case 'settings.logout': return 'Logout';
			case 'tags.title': return 'Tags';
			case 'tags.no_tags': return 'No tags';
			case 'tags.assign_tags': return 'Assign tags';
			case 'tags.add_modal.title': return 'Add a new tag';
			case 'tags.add_modal.edit_title': return 'Edit tag';
			case 'tags.add_modal.name': return 'Name of the tag';
			case 'tags.add_modal.name_hint': return 'Work';
			case 'tags.add_modal.name_description': return 'Define a name for your tag, this will help you remember what it is about and be shown in notifications.';
			case 'tags.add_modal.name_required': return 'Name is required';
			case 'tags.add_modal.color': return 'Color';
			case 'tags.add_modal.color_description': return 'Choose a color for your tag, this will help you remember what it is about and be shown in notifications.';
			case 'tags.add_modal.primary': return 'Primary';
			case 'tags.add_modal.accent': return 'Accent';
			case 'tags.add_modal.wheel': return 'Color wheel';
			case 'tags.delete.title': return 'Delete tag';
			case 'tags.delete.description': return 'Are you sure you want to delete this tag?';
			case 'tags.delete.warning': return 'This action cannot be undone and the tag will be removed from all tags associated.';
			case 'tasks.title': return 'Tasks';
			case 'tasks.today': return 'Today';
			case 'tasks.overview': return 'Overview';
			case 'tasks.inbox': return 'Inbox';
			case 'tasks.tags': return 'Tags';
			case 'tasks.all_tasks': return 'All tasks';
			case 'tasks.completed_tasks': return 'Completed tasks';
			case 'tasks.my_tags': return 'My tags';
			case 'tasks.no_tags_for_now': return 'No tags for now';
			case 'tasks.my_folders': return 'My folders';
			case 'tasks.folders.title': return 'Folders';
			case 'tasks.folders.no_folders': return 'No folders for now';
			case 'tasks.folders.add_folder': return 'Add a folder';
			case 'tasks.folders.edit_folder': return 'Edit folder';
			case 'tasks.folders.delete_folder': return 'Delete folder';
			case 'tasks.folders.delete_folder_description': return 'Are you sure you want to delete this folder?';
			case 'tasks.folders.delete_folder_warning': return 'This action cannot be undone and all the tasks will be unlinked';
			case 'tasks.folders.name': return 'Name of the folder';
			case 'tasks.folders.name_hint': return 'Work';
			case 'tasks.folders.name_description': return 'Define a name for your folder, this will help you remember what it is about and be shown in notifications.';
			case 'tasks.folders.name_required': return 'Name is required';
			case 'tasks.folders.color': return 'Color';
			case 'tasks.folders.color_description': return 'Choose a color for your folder, this will help you remember what it is about and be shown in notifications.';
			case 'tasks.folders.select_a_folder': return 'Select a folder';
			case 'tasks.nothing_to_do': return 'Nothing to do for now, enjoy your day!';
			case 'tasks.day_off': return 'You have nothing planned for tomorrow, enjoy your day!';
			case 'tasks.week_off': return 'You have nothing planned for this week, try and take the time to do the stuff left behind!';
			case 'tasks.no_tasks_for_now': return 'No tasks for now';
			case 'tasks.task_details': return 'Task Details';
			case 'tasks.time_log': return 'Time Log';
			case 'tasks.log_session': return 'Log session';
			case 'tasks.timer': return 'Timer';
			case 'tasks.pomodoro': return 'Pomodoro';
			case 'tasks.manual': return 'Manual';
			case 'tasks.from': return 'From';
			case 'tasks.to': return 'To';
			case 'tasks.priority': return 'Priority';
			case 'tasks.priorities.none': return 'None';
			case 'tasks.priorities.low': return 'Low';
			case 'tasks.priorities.medium': return 'Medium';
			case 'tasks.priorities.high': return 'High';
			case 'tasks.due_dates.today': return 'Today';
			case 'tasks.due_dates.tomorrow': return 'Tomorrow';
			case 'tasks.due_dates.no_due_date': return 'No due date';
			case 'tasks.add_task_modal.task_title': return 'What do you need to do?';
			case 'tasks.add_task_modal.description': return 'Description';
			case 'tasks.add_task_modal.due_date': return 'Due Date';
			case 'tasks.add_task_modal.dates': return 'Dates';
			case 'tasks.add_task_modal.notes': return 'Notes';
			case 'tasks.add_task_modal.start_date': return 'Start Date';
			case 'tasks.add_task_modal.end_date': return 'End Date';
			case 'tasks.add_task_modal.cancel': return 'Cancel';
			case 'tasks.add_task_modal.save': return 'Save';
			case 'tasks.add_task_modal.erase': return 'Erase';
			case 'tasks.add_task_modal.task_added': return 'Task added';
			case 'tasks.add_task_modal.task_added_description': return 'Your task has been added successfully.';
			case 'tasks.add_task_modal.task_error': return 'Task error';
			case 'tasks.add_task_modal.title_required': return 'Title required';
			case 'tasks.add_task_modal.title_required_description': return 'Please enter a title for your task';
			case 'tasks.add_task_modal.reminders': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'Reminder',
				one: 'Reminder',
				other: 'Reminders',
			);
			case 'tasks.add_task_modal.time_planned': return 'Expected time';
			case 'tasks.add_task_modal.none': return 'None';
			case 'tasks.add_task_modal.no_reminders': return 'No reminders';
			case 'tasks.add_task_modal.add_reminder': return 'Add a Reminder';
			case 'tasks.add_task_modal.when_would_you_like_to_be_reminded': return 'When would you like to be reminded?';
			case 'tasks.add_task_modal.when_would_you_like_the_task_to_start': return 'When would you like the task to start?';
			case 'tasks.add_task_modal.when_would_you_like_the_task_to_end': return 'When would you like the task to end?';
			case 'tasks.time_spent': return 'Time spent';
			case 'tasks.no_time_entries': return 'No time entries for now';
			case 'tasks.add_time_entry.title': return 'Add a time entry';
			case 'tasks.add_time_entry.description': return 'Manually add a time entry for this task.';
			case 'tasks.add_time_entry.start_time': return 'Start time';
			case 'tasks.add_time_entry.end_time': return 'End time';
			case 'tasks.add_time_entry.not_defined': return 'Not defined';
			case 'tasks.add_time_entry.date_required': return 'Date is required';
			case 'tasks.conflict_detected_modal.title': return 'Conflict Detected';
			case 'tasks.conflict_detected_modal.description': return 'Previous edits of this task made while offline conflicts with the current version of the task.';
			case 'tasks.conflict_detected_modal.warning': return 'You can either resolve the conflicts now or come back later to resolve them.';
			case 'tasks.conflict_detected_modal.resolve_now': return 'Resolve';
			case 'tasks.conflict_detected_modal.later': return 'Later';
			case 'calendar.title': return 'Calendar';
			case 'calendar.month': return 'Month';
			case 'calendar.day': return 'Day';
			case 'calendar.threeDays': return '3 Days';
			case 'calendar.week': return 'Week';
			case 'calendar.schedule': return 'Schedule';
			case 'calendar.errors.cannot_move_device_calendar_event': return 'You cannot move a device calendar event';
			case 'calendar.errors.cannot_move_habit_event': return 'You cannot move a habit event';
			case 'calendar.errors.cannot_resize_device_calendar_event': return 'You cannot resize a device calendar event';
			case 'calendar.errors.cannot_resize_habit_event': return 'You cannot resize a habit event';
			case 'calendar.event_detail.date': return 'Date';
			case 'calendar.event_detail.time': return 'Time';
			case 'calendar.event_detail.organizer': return 'Organizer';
			case 'calendar.event_detail.reminders': return 'Reminder';
			case 'calendar.event_detail.no_reminders': return 'No reminders';
			case 'calendar.event_detail.details': return 'Details';
			case 'calendar.event_detail.join_meeting': return 'Join meeting';
			case 'calendar.event_detail.google_meet_call': return 'Google Meet Call';
			case 'calendar.event_detail.zoom_meet_call': return 'Zoom Call';
			case 'calendar.event_detail.ms_teams_call': return 'MS Teams Call';
			case 'calendar.event_detail.join_now': return 'Join now';
			case 'calendar.event_detail.attendee': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'Attendee',
				one: 'Attendee',
				other: 'Attendees',
			);
			case 'calendar.event_detail.no_attendees': return 'No attendees';
			case 'calendar.event_detail.no_notes': return 'No notes';
			case 'calendar.settings.title': return 'Calendar Settings';
			case 'calendar.settings.display_habits': return 'Display habits';
			case 'account.edit_profile': return 'Edit Profile';
			case 'account.sections.account': return 'Account';
			case 'account.actions.security': return 'Security & Privacy';
			case 'account.actions.delete_account': return 'Delete my Account';
			case 'account.profile.my_profile': return 'My Profile';
			case 'account.profile.email': return 'Email';
			case 'account.profile.undefined': return 'Undefined';
			case 'account.profile.email_missing': return 'Email is required';
			case 'account.profile.email_same': return 'Email must be different from the current email';
			case 'account.subscription_payments.title': return 'Subscription & Payments';
			case 'account.subscription_payments.subscription': return ({required Object subName}) => '${subName} Subscription';
			case 'account.subscription_payments.latest_subscription': return 'This is your subscription with the earliest billing date.';
			case 'account.subscription_payments.billing_cycle': return 'Billing Cycle';
			case 'account.subscription_payments.current_price': return 'Current Price';
			case 'account.subscription_payments.next_billing_date': return 'Next Billing Date';
			case 'account.subscription_payments.payment_history': return 'Payment History';
			case 'account.subscription_payments.no_payments': return 'No payments for now';
			case 'account.subscription_payments.currency_symbol': return '\$';
			case 'account.subscription_payments.manage_my_subscription': return 'Manage my subscription';
			case 'account.subscription_payments.management_url_only_mobile': return 'You can only manage your subscription from the iOS or Android app.';
			case 'account.security_and_privacy.title': return 'Security & Privacy';
			case 'account.security_and_privacy.change_password.title': return 'Change Password';
			case 'account.security_and_privacy.change_password.old_password': return 'Old Password';
			case 'account.security_and_privacy.change_password.new_password': return 'New Password';
			case 'account.security_and_privacy.change_password.confirm_password': return 'Confirm Password';
			case 'account.security_and_privacy.change_password.old_password_required': return 'Old password is required';
			case 'account.security_and_privacy.change_password.new_password_required': return 'New password is required';
			case 'account.security_and_privacy.change_password.confirm_password_required': return 'Confirm password is required';
			case 'account.security_and_privacy.change_password.password_mismatch': return 'Passwords do not match';
			case 'account.security_and_privacy.change_password.password_hint': return 'SuperSecure123!';
			case 'account.security_and_privacy.change_password.warning_changing_pws_will_log_you_out': return 'Changing your password will log you out of the app.';
			case 'habits.title': return 'Habits';
			case 'habits.no_habits': return 'No habits for now';
			case 'habits.get_started_now': return 'Add your first habit to get started!';
			case 'habits.delete_habit.title': return 'Delete habit';
			case 'habits.delete_habit.description': return 'Are you sure you want to delete this habit?';
			case 'habits.delete_habit.warning': return 'This action cannot be undone and all the related entries will also be deleted.';
			case 'habits.add.title': return 'What do you want to achieve?';
			case 'habits.add.name': return 'Habit name*';
			case 'habits.add.name_hint': return 'Drink water';
			case 'habits.add.name_description': return 'Define a name for your habit, this will help you remember what it is about and be shown in notifications.';
			case 'habits.add.name_required': return 'Name is required';
			case 'habits.add.citation': return 'Citation';
			case 'habits.add.citation_description': return 'Add a citation to your habit, this will help you remember why you are doing it and motivate you.';
			case 'habits.add.citation_hint': return '“Water is the only drink for a wise man.” — Henry David Thoreau';
			case 'habits.add.start_date': return 'Start date';
			case 'habits.add.end_date': return 'End date';
			case 'habits.add.when_would_you_like_the_habit_to_start': return 'When would you like the habit to start?';
			case 'habits.add.when_would_you_like_the_habit_to_end': return 'When would you like the habit to end?';
			case 'habits.add.no_date_selected': return 'No date selected';
			case 'habits.add.frequency_label': return 'Frequency';
			case 'habits.add.frequency.daily': return 'Daily';
			case 'habits.add.frequency.weekly': return 'Weekly';
			case 'habits.add.frequency.monthly': return 'Monthly';
			case 'habits.add.frequency.repeatition': return 'Repeatition';
			case 'habits.add.number_of_times_label': return 'Number of times';
			case 'habits.add.number_of_times_description': return 'How many times do you want to do this habit?\nEach time the frequency is reached, it will be reseted (for example, if you set it to 3 times and a daily frequency, you will have to do it 3 times a day).';
			case 'habits.add.days_of_week_label': return 'Days of the week';
			case 'habits.add.days_of_week_description': return 'On which days of the week do you want to do this habit?';
			case 'habits.add.search_emoji_hint': return 'Search for an emoji';
			case 'habits.add.reminders_label': return 'Reminders';
			case 'habits.add.reminders_description': return 'Set a time for your reminders. You will be notified when the time is reached.';
			case 'habits.add.reminders_add': return 'Add a reminder';
			case 'habits.add.duration_label': return 'Duration';
			case 'habits.add.duration_description': return 'How long do you want to do this habit?';
			case 'habits.add.duration_hint': return '5 minutes';
			case 'habits.add.name_too_short': return 'The name of the habit should be at least 4 characters long';
			case 'habits.add.days_of_week_mismatch': return 'You must select the same number of days as the number of times';
			case 'habits.add.every_number_day_title': return 'Repeatition in days';
			case 'habits.add.every_number_day_description': return 'How many days do you want to wait before repeating this habit?';
			case 'habits.add.days_of_month_title': return 'Days of the month';
			case 'habits.add.days_of_month_description': return 'On which days of the month do you want to do this habit?';
			case 'habits.add.select_days': return 'Select days';
			case 'habits.list': return 'Habits';
			case 'habits.overview': return 'Overview';
			case 'habits.times_a_day': return ({required Object nb}) => '${nb} times a day';
			case 'habits.times_a_week': return ({required Object nb}) => '${nb} times a week';
			case 'habits.times_a_month': return ({required Object nb}) => '${nb} times a month';
			case 'habits.habit_detail.no_citation': return 'No citation';
			case 'habits.habit_detail.no_end_date': return 'No end date';
			case 'habits.habit_detail.delete_habit': return 'Delete habit';
			case 'habits.habit_detail.delete_habit_description': return 'Are you sure you want to delete this habit?';
			case 'habits.habit_detail.delete_habit_warning': return 'This action cannot be undone and all the related entries will also be deleted.';
			case 'habits.habit_detail.entries': return 'Entries';
			case 'habits.habit_detail.no_entries': return 'No entries for now';
			case 'habits.habit_detail.delete_entry': return 'Delete entry';
			case 'habits.habit_detail.delete_entry_description': return 'Are you sure you want to delete this entry?';
			case 'habits.habit_detail.delete_entry_warning': return 'This action cannot be undone.';
			case 'under_construction.title': return 'We\'re working on it!';
			case 'under_construction.description': return 'This feature is not yet available, but we\'re working hard to bring it to you soon.\n\nStay tuned!';
			case 'more.title': return 'More';
			case 'date_modes.date': return 'Date';
			case 'date_modes.duration': return 'Duration';
			case 'times.today': return 'Today';
			case 'times.tomorrow': return 'Tomorrow';
			case 'times.yesterday': return 'Yesterday';
			case 'times.this_week': return 'This week';
			case 'times.last_week': return 'Last week';
			case 'times.this_month': return 'This month';
			case 'times.last_month': return 'Last month';
			case 'times.this_year': return 'This year';
			case 'times.last_year': return 'Last year';
			case 'times.all_time': return 'All time';
			case 'times.minutes': return ({required num n, required Object nb}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: '${nb} minutes',
				one: '${nb} minute',
				other: '${nb} minutes',
			);
			case 'days_of_week.monday': return 'Monday';
			case 'days_of_week.tuesday': return 'Tuesday';
			case 'days_of_week.wednesday': return 'Wednesday';
			case 'days_of_week.thursday': return 'Thursday';
			case 'days_of_week.friday': return 'Friday';
			case 'days_of_week.saturday': return 'Saturday';
			case 'days_of_week.sunday': return 'Sunday';
			case 'days_before.none.value': return '0';
			case 'days_before.none.label': return 'None';
			case 'days_before.same_day.value': return 'same_day';
			case 'days_before.same_day.label': return 'Same day';
			case 'days_before.one_day.value': return '-1';
			case 'days_before.one_day.label': return '1 day before';
			case 'days_before.two_days.value': return '-2';
			case 'days_before.two_days.label': return '2 days before';
			case 'days_before.three_days.value': return '-3';
			case 'days_before.three_days.label': return '3 days before';
			case 'days_before.one_week.value': return '-7';
			case 'days_before.one_week.label': return '1 week before';
			case 'days_before.custom.value': return 'null';
			case 'days_before.custom.label': return 'Custom';
			case 'time_before.same_time.value': return '0';
			case 'time_before.same_time.label': return 'Same time';
			case 'time_before.five_minutes.value': return '-5';
			case 'time_before.five_minutes.label': return '5 minutes before';
			case 'time_before.fifteen_minutes.value': return '-15';
			case 'time_before.fifteen_minutes.label': return '15 minutes before';
			case 'time_before.thirty_minutes.value': return '-30';
			case 'time_before.thirty_minutes.label': return '30 minutes before';
			case 'time_before.one_hour.value': return '-60';
			case 'time_before.one_hour.label': return '1 hour before';
			case 'time_before.two_hours.value': return '-120';
			case 'time_before.two_hours.label': return '2 hours before';
			case 'time_before.one_day.value': return '-1440';
			case 'time_before.one_day.label': return '1 day before';
			case 'time_before.custom.value': return 'null';
			case 'time_before.custom.label': return 'Custom';
			case 'loading.simple': return 'Loading...';
			case 'actions.save': return 'Save';
			case 'actions.cancel': return 'Cancel';
			case 'actions.next': return 'Next';
			case 'actions.back': return 'Back';
			case 'actions.delete': return 'Delete';
			case 'actions.add': return 'Add';
			case 'actions.edit': return 'Edit';
			case 'actions.clear': return 'Clear';
			case 'actions.close': return 'Close';
			case 'actions.subscribe': return 'Subscribe';
			case 'validation.required': return 'Required';
			case 'validation.invalid_url': return 'invalid URL';
			case 'errors.wrong_email_password': return 'Email or password incorrect';
			case 'errors.email_malformed': return 'Email malformed';
			case 'errors.unknown_error': return 'Unknown error';
			case 'notifications.task_due_now': return 'The task is due';
			case 'notifications.task_starting': return 'The task is starting';
			case 'notifications.task_starting_in': return ({required Object time}) => 'The task is starting in ${time}';
			case 'notifications.habit_due_now': return 'Perform the habit now, one less thing to do!';
			case 'time_units.short.day': return 'd';
			case 'time_units.short.hour': return 'h';
			case 'time_units.short.minute': return 'm';
			case 'time_units.long.day': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'days',
				one: 'day',
				other: 'days',
			);
			case 'time_units.long.hour': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'hours',
				one: 'hour',
				other: 'hours',
			);
			case 'time_units.long.minute': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'minutes',
				one: 'minute',
				other: 'minutes',
			);
			case 'name_generator.animals.0': return 'bat';
			case 'name_generator.animals.1': return 'owl';
			case 'name_generator.animals.2': return 'fox';
			case 'name_generator.animals.3': return 'rabbit';
			case 'name_generator.animals.4': return 'otter';
			case 'name_generator.animals.5': return 'penguin';
			case 'name_generator.animals.6': return 'panda';
			case 'name_generator.animals.7': return 'squirrel';
			case 'name_generator.animals.8': return 'koala';
			case 'name_generator.animals.9': return 'tiger';
			case 'name_generator.animals.10': return 'giraffe';
			case 'name_generator.animals.11': return 'monkey';
			case 'name_generator.animals.12': return 'raccoon';
			case 'name_generator.animals.13': return 'zebra';
			case 'name_generator.animals.14': return 'kangaroo';
			case 'name_generator.animals.15': return 'parrot';
			case 'name_generator.animals.16': return 'dolphin';
			case 'name_generator.animals.17': return 'sloth';
			case 'name_generator.animals.18': return 'wolf';
			case 'name_generator.animals.19': return 'lion';
			case 'name_generator.animals.20': return 'bear';
			case 'name_generator.animals.21': return 'eagle';
			case 'name_generator.animals.22': return 'elephant';
			case 'name_generator.animals.23': return 'leopard';
			case 'name_generator.animals.24': return 'cheetah';
			case 'name_generator.animals.25': return 'hippo';
			case 'name_generator.animals.26': return 'lemur';
			case 'name_generator.animals.27': return 'frog';
			case 'name_generator.animals.28': return 'chameleon';
			case 'name_generator.animals.29': return 'lynx';
			case 'name_generator.animals.30': return 'puffin';
			case 'name_generator.animals.31': return 'seal';
			case 'name_generator.animals.32': return 'falcon';
			case 'name_generator.animals.33': return 'orca';
			case 'name_generator.animals.34': return 'meerkat';
			case 'name_generator.animals.35': return 'hedgehog';
			case 'name_generator.animals.36': return 'weasel';
			case 'name_generator.animals.37': return 'armadillo';
			case 'name_generator.animals.38': return 'wombat';
			case 'name_generator.animals.39': return 'platypus';
			case 'name_generator.animals.40': return 'badger';
			case 'name_generator.animals.41': return 'yak';
			case 'name_generator.animals.42': return 'lizard';
			case 'name_generator.animals.43': return 'beetle';
			case 'name_generator.animals.44': return 'caterpillar';
			case 'name_generator.animals.45': return 'jaguar';
			case 'name_generator.animals.46': return 'buffalo';
			case 'name_generator.animals.47': return 'stingray';
			case 'name_generator.animals.48': return 'mole';
			case 'name_generator.animals.49': return 'donkey';
			case 'name_generator.animals.50': return 'toucan';
			case 'name_generator.animals.51': return 'flamingo';
			case 'name_generator.animals.52': return 'goat';
			case 'name_generator.animals.53': return 'alpaca';
			case 'name_generator.animals.54': return 'moose';
			case 'name_generator.animals.55': return 'peacock';
			case 'name_generator.animals.56': return 'rhino';
			case 'name_generator.animals.57': return 'gecko';
			case 'name_generator.animals.58': return 'turkey';
			case 'name_generator.animals.59': return 'hamster';
			case 'name_generator.animals.60': return 'otter';
			case 'name_generator.animals.61': return 'gorilla';
			case 'name_generator.animals.62': return 'walrus';
			case 'name_generator.animals.63': return 'vulture';
			case 'name_generator.animals.64': return 'stingray';
			case 'name_generator.animals.65': return 'newt';
			case 'name_generator.animals.66': return 'iguana';
			case 'name_generator.animals.67': return 'porcupine';
			case 'name_generator.animals.68': return 'python';
			case 'name_generator.animals.69': return 'antelope';
			case 'name_generator.animals.70': return 'gibbon';
			case 'name_generator.animals.71': return 'boar';
			case 'name_generator.animals.72': return 'crane';
			case 'name_generator.animals.73': return 'emu';
			case 'name_generator.animals.74': return 'pelican';
			case 'name_generator.animals.75': return 'hyena';
			case 'name_generator.animals.76': return 'heron';
			case 'name_generator.animals.77': return 'lynx';
			case 'name_generator.animals.78': return 'lamb';
			case 'name_generator.animals.79': return 'tortoise';
			case 'name_generator.animals.80': return 'shrimp';
			case 'name_generator.animals.81': return 'lobster';
			case 'name_generator.animals.82': return 'moth';
			case 'name_generator.animals.83': return 'clam';
			case 'name_generator.animals.84': return 'pufferfish';
			case 'name_generator.animals.85': return 'starfish';
			case 'name_generator.animals.86': return 'shrike';
			case 'name_generator.animals.87': return 'robin';
			case 'name_generator.animals.88': return 'quail';
			case 'name_generator.animals.89': return 'koala';
			case 'name_generator.animals.90': return 'snail';
			case 'name_generator.animals.91': return 'slug';
			case 'name_generator.animals.92': return 'owl';
			case 'name_generator.animals.93': return 'viper';
			case 'name_generator.animals.94': return 'duck';
			case 'name_generator.animals.95': return 'swallow';
			case 'name_generator.animals.96': return 'crab';
			case 'name_generator.animals.97': return 'llama';
			case 'name_generator.animals.98': return 'mongoose';
			case 'name_generator.animals.99': return 'kitten';
			case 'name_generator.adjectives.0': return 'happy';
			case 'name_generator.adjectives.1': return 'brave';
			case 'name_generator.adjectives.2': return 'cheerful';
			case 'name_generator.adjectives.3': return 'jolly';
			case 'name_generator.adjectives.4': return 'playful';
			case 'name_generator.adjectives.5': return 'bright';
			case 'name_generator.adjectives.6': return 'silly';
			case 'name_generator.adjectives.7': return 'curious';
			case 'name_generator.adjectives.8': return 'swift';
			case 'name_generator.adjectives.9': return 'bold';
			case 'name_generator.adjectives.10': return 'mighty';
			case 'name_generator.adjectives.11': return 'clever';
			case 'name_generator.adjectives.12': return 'sneaky';
			case 'name_generator.adjectives.13': return 'gentle';
			case 'name_generator.adjectives.14': return 'fuzzy';
			case 'name_generator.adjectives.15': return 'quirky';
			case 'name_generator.adjectives.16': return 'bouncy';
			case 'name_generator.adjectives.17': return 'sparkly';
			case 'name_generator.adjectives.18': return 'zippy';
			case 'name_generator.adjectives.19': return 'chirpy';
			case 'name_generator.adjectives.20': return 'glossy';
			case 'name_generator.adjectives.21': return 'snappy';
			case 'name_generator.adjectives.22': return 'shiny';
			case 'name_generator.adjectives.23': return 'dreamy';
			case 'name_generator.adjectives.24': return 'frisky';
			case 'name_generator.adjectives.25': return 'sunny';
			case 'name_generator.adjectives.26': return 'zany';
			case 'name_generator.adjectives.27': return 'wild';
			case 'name_generator.adjectives.28': return 'funky';
			case 'name_generator.adjectives.29': return 'feisty';
			case 'name_generator.adjectives.30': return 'snug';
			case 'name_generator.adjectives.31': return 'crisp';
			case 'name_generator.adjectives.32': return 'lively';
			case 'name_generator.adjectives.33': return 'sassy';
			case 'name_generator.adjectives.34': return 'witty';
			case 'name_generator.adjectives.35': return 'spunky';
			case 'name_generator.adjectives.36': return 'perky';
			case 'name_generator.adjectives.37': return 'crafty';
			case 'name_generator.adjectives.38': return 'jazzy';
			case 'name_generator.adjectives.39': return 'dapper';
			case 'name_generator.adjectives.40': return 'smiley';
			case 'name_generator.adjectives.41': return 'lucky';
			case 'name_generator.adjectives.42': return 'peppy';
			case 'name_generator.adjectives.43': return 'peachy';
			case 'name_generator.adjectives.44': return 'tidy';
			case 'name_generator.adjectives.45': return 'chilly';
			case 'name_generator.adjectives.46': return 'breezy';
			case 'name_generator.adjectives.47': return 'giddy';
			case 'name_generator.adjectives.48': return 'graceful';
			case 'name_generator.adjectives.49': return 'plucky';
			case 'name_generator.adjectives.50': return 'dizzy';
			case 'name_generator.adjectives.51': return 'spry';
			case 'name_generator.adjectives.52': return 'whimsical';
			case 'name_generator.adjectives.53': return 'nimble';
			case 'name_generator.adjectives.54': return 'chirpy';
			case 'name_generator.adjectives.55': return 'jumpy';
			case 'name_generator.adjectives.56': return 'quirky';
			case 'name_generator.adjectives.57': return 'spicy';
			case 'name_generator.adjectives.58': return 'perky';
			case 'name_generator.adjectives.59': return 'speedy';
			case 'name_generator.adjectives.60': return 'nifty';
			case 'name_generator.adjectives.61': return 'wobbly';
			case 'name_generator.adjectives.62': return 'crunchy';
			case 'name_generator.adjectives.63': return 'cranky';
			case 'name_generator.adjectives.64': return 'snazzy';
			case 'name_generator.adjectives.65': return 'peppy';
			case 'name_generator.adjectives.66': return 'bubbly';
			case 'name_generator.adjectives.67': return 'splashy';
			case 'name_generator.adjectives.68': return 'breezy';
			case 'name_generator.adjectives.69': return 'bouncy';
			case 'name_generator.adjectives.70': return 'twinkly';
			case 'name_generator.adjectives.71': return 'gleeful';
			case 'name_generator.adjectives.72': return 'squishy';
			case 'name_generator.adjectives.73': return 'wacky';
			case 'name_generator.adjectives.74': return 'zesty';
			case 'name_generator.adjectives.75': return 'snappy';
			case 'name_generator.adjectives.76': return 'jovial';
			case 'name_generator.adjectives.77': return 'feathered';
			case 'name_generator.adjectives.78': return 'prickly';
			case 'name_generator.adjectives.79': return 'whizzy';
			case 'name_generator.adjectives.80': return 'perky';
			case 'name_generator.adjectives.81': return 'whiskery';
			case 'name_generator.adjectives.82': return 'spotty';
			case 'name_generator.adjectives.83': return 'stripy';
			case 'name_generator.adjectives.84': return 'flicky';
			case 'name_generator.adjectives.85': return 'chatty';
			case 'name_generator.adjectives.86': return 'dandy';
			case 'name_generator.adjectives.87': return 'wiggly';
			case 'name_generator.adjectives.88': return 'giggly';
			case 'name_generator.adjectives.89': return 'spiffy';
			case 'name_generator.adjectives.90': return 'jumpy';
			case 'name_generator.adjectives.91': return 'perky';
			case 'name_generator.adjectives.92': return 'skippy';
			case 'name_generator.adjectives.93': return 'fluffy';
			case 'name_generator.adjectives.94': return 'chunky';
			case 'name_generator.adjectives.95': return 'puffy';
			case 'name_generator.adjectives.96': return 'loopy';
			case 'name_generator.adjectives.97': return 'pinky';
			case 'name_generator.adjectives.98': return 'spunky';
			case 'name_generator.adjectives.99': return 'fancy';
			case 'eisenhower.small_title': return 'Eisenhower';
			case 'eisenhower.title': return 'Eisenhower Matrix';
			case 'feature_under_construction.title': return 'Feature under construction';
			case 'feature_under_construction.description': return 'This feature is not yet available, but we\'re working hard to bring it to you soon.\n\nStay tuned!';
			case 'inbox.title': return 'Inbox';
			case 'timer.title': return 'Timer';
			case 'timer.start': return 'Start';
			case 'timer.stop': return 'Stop';
			case 'timer.reset': return 'Reset';
			case 'timer.pause': return 'Pause';
			case 'timer.resume': return 'Resume';
			case 'timer.duration': return 'Duration';
			case 'timer.start_pomodoro': return 'Start pomodoro';
			case 'timer.start_stopwatch': return 'Start stopwatch';
			case 'timer.pomo_running': return 'Pomodoro running';
			case 'timer.timer_running': return 'Timer running';
			case 'timer.time_left': return ({required Object timeLeft}) => 'Time left: ${timeLeft}';
			case 'timer.start_break': return 'Start break';
			case 'timer.elapsed_time': return 'Elapsed time';
			case 'timer.remaining_time': return 'Remaining time';
			case 'timer.no_timer_running': return 'No timer running';
			case 'timer.modes.pomodoro': return 'Pomodoro';
			case 'timer.modes.stopwatch': return 'Stopwatch';
			case 'timer.select_task': return 'Select a task';
			case 'timer.select_task_to_start_timer': return 'Select a task to start the timer';
			case 'timer.completed': return 'Completed!';
			case 'timer.pomodoro_completed_message': return 'Your pomodoro session has completed! Time for a break.';
			case 'timer.stopwatch_completed_message': return 'Your stopwatch session has been completed.';
			case 'timer.task_label': return 'Task';
			case 'paywall.title': return 'Get AtomicBlend Cloud';
			case 'paywall.subtitle': return 'Enjoy Atomic Blend without restrictions and help the opensource initiative.';
			case 'paywall.advantages.all_apps_of_the_suite.title': return 'All Apps of the Suite';
			case 'paywall.advantages.all_apps_of_the_suite.description': return 'Get access to all the apps of the suite, including Tasks, Habits, Calendar, Notes, and more.';
			case 'paywall.advantages.end_to_end_encrypted.title': return 'End-to-End Encryption';
			case 'paywall.advantages.end_to_end_encrypted.description': return 'Your data is yours, forever.';
			case 'paywall.advantages.unlimited_tasks.title': return 'Unlimited Tasks';
			case 'paywall.advantages.unlimited_tasks.description': return 'Create as many tasks as you want, no limits.';
			case 'paywall.advantages.unlimited_habits.title': return 'Unlimited Habits';
			case 'paywall.advantages.unlimited_habits.description': return 'Take a step towards a healthier life with unlimited habits.';
			case 'paywall.advantages.unlimited_tags.title': return 'Unlimited Tags / Folders';
			case 'paywall.advantages.unlimited_tags.description': return 'Use as many tags and folders as needed to organize your life.';
			case 'paywall.advantages.sync_across_devices.title': return 'Sync Across Devices';
			case 'paywall.advantages.sync_across_devices.description': return 'Access your data from any device, anywhere.';
			case 'paywall.advantages.community_backed.title': return 'Community Backed';
			case 'paywall.advantages.community_backed.description': return '100% opensource : join a community of users who support the project.';
			case 'paywall.pricing.\$rc_annual.title': return 'Yearly';
			case 'paywall.pricing.\$rc_annual.price': return '\$39.99/year';
			case 'paywall.pricing.\$rc_annual.billed': return '1 month free trial';
			case 'paywall.pricing.\$rc_annual.discount': return '16% off';
			case 'paywall.pricing.\$rc_annual.start_button': return 'Start the 1-month free trial';
			case 'paywall.pricing.\$rc_monthly.title': return 'Monthly';
			case 'paywall.pricing.\$rc_monthly.price': return '\$3.99/mo';
			case 'paywall.pricing.\$rc_monthly.billed': return '1 week free trial';
			case 'paywall.pricing.\$rc_monthly.discount': return '';
			case 'paywall.pricing.\$rc_monthly.start_button': return 'Start the 1-week free trial';
			case 'paywall.pricing.cloud_yearly.title': return 'Yearly';
			case 'paywall.pricing.cloud_yearly.price': return '\$39.99/year';
			case 'paywall.pricing.cloud_yearly.billed': return '= \$3.33/month';
			case 'paywall.pricing.cloud_yearly.discount': return '16% off';
			case 'paywall.pricing.cloud_yearly.start_button': return 'Start the 1-month free trial';
			case 'paywall.pricing.cloud_monthly.title': return 'Monthly';
			case 'paywall.pricing.cloud_monthly.price': return '\$3.99/mo';
			case 'paywall.pricing.cloud_monthly.billed': return '';
			case 'paywall.pricing.cloud_monthly.discount': return '';
			case 'paywall.pricing.cloud_monthly.start_button': return 'Start the 1-week free trial';
			case 'paywall.no_package_selected': return 'No package selected';
			case 'paywall.purchase_failed': return 'Purchase failed';
			case 'paywall.restore_purchase': return 'Restore Purchase';
			case 'paywall.terms': return 'Terms of Service';
			case 'paywall.privacy_policy': return 'Privacy Policy';
			case 'paywall.payment_in_progress': return 'Payment in progress';
			case 'paywall.payment_in_progress_description': return 'Please wait while we process your payment.';
			case 'paywall.success': return 'Purchase successful';
			case 'paywall.validation_failed': return 'Validation failed';
			case 'paywall.validation_failed_description': return 'Please check your internet connection and restart the app.';
			case 'paywall.mobile_app_required': return 'Mobile app required';
			case 'paywall.payment_on_mobile_for_better_xp': return 'To offer you the best experience possible, payment and account configuration is only available on the mobile app';
			case 'paywall.ios': return 'iOS';
			case 'paywall.android': return 'Android';
			case 'search.results': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'No results found',
				one: '1 result found',
				other: '${n} results found',
			);
			case 'sync.title': return 'Synchronization';
			case 'sync.description': return 'Keep your data up to date across all your devices';
			case 'sync.status': return 'Status';
			case 'sync.loading': return 'Loading...';
			case 'sync.up_to_date': return 'Up to date';
			case 'sync.conflicts': return 'Conflicts';
			case 'sync.x_items_have_conflicts': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'No items have conflicts',
				one: '1 item has conflicts',
				other: '${n} items have conflicts',
			);
			case 'sync.details.title': return 'Details';
			case 'sync.details.tasks': return 'Tasks';
			case 'sync.details.task_items': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'No tasks',
				one: '1 task',
				other: '${n} tasks',
			);
			case 'sync.sync_now': return 'Sync now';
			case 'sync.conflict_resolver.title': return 'Conflict Resolver';
			case 'sync.conflict_resolver.patch_date': return ({required Object date}) => 'Update date: ${date}';
			case 'sync.conflict_resolver.item_type.task': return 'Task';
			case 'sync.conflict_resolver.item_type.note': return 'Note';
			case 'sync.conflict_resolver.choose_between': return 'Choose between accepting or refusing the changes';
			case 'sync.conflict_resolver.refuse': return 'Refuse';
			case 'sync.conflict_resolver.accept': return 'Accept';
			case 'sync.conflict_resolver.upcoming': return 'Upcoming';
			case 'sync.conflict_resolver.in_app_version': return 'In-app';
			case 'sync.conflict_resolver.changes_to_apply': return 'Changes to apply';
			case 'sync.conflict_resolver.apply_to_all': return 'Apply decision to all conflicts';
			case 'sync.conflict_resolver.fields.title': return 'Title';
			case 'sync.conflict_resolver.fields.end_date': return 'End date';
			case 'sync.conflict_resolver.fields.description': return 'Notes';
			case 'sync.conflict_resolver.fields.start_date': return 'Start date';
			case 'sync.conflict_resolver.fields.reminders_title': return 'Reminders';
			case 'sync.conflict_resolver.fields.reminders': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'No reminders',
				one: '1 reminder',
				other: '${n} reminders',
			);
			case 'sync.conflict_resolver.fields.undefined': return 'Undefined';
			case 'sync.conflict_resolver.fields.priority': return 'Priority';
			case 'sync.conflict_resolver.fields.folder': return 'Folder';
			case 'sync.conflict_resolver.fields.tags': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'No tags',
				one: '1 tag',
				other: '${n} tags',
			);
			case 'sync.conflict_resolver.progress': return 'Progress';
			default: return null;
		}
	}
}

