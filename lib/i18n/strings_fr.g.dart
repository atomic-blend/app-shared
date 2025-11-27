///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override String get app_name => 'Atomic Blend';
	@override String get app_name_saas => 'Atomic Blend Cloud';
	@override late final _TranslationsAuthFr auth = _TranslationsAuthFr._(_root);
	@override late final _TranslationsSettingsFr settings = _TranslationsSettingsFr._(_root);
	@override late final _TranslationsAccountFr account = _TranslationsAccountFr._(_root);
	@override late final _TranslationsActionsFr actions = _TranslationsActionsFr._(_root);
	@override late final _TranslationsLoadingFr loading = _TranslationsLoadingFr._(_root);
	@override late final _TranslationsValidationFr validation = _TranslationsValidationFr._(_root);
	@override Map<String, String> get errors => {
		'wrong_email_password': 'Adresse e-mail ou mot de passe incorrect',
		'email_malformed': 'Adresse e-mail invalide',
		'connection_error': 'Impossible de se connecter au serveur. Veuillez vérifier votre connexion Internet et réessayer.',
		'unknown_error': 'Une erreur inconnue s\'est produite',
		'domain_required': 'Le domaine est requis',
		'error_email_already_in_waiting_list': 'Cette adresse e-mail est déjà dans la liste d\'attente',
		'capacity_exceeded': 'Nous sommes complets ! Veuillez réessayer plus tard.',
	};
	@override late final _TranslationsNameGeneratorFr name_generator = _TranslationsNameGeneratorFr._(_root);
	@override late final _TranslationsPaywallFr paywall = _TranslationsPaywallFr._(_root);
	@override late final _TranslationsColorWheelFr color_wheel = _TranslationsColorWheelFr._(_root);
	@override late final _TranslationsDatesFr dates = _TranslationsDatesFr._(_root);
	@override late final _TranslationsTimeUnitsFr time_units = _TranslationsTimeUnitsFr._(_root);
	@override late final _TranslationsSyncStatusFr sync_status = _TranslationsSyncStatusFr._(_root);
	@override late final _TranslationsWaitingListFr waiting_list = _TranslationsWaitingListFr._(_root);
}

// Path: auth
class _TranslationsAuthFr implements TranslationsAuthEn {
	_TranslationsAuthFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthNotLoggedInFr not_logged_in = _TranslationsAuthNotLoggedInFr._(_root);
	@override late final _TranslationsAuthLoginOrRegisterFr login_or_register = _TranslationsAuthLoginOrRegisterFr._(_root);
	@override late final _TranslationsAuthLoginFr login = _TranslationsAuthLoginFr._(_root);
	@override late final _TranslationsAuthRegisterFr register = _TranslationsAuthRegisterFr._(_root);
	@override late final _TranslationsAuthDeleteAccountFr delete_account = _TranslationsAuthDeleteAccountFr._(_root);
	@override late final _TranslationsAuthMnemonicKeyFr mnemonic_key = _TranslationsAuthMnemonicKeyFr._(_root);
	@override late final _TranslationsAuthResetPasswordFr reset_password = _TranslationsAuthResetPasswordFr._(_root);
}

// Path: settings
class _TranslationsSettingsFr implements TranslationsSettingsEn {
	_TranslationsSettingsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres';
	@override late final _TranslationsSettingsAppSettingsFr app_settings = _TranslationsSettingsAppSettingsFr._(_root);
	@override String get logout => 'Déconnexion';
}

// Path: account
class _TranslationsAccountFr implements TranslationsAccountEn {
	_TranslationsAccountFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get edit_profile => 'Modifier le profil';
	@override late final _TranslationsAccountSectionsFr sections = _TranslationsAccountSectionsFr._(_root);
	@override late final _TranslationsAccountActionsFr actions = _TranslationsAccountActionsFr._(_root);
	@override late final _TranslationsAccountAppSettingsFr app_settings = _TranslationsAccountAppSettingsFr._(_root);
	@override late final _TranslationsAccountSubscriptionPaymentsFr subscription_payments = _TranslationsAccountSubscriptionPaymentsFr._(_root);
	@override late final _TranslationsAccountProfileFr profile = _TranslationsAccountProfileFr._(_root);
	@override late final _TranslationsAccountSecurityAndPrivacyFr security_and_privacy = _TranslationsAccountSecurityAndPrivacyFr._(_root);
}

// Path: actions
class _TranslationsActionsFr implements TranslationsActionsEn {
	_TranslationsActionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get save => 'Enregistrer';
	@override String get cancel => 'Annuler';
	@override String get next => 'Suivant';
	@override String get back => 'Retour';
	@override String get delete => 'Supprimer';
	@override String get close => 'Fermer';
	@override String get subscribe => 'S\'abonner';
}

// Path: loading
class _TranslationsLoadingFr implements TranslationsLoadingEn {
	_TranslationsLoadingFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get simple => 'Chargement en cours...';
}

// Path: validation
class _TranslationsValidationFr implements TranslationsValidationEn {
	_TranslationsValidationFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get invalid_url => 'URL invalide';
}

// Path: name_generator
class _TranslationsNameGeneratorFr implements TranslationsNameGeneratorEn {
	_TranslationsNameGeneratorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override List<String> get animals => [
		'hibou',
		'renard',
		'lapin',
		'loutre',
		'pingouin',
		'panda',
		'écureuil',
		'koala',
		'tigre',
		'girafe',
		'singe',
		'raton-laveur',
		'zèbre',
		'kangourou',
		'perroquet',
		'dauphin',
		'paresseux',
		'loup',
		'lion',
		'ours',
		'aigle',
		'éléphant',
		'léopard',
		'guépard',
		'hippopotame',
		'lemurien',
		'grenouille',
		'caméléon',
		'lynx',
		'macareux',
		'phoque',
		'faucon',
		'orque',
		'suricate',
		'hérisson',
		'belette',
		'tatou',
		'wombat',
		'ornithorynque',
		'blaireau',
		'yak',
		'lézard',
		'scarabée',
		'chenille',
		'jaguar',
		'buffle',
		'raie',
		'taupe',
		'âne',
		'toucan',
		'flamant',
		'chèvre',
		'alpaga',
		'orignal',
		'paon',
		'rhinocéros',
		'gecko',
		'dinde',
		'hamster',
		'loutre',
		'gorille',
		'morse',
		'vautour',
		'raie',
		'triton',
		'iguane',
		'porc-épic',
		'python',
		'antilope',
		'gibbon',
		'sanglier',
		'grue',
		'émeu',
		'pélican',
		'hyène',
		'héron',
		'agneau',
		'tortue',
		'crevette',
		'homard',
		'papillon de nuit',
		'palourde',
		'poisson-globe',
		'étoile de mer',
		'pie-grièche',
		'rouge-gorge',
		'caille',
		'koala',
		'escargot',
		'limace',
		'hibou',
		'vipère',
		'canard',
		'hirondelle',
		'crabe',
		'lama',
		'mangouste',
		'chaton',
	];
	@override List<String> get adjectives => [
		'joyeux',
		'courageux',
		'rigolo',
		'jovial',
		'espiègle',
		'brillant',
		'farfelu',
		'curieux',
		'rapide',
		'audacieux',
		'puissant',
		'malin',
		'rusé',
		'doux',
		'pelucheux',
		'excentrique',
		'rebondissant',
		'étincelant',
		'vif',
		'chantant',
		'lustré',
		'claquant',
		'brillant',
		'rêveur',
		'frétillant',
		'ensoleillé',
		'dingue',
		'sauvage',
		'funky',
		'intrépide',
		'confortable',
		'croquant',
		'vivant',
		'coquin',
		'spirituel',
		'dynamique',
		'pétillant',
		'astucieux',
		'élégant',
		'souriant',
		'chanceux',
		'plein d\'énergie',
		'chouette',
		'soigné',
		'frisquet',
		'venté',
		'gai',
		'gracieux',
		'courageux',
		'étourdi',
		'agile',
		'fantasque',
		'habile',
		'chanteur',
		'sautillant',
		'bizarre',
		'épicé',
		'énergique',
		'rapide',
		'pratique',
		'vacillant',
		'croustillant',
		'grognon',
		'chic',
		'plein d\'entrain',
		'bouillonnant',
		'éclaboussant',
		'venté',
		'rebondissant',
		'étincelant',
		'joyeux',
		'moelleux',
		'loufoque',
		'vivifiant',
		'claquant',
		'joyeux',
		'plumé',
		'piquant',
		'rapide',
		'vif',
		'moustachu',
		'tacheté',
		'rayé',
		'fougueux',
		'bavard',
		'distingué',
		'serpentin',
		'rigolo',
		'élégant',
		'sautillant',
		'dynamique',
		'skippy',
		'duveteux',
		'rondelet',
		'gonflé',
		'déjanté',
		'rose',
		'exubérant',
		'raffiné',
	];
}

// Path: paywall
class _TranslationsPaywallFr implements TranslationsPaywallEn {
	_TranslationsPaywallFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Obtenez AtomicBlend Cloud';
	@override String get subtitle => 'Profitez d\'Atomic Blend sans restrictions et aidez l\'initiative open source.';
	@override String get all_the_apps => 'Toutes les applications dont vous avez besoin, dans une seule suite.';
	@override String get why_choose_atomic_blend => 'Pourquoi choisir Atomic Blend Cloud ?';
	@override late final _TranslationsPaywallAdvantagesFr advantages = _TranslationsPaywallAdvantagesFr._(_root);
	@override Map<String, dynamic> get pricing => {
		'\$rc_annual': _TranslationsPaywallPricing$rcAnnualFr._(_root),
		'\$rc_monthly': _TranslationsPaywallPricing$rcMonthlyFr._(_root),
		'cloud_yearly': _TranslationsPaywallPricingCloudYearlyFr._(_root),
		'cloud_monthly': _TranslationsPaywallPricingCloudMonthlyFr._(_root),
	};
	@override String get no_package_selected => 'Aucun package sélectionné';
	@override String get purchase_failed => 'Échec de l\'achat';
	@override String get terms => 'Conditions d\'utilisation';
	@override String get privacy_policy => 'Politique de confidentialité';
	@override String get success => 'Achat réussi !';
	@override String get payment_in_progress => 'Paiement en cours';
	@override String get payment_in_progress_description => 'Veuillez patienter pendant que nous traitons votre paiement.';
	@override String get validation_failed => 'Échec de la validation';
	@override String get validation_failed_description => 'Veuillez vérifier votre connexion Internet et redémarrer l\'application.';
	@override String get mobile_app_required => 'Application mobile requise';
	@override String get payment_on_mobile_for_better_xp => 'Pour vous offrir la meilleure expérience possible, le paiement et la configuration du compte ne sont disponibles que sur l\'application mobile.';
	@override String get ios => 'iOS';
	@override String get android => 'Android';
}

// Path: color_wheel
class _TranslationsColorWheelFr implements TranslationsColorWheelEn {
	_TranslationsColorWheelFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get primary => 'Principal';
	@override String get accent => 'Accentué';
	@override String get wheel => 'Roue';
}

// Path: dates
class _TranslationsDatesFr implements TranslationsDatesEn {
	_TranslationsDatesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get today => 'Aujourd\'hui';
	@override String get tomorrow => 'Demain';
}

// Path: time_units
class _TranslationsTimeUnitsFr implements TranslationsTimeUnitsEn {
	_TranslationsTimeUnitsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTimeUnitsShortFr short = _TranslationsTimeUnitsShortFr._(_root);
	@override late final _TranslationsTimeUnitsLongFr long = _TranslationsTimeUnitsLongFr._(_root);
}

// Path: sync_status
class _TranslationsSyncStatusFr implements TranslationsSyncStatusEn {
	_TranslationsSyncStatusFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get synced => 'synchronisé';
}

// Path: waiting_list
class _TranslationsWaitingListFr implements TranslationsWaitingListEn {
	_TranslationsWaitingListFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Nous sommes complet !';
	@override String get description => 'Rejoignez la liste d\'attente pour être notifié lorsqu\'un poste s\'ouvre.';
	@override String get email_required => 'L\'adresse e-mail est requise';
	@override String get invalid_email => 'L\'adresse e-mail est invalide';
	@override String get join_waiting_list => 'Rejoindre la liste d\'attente';
	@override String get i_have_a_code => 'J\'ai un code';
	@override String get email => 'Email';
	@override String get email_hint => 'brandon@atomic-blend.com';
	@override String get back_to_home => 'Retour à l\'accueil';
	@override String get proceed_to_registration => 'Passer à l\'inscription';
}

// Path: auth.not_logged_in
class _TranslationsAuthNotLoggedInFr implements TranslationsAuthNotLoggedInEn {
	_TranslationsAuthNotLoggedInFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'Bienvenue sur Atomic Blend';
	@override String get register_to_atomic_blend => 'Inscrivez-vous à Atomic Blend';
	@override String get log_in_to_your_account => 'Atomic Blend est une une suite d\'apps chiffrées de bout en bout. Connectez-vous pour accéder à votre compte.';
	@override String get description_start => 'Atomic Blend est la première';
	@override String get e2e_app => 'application chiffrée de bout en bout';
	@override String get description_middle => 'qui regroupe tous les outils dont vous avez besoin pour gérer à la fois votre travail et votre vie personnelle en un seul endroit.\n\nDe la gestion des tâches à la prise de notes, en passant par la rédaction de documents, le suivi du temps, le suivi des films, le suivi de l\'alimentation, tout reste';
	@override String get description_middle_bold => 'sécurisé et fluide.';
	@override String get description_end => 'Fini de jongler entre plusieurs applications—Atomic Blend rassemble tout avec la confidentialité au cœur de son fonctionnement, pour que vous puissiez vous concentrer sur l’essentiel.';
	@override String get time_to_set_things_up => 'À vous de jouer !';
	@override String get set_up_start => 'Pour utiliser Atomic Blend et synchroniser vos données sur tous vos appareils, vous pouvez choisir entre la version cloud ou une installation auto-hébergée.\n\nDans les deux cas, vos données sont';
	@override String get set_up_middle => 'chiffrées de bout en bout';
	@override String get set_up_end => ', garantissant que vous seul avez accès à votre clé de chiffrement —';
	@override String get set_up_end_bold => 'ni nous, ni personne d\'autre.';
	@override String get description => 'LifeOS est une application de gestion de la vie personnelle qui vous aide à organiser votre vie, à atteindre vos objectifs et à améliorer votre bien-être.';
}

// Path: auth.login_or_register
class _TranslationsAuthLoginOrRegisterFr implements TranslationsAuthLoginOrRegisterEn {
	_TranslationsAuthLoginOrRegisterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get login => 'Se connecter';
	@override String get register => 'S\'inscrire';
	@override String get next => 'Suivant';
	@override String get connecting_to => 'Connexion à : ';
}

// Path: auth.login
class _TranslationsAuthLoginFr implements TranslationsAuthLoginEn {
	_TranslationsAuthLoginFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => '👋 Bon retour parmis nous !';
	@override String get description => 'Utilisez votre adresse e-mail et votre mot de passe pour vous reconnecter et accéder à vos données.';
	@override String get email => 'Adresse e-mail';
	@override String get username => 'Nom d\'utilisateur';
	@override String get login => 'Se connecter';
}

// Path: auth.register
class _TranslationsAuthRegisterFr implements TranslationsAuthRegisterEn {
	_TranslationsAuthRegisterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get email => 'Quelle est votre adresse e-mail ?';
	@override String get email_description => 'Votre e-mail est utilisé uniquement a des fins de connexion et de récupération de mot de passe.';
	@override String get we_never_sell => 'Nous ne vendrons jamais vos données à des tiers.';
	@override String get password => 'Choisissez un mot de passe';
	@override String get password_hint => 'SuperSecure123!';
	@override String get confirmation_hint => 'Confirmez votre mot de passe';
	@override String get password_mismatch => 'Les mots de passe ne correspondent pas';
	@override String get lets_get_to_know_you => 'Apprenons à vous connaître !';
	@override String get first_name => 'Prénom';
	@override String get first_name_hint => 'Brandon';
	@override String get last_name_hint => 'Guigo';
	@override String get last_name => 'Nom';
	@override String get username_hint => 'Brandon';
	@override String get setup_account_recovery => 'Configuration de la récupération de compte';
	@override String get backup_email => 'Email de secours';
	@override String get first_name_required => 'Le prénom est requis';
	@override String get last_name_required => 'Le nom est requis';
	@override String get backup_email_required => 'L\'email de secours est requis';
	@override String get backup_email_invalid => 'L\'email de secours est invalide';
	@override String get password_required => 'Le mot de passe est requis';
	@override String get password_invalid => 'Le mot de passe doit contenir au moins 8 caractères';
	@override String get username_required => 'Le nom d\'utilisateur est requis';
	@override String get domain_required => 'Le domaine est requis';
	@override String get personal_info_description => 'Nous avons besoin de quelques informations pour vous permettre d\'utiliser Atomic Blend.\nVous pouvez modifier ces informations plus tard dans les paramètres de votre compte.';
	@override String get backup_email_description => 'Nous avons besoin d\'un email de secours pour vous permettre de récupérer votre compte si vous oubliez votre mot de passe.\nSi vous n\'avez pas d\'email de secours, vous ne pourrez pas récupérer votre compte.';
	@override String get domain => 'Domain';
	@override String get desktop_only_step => 'En selle, Cowboy !';
	@override String get desktop_only_step_description => 'La création de votre compte Atomic Blend n\'est disponible que sur le navigateur web.';
	@override String get go_on_desktop => 'Aller sur le navigateur web';
	@override String get web_register_slow => 'Il peut prendre quelques minutes pour compléter l\'inscription. L\'application peut sembler figée, mais elle fonctionne en arrière-plan.\nCliquez une fois sur le bouton d\'inscription et attendez que l\'application vous redirige vers l\'étape suivante.';
	@override late final _TranslationsAuthRegisterPaymentEnabledFr payment_enabled = _TranslationsAuthRegisterPaymentEnabledFr._(_root);
}

// Path: auth.delete_account
class _TranslationsAuthDeleteAccountFr implements TranslationsAuthDeleteAccountEn {
	_TranslationsAuthDeleteAccountFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supprimer mon compte';
	@override String get description => 'Etes-vous sûr de vouloir supprimer votre compte ?';
	@override String get cannot_be_undone => 'Cette action est irréversible et toutes vos données seront perdues.';
}

// Path: auth.mnemonic_key
class _TranslationsAuthMnemonicKeyFr implements TranslationsAuthMnemonicKeyEn {
	_TranslationsAuthMnemonicKeyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Clé de récupération';
	@override String get description_start => 'Ceci est votre clé de récupération';
	@override String get description_mid => 'Écrivez-la sur un papier et gardez-la en sécurité.';
	@override String get description_end => 'Vous en aurez besoin pour récupérer l\'accès à vos données si vous perdez votre mot de passe.';
	@override String get mnemonic_hint => 'Entrez votre clé de récupération';
	@override String get mnemonic_error => 'Clé de récupération invalide';
	@override String get copy_success => 'Clé copiée dans le presse-papiers';
}

// Path: auth.reset_password
class _TranslationsAuthResetPasswordFr implements TranslationsAuthResetPasswordEn {
	_TranslationsAuthResetPasswordFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Reset your password';
	@override String get subtitle => 'Vous ne vous souvenez pas de votre mot de passe ?';
	@override String get warning => 'Vous allez recevoir un code par email pour réinitialiser votre mot de passe, puis vous devrez entrer votre clé de récupération pour accéder à vos données.';
	@override String get no_mnemonic_data_loss => 'Si vous ne vous rappelez pas de votre clé de récupération, vous perdrez accès à toutes vos précédentes données.';
	@override String get email => 'Email';
	@override String get no_backup_email => 'Aucun email de secours trouvé';
	@override String get no_backup_email_description => 'Contactez le support pour récupérer votre compte. Vous aurez besoin d\'un document d\'identité correspondant à votre prénom et nom.';
	@override String get email_description => 'L\'adresse e-mail utilisée pour vous inscrire.';
	@override String get email_hint => 'atomicblend@gmail.com';
	@override String get email_required => 'L\'adresse e-mail est requise';
	@override String get confirmation_code => 'Code de confirmation';
	@override String get confirmation_code_description => 'Entrez le code que vous avez reçu par e-mail.';
	@override String get confirmation_code_hint => 'a1b5c3d4';
	@override String get confirmation_code_required => 'Le code de confirmation est requis';
	@override String get enter_the_confirmation_code => 'Entrez le code de confirmation';
	@override String get confirmation_code_sent => 'Un code de confirmation a été envoyé à votre adresse e-mail.';
	@override String get confirmation_code_sent_description => 'Vérifiez votre boîte de réception et entrez le code ci-dessous.';
	@override String get do_you_have_your_mnemonic_key => 'Avez-vous votre clé de récupération ?';
	@override String get backup_key_description => 'C\'est une phrase de 12 mots qui vous a été fournie lors de votre inscription. Vous en aurez besoin pour récupérer vos données.';
	@override String get yes_i_have => 'Oui, je l\'ai et je veux récupérer mes données';
	@override String get no_i_dont => 'Non, je ne l\'ai pas et je veux supprimer mes données';
	@override String get reset_data_warning => 'Je suis conscient qu\'en sélectionnant cette option, toutes mes données seront éffacées sans aucune possibilité de récupération.';
	@override String get mnemonic_key => 'Clé de récupération';
	@override String get mnemonic_key_description => 'Saisis votre clé de récupération pour accéder à vos données.';
	@override String get mnemonic_key_hint => 'business theme rotate together surprise wisdom powder knee view border local runway';
	@override String get mnemonic_key_required => 'La clé de récupération est requise';
	@override String get select_your_new_password => 'Sélectionnez votre nouveau mot de passe';
	@override String get select_your_new_password_description => 'Entrez un mot de passe fort pour protéger votre compte.';
	@override String get new_password => 'Nouveau mot de passe';
	@override String get new_password_description => 'Entrez un nouveau mot de passe pour votre compte.';
	@override String get new_password_hint => 'SuperSecure123!';
	@override String get new_password_required => 'Nouveau mot de passe requis';
	@override String get confirm_new_password => 'Confirmer le mot de passe';
	@override String get confirm_new_password_description => 'Entrez à nouveau votre mot de passe pour le confirmer.';
	@override String get confirm_new_password_required => 'Confirmer le mot de passe requis';
	@override String get password_mismatch => 'Les mots de passe ne correspondent pas';
	@override String get password_missing => 'Mot de passe manquant';
	@override String get password_too_short => 'Le mot de passe doit contenir au moins 8 caractères';
	@override String get recap_subtitle => 'Récapitulatif de la réinitialisation';
	@override String get yes => 'Oui';
	@override String get no => 'Non';
	@override String get confirm_reset => 'Confirmer la réinitialisation';
	@override String get success => 'Réinitialisation du mot de passe réussie';
	@override String get success_description => 'Vous pouvez maintenant vous connecter avec votre nouveau mot de passe.';
}

// Path: settings.app_settings
class _TranslationsSettingsAppSettingsFr implements TranslationsSettingsAppSettingsEn {
	_TranslationsSettingsAppSettingsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres de l\'application';
	@override late final _TranslationsSettingsAppSettingsSelfHostedUrlFr selfHostedUrl = _TranslationsSettingsAppSettingsSelfHostedUrlFr._(_root);
}

// Path: account.sections
class _TranslationsAccountSectionsFr implements TranslationsAccountSectionsEn {
	_TranslationsAccountSectionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get account => 'Compte';
}

// Path: account.actions
class _TranslationsAccountActionsFr implements TranslationsAccountActionsEn {
	_TranslationsAccountActionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get security => 'Sécurité et confidentialité';
	@override String get delete_account => 'Supprimer mon compte';
}

// Path: account.app_settings
class _TranslationsAccountAppSettingsFr implements TranslationsAccountAppSettingsEn {
	_TranslationsAccountAppSettingsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres de l\'application';
}

// Path: account.subscription_payments
class _TranslationsAccountSubscriptionPaymentsFr implements TranslationsAccountSubscriptionPaymentsEn {
	_TranslationsAccountSubscriptionPaymentsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Abonnement & Paiements';
	@override String subscription({required Object subName}) => 'Abonnement ${subName}';
	@override String get latest_subscription => 'Ceci est votre abonnement avec la date de facturation la plus récente.';
	@override String get billing_cycle => 'Cycle de facturation';
	@override String get current_price => 'Prix actuel';
	@override String get next_billing_date => 'Prochaine date de facturation';
	@override String get payment_history => 'Historique des paiements';
	@override String get no_payments => 'Aucun paiement trouvé';
	@override String get manage_my_subscription => 'Gérer mon abonnement';
	@override String get management_url_web_only => 'Vous ne pouvez gérer votre abonnement que depuis le web.';
	@override String get payment_disabled => 'Les paiements et abonnements sont désactivés pour cette instance.';
	@override String get payment_provider => 'Fournisseur de paiement';
	@override String get stripe_description => 'Les paiements sont gérés par Stripe.\nVos informations de paiement sont sécurisées et ne sont pas stockées sur nos serveurs.';
	@override String get cant_load_customer_portal => 'Impossible de charger le portail client';
}

// Path: account.profile
class _TranslationsAccountProfileFr implements TranslationsAccountProfileEn {
	_TranslationsAccountProfileFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get my_profile => 'Mon profil';
	@override String get email => 'Adresse e-mail';
	@override String get undefined => 'Non défini';
	@override String get email_missing => 'Adresse e-mail manquante';
	@override String get email_same => 'L\'adresse e-mail doit être différente de l\'adresse e-mail actuelle';
}

// Path: account.security_and_privacy
class _TranslationsAccountSecurityAndPrivacyFr implements TranslationsAccountSecurityAndPrivacyEn {
	_TranslationsAccountSecurityAndPrivacyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sécurité et confidentialité';
	@override late final _TranslationsAccountSecurityAndPrivacyChangePasswordFr change_password = _TranslationsAccountSecurityAndPrivacyChangePasswordFr._(_root);
}

// Path: paywall.advantages
class _TranslationsPaywallAdvantagesFr implements TranslationsPaywallAdvantagesEn {
	_TranslationsPaywallAdvantagesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsPaywallAdvantagesAllAppsOfTheSuiteFr all_apps_of_the_suite = _TranslationsPaywallAdvantagesAllAppsOfTheSuiteFr._(_root);
	@override late final _TranslationsPaywallAdvantagesEndToEndEncryptedFr end_to_end_encrypted = _TranslationsPaywallAdvantagesEndToEndEncryptedFr._(_root);
	@override late final _TranslationsPaywallAdvantagesSyncAcrossDevicesFr sync_across_devices = _TranslationsPaywallAdvantagesSyncAcrossDevicesFr._(_root);
	@override late final _TranslationsPaywallAdvantagesCommunityBackedFr community_backed = _TranslationsPaywallAdvantagesCommunityBackedFr._(_root);
}

// Path: paywall.pricing.\$rc_annual
class _TranslationsPaywallPricing$rcAnnualFr implements TranslationsPaywallPricing$rcAnnualEn {
	_TranslationsPaywallPricing$rcAnnualFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Annuel';
	@override String get price => '39.99€/an';
	@override String get billed => 'soit 3.33€/mois';
	@override String get discount => '16% off';
	@override String get start_button => 'Démarrer l\'essai gratuit de 1 mois';
}

// Path: paywall.pricing.\$rc_monthly
class _TranslationsPaywallPricing$rcMonthlyFr implements TranslationsPaywallPricing$rcMonthlyEn {
	_TranslationsPaywallPricing$rcMonthlyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mensuel';
	@override String get price => '3.99€/mois';
	@override String get billed => '';
	@override String get discount => '';
	@override String get start_button => 'Démarrer l\'essai gratuit de 1 semaine';
}

// Path: paywall.pricing.cloud_yearly
class _TranslationsPaywallPricingCloudYearlyFr implements TranslationsPaywallPricingCloudYearlyEn {
	_TranslationsPaywallPricingCloudYearlyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Annuel';
	@override String get price => '39.99€/an';
	@override String get billed => 'soit 3.33€/mois';
	@override String get discount => '16% off';
	@override String get start_button => 'Démarrer l\'essai gratuit de 1 mois';
}

// Path: paywall.pricing.cloud_monthly
class _TranslationsPaywallPricingCloudMonthlyFr implements TranslationsPaywallPricingCloudMonthlyEn {
	_TranslationsPaywallPricingCloudMonthlyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mensuel';
	@override String get price => '3.99€/mois';
	@override String get billed => '';
	@override String get discount => '';
	@override String get start_button => 'Démarrer l\'essai gratuit de 1 semaine';
}

// Path: time_units.short
class _TranslationsTimeUnitsShortFr implements TranslationsTimeUnitsShortEn {
	_TranslationsTimeUnitsShortFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get day => 'j';
	@override String get hour => 'h';
	@override String get minute => 'm';
}

// Path: time_units.long
class _TranslationsTimeUnitsLongFr implements TranslationsTimeUnitsLongEn {
	_TranslationsTimeUnitsLongFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'jours',
		one: 'jour',
		other: 'jours',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'heures',
		one: 'heure',
		other: 'heures',
	);
	@override String minute({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'minutes',
		one: 'minute',
		other: 'minutes',
	);
}

// Path: auth.register.payment_enabled
class _TranslationsAuthRegisterPaymentEnabledFr implements TranslationsAuthRegisterPaymentEnabledEn {
	_TranslationsAuthRegisterPaymentEnabledFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Carte de crédit requise';
	@override String get description => 'Atomic Blend est un projet opensource. En tant que développeur indépendant finançant le projet, je ne peux pas offrir de version gratuite.';
}

// Path: settings.app_settings.selfHostedUrl
class _TranslationsSettingsAppSettingsSelfHostedUrlFr implements TranslationsSettingsAppSettingsSelfHostedUrlEn {
	_TranslationsSettingsAppSettingsSelfHostedUrlFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL auto-hébergée';
	@override String get description => 'Si vous utilisez une instance auto-hébergée d\'Atomic Blend, vous pouvez saisir l\'URL ici.';
	@override String get placeholder => 'Entrez l\'URL de votre instance';
	@override String get not_set => 'Non défini';
}

// Path: account.security_and_privacy.change_password
class _TranslationsAccountSecurityAndPrivacyChangePasswordFr implements TranslationsAccountSecurityAndPrivacyChangePasswordEn {
	_TranslationsAccountSecurityAndPrivacyChangePasswordFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changer le mot de passe';
	@override String get old_password => 'Ancien mot de passe';
	@override String get new_password => 'Nouveau mot de passe';
	@override String get confirm_password => 'Confirmer le mot de passe';
	@override String get old_password_required => 'Ancien mot de passe requis';
	@override String get new_password_required => 'Nouveau mot de passe requis';
	@override String get confirm_password_required => 'Confirmer le mot de passe requis';
	@override String get password_mismatch => 'Les mots de passe ne correspondent pas';
	@override String get password_hint => 'SuperSecure123!';
	@override String get warning_changing_pws_will_log_you_out => 'Changer le mot de passe vous déconnectera de l\'application.';
}

// Path: paywall.advantages.all_apps_of_the_suite
class _TranslationsPaywallAdvantagesAllAppsOfTheSuiteFr implements TranslationsPaywallAdvantagesAllAppsOfTheSuiteEn {
	_TranslationsPaywallAdvantagesAllAppsOfTheSuiteFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Toutes les applications de la suite';
	@override String get description => 'Accédez à toutes les applications de la suite: mail, calendrier, etc...';
}

// Path: paywall.advantages.end_to_end_encrypted
class _TranslationsPaywallAdvantagesEndToEndEncryptedFr implements TranslationsPaywallAdvantagesEndToEndEncryptedEn {
	_TranslationsPaywallAdvantagesEndToEndEncryptedFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chiffrement de bout en bout';
	@override String get description => 'Vos données sont à vous, pour toujours.';
}

// Path: paywall.advantages.sync_across_devices
class _TranslationsPaywallAdvantagesSyncAcrossDevicesFr implements TranslationsPaywallAdvantagesSyncAcrossDevicesEn {
	_TranslationsPaywallAdvantagesSyncAcrossDevicesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Synchronisation entre appareils';
	@override String get description => 'Accédez à vos données depuis n\'importe quel appareil, n\'importe où.';
}

// Path: paywall.advantages.community_backed
class _TranslationsPaywallAdvantagesCommunityBackedFr implements TranslationsPaywallAdvantagesCommunityBackedEn {
	_TranslationsPaywallAdvantagesCommunityBackedFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Soutien de la communauté';
	@override String get description => '100% opensource : rejoignez une communauté de contributeurs.';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app_name' => 'Atomic Blend',
			'app_name_saas' => 'Atomic Blend Cloud',
			'auth.not_logged_in.welcome' => 'Bienvenue sur Atomic Blend',
			'auth.not_logged_in.register_to_atomic_blend' => 'Inscrivez-vous à Atomic Blend',
			'auth.not_logged_in.log_in_to_your_account' => 'Atomic Blend est une une suite d\'apps chiffrées de bout en bout. Connectez-vous pour accéder à votre compte.',
			'auth.not_logged_in.description_start' => 'Atomic Blend est la première',
			'auth.not_logged_in.e2e_app' => 'application chiffrée de bout en bout',
			'auth.not_logged_in.description_middle' => 'qui regroupe tous les outils dont vous avez besoin pour gérer à la fois votre travail et votre vie personnelle en un seul endroit.\n\nDe la gestion des tâches à la prise de notes, en passant par la rédaction de documents, le suivi du temps, le suivi des films, le suivi de l\'alimentation, tout reste',
			'auth.not_logged_in.description_middle_bold' => 'sécurisé et fluide.',
			'auth.not_logged_in.description_end' => 'Fini de jongler entre plusieurs applications—Atomic Blend rassemble tout avec la confidentialité au cœur de son fonctionnement, pour que vous puissiez vous concentrer sur l’essentiel.',
			'auth.not_logged_in.time_to_set_things_up' => 'À vous de jouer !',
			'auth.not_logged_in.set_up_start' => 'Pour utiliser Atomic Blend et synchroniser vos données sur tous vos appareils, vous pouvez choisir entre la version cloud ou une installation auto-hébergée.\n\nDans les deux cas, vos données sont',
			'auth.not_logged_in.set_up_middle' => 'chiffrées de bout en bout',
			'auth.not_logged_in.set_up_end' => ', garantissant que vous seul avez accès à votre clé de chiffrement —',
			'auth.not_logged_in.set_up_end_bold' => 'ni nous, ni personne d\'autre.',
			'auth.not_logged_in.description' => 'LifeOS est une application de gestion de la vie personnelle qui vous aide à organiser votre vie, à atteindre vos objectifs et à améliorer votre bien-être.',
			'auth.login_or_register.login' => 'Se connecter',
			'auth.login_or_register.register' => 'S\'inscrire',
			'auth.login_or_register.next' => 'Suivant',
			'auth.login_or_register.connecting_to' => 'Connexion à : ',
			'auth.login.title' => '👋 Bon retour parmis nous !',
			'auth.login.description' => 'Utilisez votre adresse e-mail et votre mot de passe pour vous reconnecter et accéder à vos données.',
			'auth.login.email' => 'Adresse e-mail',
			'auth.login.username' => 'Nom d\'utilisateur',
			'auth.login.login' => 'Se connecter',
			'auth.register.email' => 'Quelle est votre adresse e-mail ?',
			'auth.register.email_description' => 'Votre e-mail est utilisé uniquement a des fins de connexion et de récupération de mot de passe.',
			'auth.register.we_never_sell' => 'Nous ne vendrons jamais vos données à des tiers.',
			'auth.register.password' => 'Choisissez un mot de passe',
			'auth.register.password_hint' => 'SuperSecure123!',
			'auth.register.confirmation_hint' => 'Confirmez votre mot de passe',
			'auth.register.password_mismatch' => 'Les mots de passe ne correspondent pas',
			'auth.register.lets_get_to_know_you' => 'Apprenons à vous connaître !',
			'auth.register.first_name' => 'Prénom',
			'auth.register.first_name_hint' => 'Brandon',
			'auth.register.last_name_hint' => 'Guigo',
			'auth.register.last_name' => 'Nom',
			'auth.register.username_hint' => 'Brandon',
			'auth.register.setup_account_recovery' => 'Configuration de la récupération de compte',
			'auth.register.backup_email' => 'Email de secours',
			'auth.register.first_name_required' => 'Le prénom est requis',
			'auth.register.last_name_required' => 'Le nom est requis',
			'auth.register.backup_email_required' => 'L\'email de secours est requis',
			'auth.register.backup_email_invalid' => 'L\'email de secours est invalide',
			'auth.register.password_required' => 'Le mot de passe est requis',
			'auth.register.password_invalid' => 'Le mot de passe doit contenir au moins 8 caractères',
			'auth.register.username_required' => 'Le nom d\'utilisateur est requis',
			'auth.register.domain_required' => 'Le domaine est requis',
			'auth.register.personal_info_description' => 'Nous avons besoin de quelques informations pour vous permettre d\'utiliser Atomic Blend.\nVous pouvez modifier ces informations plus tard dans les paramètres de votre compte.',
			'auth.register.backup_email_description' => 'Nous avons besoin d\'un email de secours pour vous permettre de récupérer votre compte si vous oubliez votre mot de passe.\nSi vous n\'avez pas d\'email de secours, vous ne pourrez pas récupérer votre compte.',
			'auth.register.domain' => 'Domain',
			'auth.register.desktop_only_step' => 'En selle, Cowboy !',
			'auth.register.desktop_only_step_description' => 'La création de votre compte Atomic Blend n\'est disponible que sur le navigateur web.',
			'auth.register.go_on_desktop' => 'Aller sur le navigateur web',
			'auth.register.web_register_slow' => 'Il peut prendre quelques minutes pour compléter l\'inscription. L\'application peut sembler figée, mais elle fonctionne en arrière-plan.\nCliquez une fois sur le bouton d\'inscription et attendez que l\'application vous redirige vers l\'étape suivante.',
			'auth.register.payment_enabled.title' => 'Carte de crédit requise',
			'auth.register.payment_enabled.description' => 'Atomic Blend est un projet opensource. En tant que développeur indépendant finançant le projet, je ne peux pas offrir de version gratuite.',
			'auth.delete_account.title' => 'Supprimer mon compte',
			'auth.delete_account.description' => 'Etes-vous sûr de vouloir supprimer votre compte ?',
			'auth.delete_account.cannot_be_undone' => 'Cette action est irréversible et toutes vos données seront perdues.',
			'auth.mnemonic_key.title' => 'Clé de récupération',
			'auth.mnemonic_key.description_start' => 'Ceci est votre clé de récupération',
			'auth.mnemonic_key.description_mid' => 'Écrivez-la sur un papier et gardez-la en sécurité.',
			'auth.mnemonic_key.description_end' => 'Vous en aurez besoin pour récupérer l\'accès à vos données si vous perdez votre mot de passe.',
			'auth.mnemonic_key.mnemonic_hint' => 'Entrez votre clé de récupération',
			'auth.mnemonic_key.mnemonic_error' => 'Clé de récupération invalide',
			'auth.mnemonic_key.copy_success' => 'Clé copiée dans le presse-papiers',
			'auth.reset_password.title' => 'Reset your password',
			'auth.reset_password.subtitle' => 'Vous ne vous souvenez pas de votre mot de passe ?',
			'auth.reset_password.warning' => 'Vous allez recevoir un code par email pour réinitialiser votre mot de passe, puis vous devrez entrer votre clé de récupération pour accéder à vos données.',
			'auth.reset_password.no_mnemonic_data_loss' => 'Si vous ne vous rappelez pas de votre clé de récupération, vous perdrez accès à toutes vos précédentes données.',
			'auth.reset_password.email' => 'Email',
			'auth.reset_password.no_backup_email' => 'Aucun email de secours trouvé',
			'auth.reset_password.no_backup_email_description' => 'Contactez le support pour récupérer votre compte. Vous aurez besoin d\'un document d\'identité correspondant à votre prénom et nom.',
			'auth.reset_password.email_description' => 'L\'adresse e-mail utilisée pour vous inscrire.',
			'auth.reset_password.email_hint' => 'atomicblend@gmail.com',
			'auth.reset_password.email_required' => 'L\'adresse e-mail est requise',
			'auth.reset_password.confirmation_code' => 'Code de confirmation',
			'auth.reset_password.confirmation_code_description' => 'Entrez le code que vous avez reçu par e-mail.',
			'auth.reset_password.confirmation_code_hint' => 'a1b5c3d4',
			'auth.reset_password.confirmation_code_required' => 'Le code de confirmation est requis',
			'auth.reset_password.enter_the_confirmation_code' => 'Entrez le code de confirmation',
			'auth.reset_password.confirmation_code_sent' => 'Un code de confirmation a été envoyé à votre adresse e-mail.',
			'auth.reset_password.confirmation_code_sent_description' => 'Vérifiez votre boîte de réception et entrez le code ci-dessous.',
			'auth.reset_password.do_you_have_your_mnemonic_key' => 'Avez-vous votre clé de récupération ?',
			'auth.reset_password.backup_key_description' => 'C\'est une phrase de 12 mots qui vous a été fournie lors de votre inscription. Vous en aurez besoin pour récupérer vos données.',
			'auth.reset_password.yes_i_have' => 'Oui, je l\'ai et je veux récupérer mes données',
			'auth.reset_password.no_i_dont' => 'Non, je ne l\'ai pas et je veux supprimer mes données',
			'auth.reset_password.reset_data_warning' => 'Je suis conscient qu\'en sélectionnant cette option, toutes mes données seront éffacées sans aucune possibilité de récupération.',
			'auth.reset_password.mnemonic_key' => 'Clé de récupération',
			'auth.reset_password.mnemonic_key_description' => 'Saisis votre clé de récupération pour accéder à vos données.',
			'auth.reset_password.mnemonic_key_hint' => 'business theme rotate together surprise wisdom powder knee view border local runway',
			'auth.reset_password.mnemonic_key_required' => 'La clé de récupération est requise',
			'auth.reset_password.select_your_new_password' => 'Sélectionnez votre nouveau mot de passe',
			'auth.reset_password.select_your_new_password_description' => 'Entrez un mot de passe fort pour protéger votre compte.',
			'auth.reset_password.new_password' => 'Nouveau mot de passe',
			'auth.reset_password.new_password_description' => 'Entrez un nouveau mot de passe pour votre compte.',
			'auth.reset_password.new_password_hint' => 'SuperSecure123!',
			'auth.reset_password.new_password_required' => 'Nouveau mot de passe requis',
			'auth.reset_password.confirm_new_password' => 'Confirmer le mot de passe',
			'auth.reset_password.confirm_new_password_description' => 'Entrez à nouveau votre mot de passe pour le confirmer.',
			'auth.reset_password.confirm_new_password_required' => 'Confirmer le mot de passe requis',
			'auth.reset_password.password_mismatch' => 'Les mots de passe ne correspondent pas',
			'auth.reset_password.password_missing' => 'Mot de passe manquant',
			'auth.reset_password.password_too_short' => 'Le mot de passe doit contenir au moins 8 caractères',
			'auth.reset_password.recap_subtitle' => 'Récapitulatif de la réinitialisation',
			'auth.reset_password.yes' => 'Oui',
			'auth.reset_password.no' => 'Non',
			'auth.reset_password.confirm_reset' => 'Confirmer la réinitialisation',
			'auth.reset_password.success' => 'Réinitialisation du mot de passe réussie',
			'auth.reset_password.success_description' => 'Vous pouvez maintenant vous connecter avec votre nouveau mot de passe.',
			'settings.title' => 'Paramètres',
			'settings.app_settings.title' => 'Paramètres de l\'application',
			'settings.app_settings.selfHostedUrl.title' => 'URL auto-hébergée',
			'settings.app_settings.selfHostedUrl.description' => 'Si vous utilisez une instance auto-hébergée d\'Atomic Blend, vous pouvez saisir l\'URL ici.',
			'settings.app_settings.selfHostedUrl.placeholder' => 'Entrez l\'URL de votre instance',
			'settings.app_settings.selfHostedUrl.not_set' => 'Non défini',
			'settings.logout' => 'Déconnexion',
			'account.edit_profile' => 'Modifier le profil',
			'account.sections.account' => 'Compte',
			'account.actions.security' => 'Sécurité et confidentialité',
			'account.actions.delete_account' => 'Supprimer mon compte',
			'account.app_settings.title' => 'Paramètres de l\'application',
			'account.subscription_payments.title' => 'Abonnement & Paiements',
			'account.subscription_payments.subscription' => ({required Object subName}) => 'Abonnement ${subName}',
			'account.subscription_payments.latest_subscription' => 'Ceci est votre abonnement avec la date de facturation la plus récente.',
			'account.subscription_payments.billing_cycle' => 'Cycle de facturation',
			'account.subscription_payments.current_price' => 'Prix actuel',
			'account.subscription_payments.next_billing_date' => 'Prochaine date de facturation',
			'account.subscription_payments.payment_history' => 'Historique des paiements',
			'account.subscription_payments.no_payments' => 'Aucun paiement trouvé',
			'account.subscription_payments.manage_my_subscription' => 'Gérer mon abonnement',
			'account.subscription_payments.management_url_web_only' => 'Vous ne pouvez gérer votre abonnement que depuis le web.',
			'account.subscription_payments.payment_disabled' => 'Les paiements et abonnements sont désactivés pour cette instance.',
			'account.subscription_payments.payment_provider' => 'Fournisseur de paiement',
			'account.subscription_payments.stripe_description' => 'Les paiements sont gérés par Stripe.\nVos informations de paiement sont sécurisées et ne sont pas stockées sur nos serveurs.',
			'account.subscription_payments.cant_load_customer_portal' => 'Impossible de charger le portail client',
			'account.profile.my_profile' => 'Mon profil',
			'account.profile.email' => 'Adresse e-mail',
			'account.profile.undefined' => 'Non défini',
			'account.profile.email_missing' => 'Adresse e-mail manquante',
			'account.profile.email_same' => 'L\'adresse e-mail doit être différente de l\'adresse e-mail actuelle',
			'account.security_and_privacy.title' => 'Sécurité et confidentialité',
			'account.security_and_privacy.change_password.title' => 'Changer le mot de passe',
			'account.security_and_privacy.change_password.old_password' => 'Ancien mot de passe',
			'account.security_and_privacy.change_password.new_password' => 'Nouveau mot de passe',
			'account.security_and_privacy.change_password.confirm_password' => 'Confirmer le mot de passe',
			'account.security_and_privacy.change_password.old_password_required' => 'Ancien mot de passe requis',
			'account.security_and_privacy.change_password.new_password_required' => 'Nouveau mot de passe requis',
			'account.security_and_privacy.change_password.confirm_password_required' => 'Confirmer le mot de passe requis',
			'account.security_and_privacy.change_password.password_mismatch' => 'Les mots de passe ne correspondent pas',
			'account.security_and_privacy.change_password.password_hint' => 'SuperSecure123!',
			'account.security_and_privacy.change_password.warning_changing_pws_will_log_you_out' => 'Changer le mot de passe vous déconnectera de l\'application.',
			'actions.save' => 'Enregistrer',
			'actions.cancel' => 'Annuler',
			'actions.next' => 'Suivant',
			'actions.back' => 'Retour',
			'actions.delete' => 'Supprimer',
			'actions.close' => 'Fermer',
			'actions.subscribe' => 'S\'abonner',
			'loading.simple' => 'Chargement en cours...',
			'validation.invalid_url' => 'URL invalide',
			'errors.wrong_email_password' => 'Adresse e-mail ou mot de passe incorrect',
			'errors.email_malformed' => 'Adresse e-mail invalide',
			'errors.connection_error' => 'Impossible de se connecter au serveur. Veuillez vérifier votre connexion Internet et réessayer.',
			'errors.unknown_error' => 'Une erreur inconnue s\'est produite',
			'errors.domain_required' => 'Le domaine est requis',
			'errors.error_email_already_in_waiting_list' => 'Cette adresse e-mail est déjà dans la liste d\'attente',
			'errors.capacity_exceeded' => 'Nous sommes complets ! Veuillez réessayer plus tard.',
			'name_generator.animals.0' => 'hibou',
			'name_generator.animals.1' => 'renard',
			'name_generator.animals.2' => 'lapin',
			'name_generator.animals.3' => 'loutre',
			'name_generator.animals.4' => 'pingouin',
			'name_generator.animals.5' => 'panda',
			'name_generator.animals.6' => 'écureuil',
			'name_generator.animals.7' => 'koala',
			'name_generator.animals.8' => 'tigre',
			'name_generator.animals.9' => 'girafe',
			'name_generator.animals.10' => 'singe',
			'name_generator.animals.11' => 'raton-laveur',
			'name_generator.animals.12' => 'zèbre',
			'name_generator.animals.13' => 'kangourou',
			'name_generator.animals.14' => 'perroquet',
			'name_generator.animals.15' => 'dauphin',
			'name_generator.animals.16' => 'paresseux',
			'name_generator.animals.17' => 'loup',
			'name_generator.animals.18' => 'lion',
			'name_generator.animals.19' => 'ours',
			'name_generator.animals.20' => 'aigle',
			'name_generator.animals.21' => 'éléphant',
			'name_generator.animals.22' => 'léopard',
			'name_generator.animals.23' => 'guépard',
			'name_generator.animals.24' => 'hippopotame',
			'name_generator.animals.25' => 'lemurien',
			'name_generator.animals.26' => 'grenouille',
			'name_generator.animals.27' => 'caméléon',
			'name_generator.animals.28' => 'lynx',
			'name_generator.animals.29' => 'macareux',
			'name_generator.animals.30' => 'phoque',
			'name_generator.animals.31' => 'faucon',
			'name_generator.animals.32' => 'orque',
			'name_generator.animals.33' => 'suricate',
			'name_generator.animals.34' => 'hérisson',
			'name_generator.animals.35' => 'belette',
			'name_generator.animals.36' => 'tatou',
			'name_generator.animals.37' => 'wombat',
			'name_generator.animals.38' => 'ornithorynque',
			'name_generator.animals.39' => 'blaireau',
			'name_generator.animals.40' => 'yak',
			'name_generator.animals.41' => 'lézard',
			'name_generator.animals.42' => 'scarabée',
			'name_generator.animals.43' => 'chenille',
			'name_generator.animals.44' => 'jaguar',
			'name_generator.animals.45' => 'buffle',
			'name_generator.animals.46' => 'raie',
			'name_generator.animals.47' => 'taupe',
			'name_generator.animals.48' => 'âne',
			'name_generator.animals.49' => 'toucan',
			'name_generator.animals.50' => 'flamant',
			'name_generator.animals.51' => 'chèvre',
			'name_generator.animals.52' => 'alpaga',
			'name_generator.animals.53' => 'orignal',
			'name_generator.animals.54' => 'paon',
			'name_generator.animals.55' => 'rhinocéros',
			'name_generator.animals.56' => 'gecko',
			'name_generator.animals.57' => 'dinde',
			'name_generator.animals.58' => 'hamster',
			'name_generator.animals.59' => 'loutre',
			'name_generator.animals.60' => 'gorille',
			'name_generator.animals.61' => 'morse',
			'name_generator.animals.62' => 'vautour',
			'name_generator.animals.63' => 'raie',
			'name_generator.animals.64' => 'triton',
			'name_generator.animals.65' => 'iguane',
			'name_generator.animals.66' => 'porc-épic',
			'name_generator.animals.67' => 'python',
			'name_generator.animals.68' => 'antilope',
			'name_generator.animals.69' => 'gibbon',
			'name_generator.animals.70' => 'sanglier',
			'name_generator.animals.71' => 'grue',
			'name_generator.animals.72' => 'émeu',
			'name_generator.animals.73' => 'pélican',
			'name_generator.animals.74' => 'hyène',
			'name_generator.animals.75' => 'héron',
			'name_generator.animals.76' => 'agneau',
			'name_generator.animals.77' => 'tortue',
			'name_generator.animals.78' => 'crevette',
			'name_generator.animals.79' => 'homard',
			'name_generator.animals.80' => 'papillon de nuit',
			'name_generator.animals.81' => 'palourde',
			'name_generator.animals.82' => 'poisson-globe',
			'name_generator.animals.83' => 'étoile de mer',
			'name_generator.animals.84' => 'pie-grièche',
			'name_generator.animals.85' => 'rouge-gorge',
			'name_generator.animals.86' => 'caille',
			'name_generator.animals.87' => 'koala',
			'name_generator.animals.88' => 'escargot',
			'name_generator.animals.89' => 'limace',
			'name_generator.animals.90' => 'hibou',
			'name_generator.animals.91' => 'vipère',
			'name_generator.animals.92' => 'canard',
			'name_generator.animals.93' => 'hirondelle',
			'name_generator.animals.94' => 'crabe',
			'name_generator.animals.95' => 'lama',
			'name_generator.animals.96' => 'mangouste',
			'name_generator.animals.97' => 'chaton',
			'name_generator.adjectives.0' => 'joyeux',
			'name_generator.adjectives.1' => 'courageux',
			'name_generator.adjectives.2' => 'rigolo',
			'name_generator.adjectives.3' => 'jovial',
			'name_generator.adjectives.4' => 'espiègle',
			'name_generator.adjectives.5' => 'brillant',
			'name_generator.adjectives.6' => 'farfelu',
			'name_generator.adjectives.7' => 'curieux',
			'name_generator.adjectives.8' => 'rapide',
			'name_generator.adjectives.9' => 'audacieux',
			'name_generator.adjectives.10' => 'puissant',
			'name_generator.adjectives.11' => 'malin',
			'name_generator.adjectives.12' => 'rusé',
			'name_generator.adjectives.13' => 'doux',
			'name_generator.adjectives.14' => 'pelucheux',
			'name_generator.adjectives.15' => 'excentrique',
			'name_generator.adjectives.16' => 'rebondissant',
			'name_generator.adjectives.17' => 'étincelant',
			'name_generator.adjectives.18' => 'vif',
			'name_generator.adjectives.19' => 'chantant',
			'name_generator.adjectives.20' => 'lustré',
			'name_generator.adjectives.21' => 'claquant',
			'name_generator.adjectives.22' => 'brillant',
			'name_generator.adjectives.23' => 'rêveur',
			'name_generator.adjectives.24' => 'frétillant',
			'name_generator.adjectives.25' => 'ensoleillé',
			'name_generator.adjectives.26' => 'dingue',
			'name_generator.adjectives.27' => 'sauvage',
			'name_generator.adjectives.28' => 'funky',
			'name_generator.adjectives.29' => 'intrépide',
			'name_generator.adjectives.30' => 'confortable',
			'name_generator.adjectives.31' => 'croquant',
			'name_generator.adjectives.32' => 'vivant',
			'name_generator.adjectives.33' => 'coquin',
			'name_generator.adjectives.34' => 'spirituel',
			'name_generator.adjectives.35' => 'dynamique',
			'name_generator.adjectives.36' => 'pétillant',
			'name_generator.adjectives.37' => 'astucieux',
			'name_generator.adjectives.38' => 'élégant',
			'name_generator.adjectives.39' => 'souriant',
			'name_generator.adjectives.40' => 'chanceux',
			'name_generator.adjectives.41' => 'plein d\'énergie',
			'name_generator.adjectives.42' => 'chouette',
			'name_generator.adjectives.43' => 'soigné',
			'name_generator.adjectives.44' => 'frisquet',
			'name_generator.adjectives.45' => 'venté',
			'name_generator.adjectives.46' => 'gai',
			'name_generator.adjectives.47' => 'gracieux',
			'name_generator.adjectives.48' => 'courageux',
			'name_generator.adjectives.49' => 'étourdi',
			'name_generator.adjectives.50' => 'agile',
			'name_generator.adjectives.51' => 'fantasque',
			'name_generator.adjectives.52' => 'habile',
			'name_generator.adjectives.53' => 'chanteur',
			'name_generator.adjectives.54' => 'sautillant',
			'name_generator.adjectives.55' => 'bizarre',
			'name_generator.adjectives.56' => 'épicé',
			'name_generator.adjectives.57' => 'énergique',
			'name_generator.adjectives.58' => 'rapide',
			'name_generator.adjectives.59' => 'pratique',
			'name_generator.adjectives.60' => 'vacillant',
			'name_generator.adjectives.61' => 'croustillant',
			'name_generator.adjectives.62' => 'grognon',
			'name_generator.adjectives.63' => 'chic',
			'name_generator.adjectives.64' => 'plein d\'entrain',
			'name_generator.adjectives.65' => 'bouillonnant',
			'name_generator.adjectives.66' => 'éclaboussant',
			'name_generator.adjectives.67' => 'venté',
			'name_generator.adjectives.68' => 'rebondissant',
			'name_generator.adjectives.69' => 'étincelant',
			'name_generator.adjectives.70' => 'joyeux',
			'name_generator.adjectives.71' => 'moelleux',
			'name_generator.adjectives.72' => 'loufoque',
			'name_generator.adjectives.73' => 'vivifiant',
			'name_generator.adjectives.74' => 'claquant',
			'name_generator.adjectives.75' => 'joyeux',
			'name_generator.adjectives.76' => 'plumé',
			'name_generator.adjectives.77' => 'piquant',
			'name_generator.adjectives.78' => 'rapide',
			'name_generator.adjectives.79' => 'vif',
			'name_generator.adjectives.80' => 'moustachu',
			'name_generator.adjectives.81' => 'tacheté',
			'name_generator.adjectives.82' => 'rayé',
			'name_generator.adjectives.83' => 'fougueux',
			'name_generator.adjectives.84' => 'bavard',
			'name_generator.adjectives.85' => 'distingué',
			'name_generator.adjectives.86' => 'serpentin',
			'name_generator.adjectives.87' => 'rigolo',
			'name_generator.adjectives.88' => 'élégant',
			'name_generator.adjectives.89' => 'sautillant',
			'name_generator.adjectives.90' => 'dynamique',
			'name_generator.adjectives.91' => 'skippy',
			'name_generator.adjectives.92' => 'duveteux',
			'name_generator.adjectives.93' => 'rondelet',
			'name_generator.adjectives.94' => 'gonflé',
			'name_generator.adjectives.95' => 'déjanté',
			'name_generator.adjectives.96' => 'rose',
			'name_generator.adjectives.97' => 'exubérant',
			'name_generator.adjectives.98' => 'raffiné',
			'paywall.title' => 'Obtenez AtomicBlend Cloud',
			'paywall.subtitle' => 'Profitez d\'Atomic Blend sans restrictions et aidez l\'initiative open source.',
			'paywall.all_the_apps' => 'Toutes les applications dont vous avez besoin, dans une seule suite.',
			'paywall.why_choose_atomic_blend' => 'Pourquoi choisir Atomic Blend Cloud ?',
			'paywall.advantages.all_apps_of_the_suite.title' => 'Toutes les applications de la suite',
			'paywall.advantages.all_apps_of_the_suite.description' => 'Accédez à toutes les applications de la suite: mail, calendrier, etc...',
			'paywall.advantages.end_to_end_encrypted.title' => 'Chiffrement de bout en bout',
			'paywall.advantages.end_to_end_encrypted.description' => 'Vos données sont à vous, pour toujours.',
			'paywall.advantages.sync_across_devices.title' => 'Synchronisation entre appareils',
			'paywall.advantages.sync_across_devices.description' => 'Accédez à vos données depuis n\'importe quel appareil, n\'importe où.',
			'paywall.advantages.community_backed.title' => 'Soutien de la communauté',
			'paywall.advantages.community_backed.description' => '100% opensource : rejoignez une communauté de contributeurs.',
			'paywall.pricing.\$rc_annual.title' => 'Annuel',
			'paywall.pricing.\$rc_annual.price' => '39.99€/an',
			'paywall.pricing.\$rc_annual.billed' => 'soit 3.33€/mois',
			'paywall.pricing.\$rc_annual.discount' => '16% off',
			'paywall.pricing.\$rc_annual.start_button' => 'Démarrer l\'essai gratuit de 1 mois',
			'paywall.pricing.\$rc_monthly.title' => 'Mensuel',
			'paywall.pricing.\$rc_monthly.price' => '3.99€/mois',
			'paywall.pricing.\$rc_monthly.billed' => '',
			'paywall.pricing.\$rc_monthly.discount' => '',
			'paywall.pricing.\$rc_monthly.start_button' => 'Démarrer l\'essai gratuit de 1 semaine',
			'paywall.pricing.cloud_yearly.title' => 'Annuel',
			'paywall.pricing.cloud_yearly.price' => '39.99€/an',
			'paywall.pricing.cloud_yearly.billed' => 'soit 3.33€/mois',
			'paywall.pricing.cloud_yearly.discount' => '16% off',
			'paywall.pricing.cloud_yearly.start_button' => 'Démarrer l\'essai gratuit de 1 mois',
			'paywall.pricing.cloud_monthly.title' => 'Mensuel',
			'paywall.pricing.cloud_monthly.price' => '3.99€/mois',
			'paywall.pricing.cloud_monthly.billed' => '',
			'paywall.pricing.cloud_monthly.discount' => '',
			'paywall.pricing.cloud_monthly.start_button' => 'Démarrer l\'essai gratuit de 1 semaine',
			'paywall.no_package_selected' => 'Aucun package sélectionné',
			'paywall.purchase_failed' => 'Échec de l\'achat',
			'paywall.terms' => 'Conditions d\'utilisation',
			'paywall.privacy_policy' => 'Politique de confidentialité',
			'paywall.success' => 'Achat réussi !',
			'paywall.payment_in_progress' => 'Paiement en cours',
			'paywall.payment_in_progress_description' => 'Veuillez patienter pendant que nous traitons votre paiement.',
			'paywall.validation_failed' => 'Échec de la validation',
			'paywall.validation_failed_description' => 'Veuillez vérifier votre connexion Internet et redémarrer l\'application.',
			'paywall.mobile_app_required' => 'Application mobile requise',
			'paywall.payment_on_mobile_for_better_xp' => 'Pour vous offrir la meilleure expérience possible, le paiement et la configuration du compte ne sont disponibles que sur l\'application mobile.',
			'paywall.ios' => 'iOS',
			'paywall.android' => 'Android',
			'color_wheel.primary' => 'Principal',
			'color_wheel.accent' => 'Accentué',
			'color_wheel.wheel' => 'Roue',
			'dates.today' => 'Aujourd\'hui',
			'dates.tomorrow' => 'Demain',
			'time_units.short.day' => 'j',
			'time_units.short.hour' => 'h',
			'time_units.short.minute' => 'm',
			'time_units.long.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'jours', one: 'jour', other: 'jours', ), 
			'time_units.long.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'heures', one: 'heure', other: 'heures', ), 
			'time_units.long.minute' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'minutes', one: 'minute', other: 'minutes', ), 
			'sync_status.synced' => 'synchronisé',
			'waiting_list.title' => 'Nous sommes complet !',
			'waiting_list.description' => 'Rejoignez la liste d\'attente pour être notifié lorsqu\'un poste s\'ouvre.',
			'waiting_list.email_required' => 'L\'adresse e-mail est requise',
			'waiting_list.invalid_email' => 'L\'adresse e-mail est invalide',
			'waiting_list.join_waiting_list' => 'Rejoindre la liste d\'attente',
			'waiting_list.i_have_a_code' => 'J\'ai un code',
			'waiting_list.email' => 'Email',
			'waiting_list.email_hint' => 'brandon@atomic-blend.com',
			'waiting_list.back_to_home' => 'Retour à l\'accueil',
			'waiting_list.proceed_to_registration' => 'Passer à l\'inscription',
			_ => null,
		};
	}
}
