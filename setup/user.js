//
user_pref("browser.translations.automaticallyPopup", false);

//
//user_pref("devtools.chrome.enabled", true);
//user_pref("devtools.debugger.remote-enabled", true);


//
//user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

//Force h264
//user_pref("media.av1.enabled", false);
//user_pref("media.webrtc.codec.video.av1.enabled", false);
//user_pref("media.webrtc.simulcast.av1.enabled", false);

//user_pref("media.mediasource.vp9.enabled", false);
//user_pref("media.peerconnection.video.vp9_enabled", false);
//user_pref("media.mediasource.webm.enabled", false);
//user_pref("media.webm.enabled", false);

//user_pref("media.navigator.mediadatadecoder_h264_enabled", true);
//user_pref("media.ffmpeg.allow-openh264", true);
//user_pref("media.gmp-gmpopenh264.enabled", true);

// Global
user_pref("general.smoothScroll", true);
user_pref("general.smoothScroll.mouseWheel", true);
user_pref("general.smoothScroll.msdPhysics.enabled", true);

user_pref("findbar.highlightAll", true);


// Toolbar


// AI
user_pref("browser.ml.enable", false);
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ml.chat.menu", false);
user_pref("browser.tabs.groups.smart.enabled", false);
user_pref("browser.ml.linkPreview.enabled", false);
user_pref("browser.ml.modelHubRootUrl", "");
user_pref("browser.newtabpage.activity-stream.discoverystream.personalization.modelKeys", "");

// Extensions button
user_pref("extensions.unifiedExtensions.button.always_visible", false);

// -----------------------------------------------------------------
// accessibility
// -----------------------------------------------------------------

// Page Refreshes: Block websites from automatically refreshing the page.
user_pref("accessibility.blockautorefresh", true);
// Sync: Do not sync the 'block autorefresh' setting with other devices.
user_pref("services.sync.prefs.sync.accessibility.blockautorefresh", false);

// -----------------------------------------------------------------
// app
// -----------------------------------------------------------------

// Normandy/Shield: Disable studies and experiments.
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("app.normandy.user_id", "");

// -----------------------------------------------------------------
// browser
// -----------------------------------------------------------------

user_pref("browser.meta_refresh_when_inactive.disabled", true);

user_pref("browser.tabs.unloadOnLowMemory", true);

user_pref("browser.urlbar.speculativeConnect.enabled", false);

user_pref("device.sensors.enabled", false);

user_pref("network.predictor.enabled", true);

user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);

user_pref("browser.newtabpage.activity-stream.telemetry", false);

user_pref("browser.newtabpage.activity-stream.impressionId", "");

// New Tab Page: Disable Activity Stream (the default new tab page).
user_pref("browser.newtabpage.enabled", false);

// New Tab Page: Disable Top Sites on the new tab page.
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);

// New Tab Page: Disable including bookmarks in highlights.
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);

//
user_pref("places.frecency.accelerateRecalculation", true);

//
user_pref("browser.urlbar.suggest.history", false);

//
user_pref("browser.shell.checkDefaultBrowser", false);

// New Tab Page: Disable including downloads in highlights.
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);

// New Tab Page: Disable including visited pages in highlights.
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);

// New Tab Page: Hide the search bar on the new tab page.
user_pref("browser.newtabpage.activity-stream.showSearch", false);

// New Tab Page: Hide sponsored content checkboxes.
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false);

// New Tab Page: Hide sponsored Top Sites.
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Startup: Set startup page to blank page.
user_pref("browser.startup.homepage", "chrome://browser/content/blanktab.html");

// UI: Hide experimental options in the settings menu.
user_pref("browser.preferences.experimental.hidden", true);

// Downloads settings
user_pref("browser.download.always_ask_before_handling_new_types", true);
user_pref("browser.download.lastDir", "");
user_pref("browser.download.deletePrivate", true);
user_pref("browser.download.useDownloadDir", false);
user_pref("services.sync.prefs.sync.browser.download.useDownloadDir", false);
user_pref("browser.download.panel.shown", true);

//
user_pref("extensions.getAddons.cache.enabled", false);

//
user_pref("network.connectivity-service.enabled", false);

user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);

// Safe Browsing: Disable malware protection.
user_pref("browser.safebrowsing.malware.enabled", false);

// Safe Browsing: Disable phishing protection.
user_pref("browser.safebrowsing.phishing.enabled", false);

// Safe Browsing: Disable download protection.
user_pref("browser.safebrowsing.downloads.enabled", false);

// Safe Browsing: Disable blocking of potentially unwanted downloads.
user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);

// Safe Browsing: Disable blocking of uncommon downloads.
user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);

// Content Blocking: Set tracking protection to "standard" or "strict" mode.
user_pref("browser.contentblocking.category", "strict");
user_pref("services.sync.prefs.sync.browser.contentblocking.category", false);

// Discovery: Disable Firefox recommendations (e.g., extensions).
user_pref("browser.discovery.enabled", false);
user_pref("services.sync.prefs.sync.browser.discovery.enabled", false);

//
user_pref("browser.privatebrowsing.vpnpromourl", "");
user_pref("extensions.getAddons.showPane", false);
user_pref("browser.preferences.moreFromMozilla", false);

// 	https://services.addons.mozilla.org/api/v4/discovery/?lang=%LOCALE%&edition=%DISTRIBUTION%
user_pref("extensions.getAddons.discovery.api_url", "");

// Disable recommendations on about:addon page
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

// About Config: Hide the warning page when accessing about:config.
user_pref("browser.aboutConfig.showWarning", false);

// New Tab Page: Preload the new tab page in the background.
user_pref("browser.newtab.preload", false);

// Search: Reset the total search count to zero.
user_pref("browser.search.totalSearches", 0);

// -----------------------------------------------------------------
// disable dns
// -----------------------------------------------------------------

//
user_pref("doh-rollout.disable-heuristics", true);

//
user_pref("network.trr.mode", 5);

// -----------------------------------------------------------------

//
user_pref("layout.spellcheckDefault", 0);

//
user_pref("media.hardwaremediakeys.enabled", false);

//
user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
user_pref("browser.urlbar.placeholderName.private", "DuckDuckGo");

// Show search suggestions in Private Windows
user_pref("browser.search.suggest.enabled.private", true);

// Show recent searches
user_pref("browser.urlbar.suggest.recentsearches", false);

//
user_pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false);

//
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

//
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// Search: Show search suggestions from the default search engine.
user_pref("browser.search.suggest.enabled", true);

// Address Bar: Show search suggestions in the address bar dropdown.
user_pref("browser.urlbar.suggest.searches", true);

// Session Restore: Restore tabs on demand instead of loading them all at once.
user_pref("browser.sessionstore.restore_on_demand", true);

// Sidebar: Configure the order of tools in the sidebar.
user_pref("sidebar.main.tools", "syncedtabs,history,bookmarks");

// Sidebar: Mark that the new sidebar has been used.
user_pref("sidebar.new-sidebar.has-used", true);

// Sidebar: Hide the sidebar by default.
user_pref("sidebar.visibility", "hide-sidebar");

// Bookmarks Toolbar: Control the visibility of the bookmarks toolbar.
user_pref("browser.toolbars.bookmarks.visibility", "always");

// Tabs: Ask before closing multiple tabs.
user_pref("browser.tabs.warnOnClose", true);

//
user_pref("browser.urlbar.trimHttps", true);
user_pref("browser.urlbar.untrimOnUserInteraction.featureGate", true);

//
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);

//
user_pref("browser.newtabpage.activity-stream.showSponsored", false);

//
user_pref("browser.newtabpage.activity-stream.showWeather", false);

//
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);

//
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);

//
user_pref("extensions.formautofill.addresses.enabled", false);

// Search Engine: Force search region to US.
// This influences Firefox to choose a different default search engine (e.g., DuckDuckGo).
user_pref("browser.search.region", "US");
// Sync: Do not sync the search region setting with other devices.
user_pref("services.sync.prefs.sync.browser.search.region", false);

// Clear history after close
user_pref("privacy.clearHistory.formdata", true);
user_pref("privacy.clearHistory.siteSettings", true);
user_pref("places.history.enabled", false);
user_pref("browser.formfill.enable", false);

// Search Engine: Disable automatic region detection via geo-IP lookup.
// This locks the region you set above.
user_pref("browser.search.geoip.url", "");
// Sync: Do not sync the geo-IP URL setting with other devices.
user_pref("services.sync.prefs.sync.browser.search.geoip.url", false);

// Address Bar: Set placeholder text in private mode to DuckDuckGo.
// This is a side effect of changing the default search engine.
user_pref("browser.urlbar.placeholderName.private", "DuckDuckGo");

// Address Bar: Disable trending search suggestions.
// This is a side effect of changing the default search engine.
user_pref("browser.urlbar.suggest.trending", false);

// -----------------------------------------------------------------
// datareporting
// -----------------------------------------------------------------

// Telemetry: Disable sending Firefox health reports to Mozilla.
user_pref("datareporting.healthreport.uploadEnabled", false);

// Telemetry: Disable general submission of usage and performance data.
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// Telemetry: Disable sending usage data via the "new" telemetry system.
user_pref("datareporting.usage.uploadEnabled", false);

// -----------------------------------------------------------------
// dom
// -----------------------------------------------------------------

// HTTPS-Only Mode: Force all connections to use HTTPS.
user_pref("dom.security.https_only_mode", true);

// HTTPS-Only Mode: Remember that HTTPS-Only mode was ever enabled.
user_pref("dom.security.https_only_mode_ever_enabled", true);

// Appearance: Set the default color scheme for web content (0=system, 1=light, 2=dark).
user_pref("layout.css.prefers-color-scheme.content-override", 0);

// -----------------------------------------------------------------
// extensions
// -----------------------------------------------------------------

// Extensions: Disable automatic updates for extensions by default.
user_pref("extensions.update.autoUpdateDefault", false);

// Extensions: Disable the entire extension update mechanism.
user_pref("extensions.update.enabled", false);
// Sync: Do not sync the 'extension update' setting with other devices.
user_pref("services.sync.prefs.sync.extensions.update.enabled", false);

// Extensions: Require all extensions to be signed by Mozilla.
user_pref("xpinstall.signatures.required", true);

// Autofill: Disable saving and filling of credit cards.
user_pref("extensions.formautofill.creditCards.enabled", false);

// -----------------------------------------------------------------
// media
// -----------------------------------------------------------------

// WebRTC: Disable peer-to-peer connections for audio/video.
user_pref("media.peerconnection.enabled", false);

// WebRTC: Limit WebRTC to a single network interface to prevent IP leakage.
user_pref("media.peerconnection.ice.default_address_only", true);

// -----------------------------------------------------------------
// network
// -----------------------------------------------------------------

// Captive Portal: Disable the service that checks for captive portals (e.g., hotel Wi-Fi).
user_pref("network.captive-portal-service.enabled", false);

// DNS Prefetching: Disable performing DNS lookups for links in advance.
user_pref("network.dns.disablePrefetch", true);

// Link Prefetching: Disable preloading pages that the website thinks you might visit next.
user_pref("network.prefetch-next", false);

// Speculative Connections: Do not open connections to servers before you click a link.
user_pref("network.http.speculative-parallel-limit", 0);

// -----------------------------------------------------------------
// permissions
// -----------------------------------------------------------------

// Camera: Block camera access by default.
user_pref("permissions.default.camera", 2);

// Geolocation: Block geolocation access by default.
user_pref("permissions.default.geo", 2);

// Microphone: Block microphone access by default.
user_pref("permissions.default.microphone", 2);

// Notifications: Block desktop notifications by default.
user_pref("permissions.default.desktop-notification", 2);

// -----------------------------------------------------------------
// privacy
// -----------------------------------------------------------------

// Do Not Track: Do not send a "Do Not Track" header with your requests.
user_pref("privacy.donottrackheader.enabled", true);
// Sync: Do not sync the 'Do Not Track' setting with other devices.
user_pref("services.sync.prefs.sync.privacy.donottrackheader.enabled", false);

// Fingerprinting: Do not resist browser fingerprinting.
user_pref("privacy.resistFingerprinting", false);
// Sync: Do not sync the 'resist fingerprinting' setting with other devices.
user_pref("services.sync.prefs.sync.privacy.resistFingerprinting", false);

// First-Party Isolation: Do not isolate data for each top-level domain.
user_pref("privacy.firstparty.isolate", false);

// First-Party Isolation: Do not block cross-origin postMessage.
user_pref("privacy.firstparty.isolate.block_post_message", false);

// First-Party Isolation: Do not restrict opener access.
user_pref("privacy.firstparty.isolate.restrict_opener_access", false);

// First-Party Isolation: Do not use full site for isolation.
user_pref("privacy.firstparty.isolate.use_site", false);

// Global Privacy Control: Send a signal to websites not to sell or share your data.
user_pref("privacy.globalprivacycontrol.enabled", true);
// Sync: Do not sync the 'Global Privacy Control' setting with other devices.
user_pref("services.sync.prefs.sync.privacy.globalprivacycontrol.enabled", false);

// Global Privacy Control: Enable GPC functionality.
user_pref("privacy.globalprivacycontrol.functionality.enabled", true);

// Global Privacy Control: Enable GPC in Private Browsing mode.
user_pref("privacy.globalprivacycontrol.pbmode.enabled", true);

// Global Privacy Control: Flag to remember that GPC was ever enabled.
user_pref("privacy.globalprivacycontrol.was_ever_enabled", true);

// Tracking Protection: Enable legacy tracking protection.
user_pref("privacy.trackingprotection.enabled", true);
// Sync: Do not sync the 'tracking protection' setting with other devices.
user_pref("services.sync.prefs.sync.privacy.trackingprotection.enabled", false);

// Password Manager: Do not offer to remember passwords.
user_pref("signon.rememberSignons", false);
// Sync: Do not sync the 'remember passwords' setting with other devices.
user_pref("services.sync.prefs.sync.signon.rememberSignons", false);

// -----------------------------------------------------------------
// clear cookies after closing browser
// -----------------------------------------------------------------

//
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", false);
//
user_pref("privacy.history.custom", true);

// Startup: Restore previous session on startup.
user_pref("browser.startup.page", 3);

//
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
//
user_pref("privacy.sanitize.pending", "[{\"id\":\"shutdown\",\"itemsToClear\":[\"cache\",\"cookiesAndStorage\"],\"options\":{}},{\"id\":\"newtab-container\",\"itemsToClear\":[],\"options\":{}}]");

// -----------------------------------------------------------------
// toolkit
// -----------------------------------------------------------------

// Telemetry: Master switch for the Telemetry system.
user_pref("toolkit.telemetry.enabled", false);

// Telemetry: Enable the unified FHR (Firefox Health Report) and Telemetry system.
user_pref("toolkit.telemetry.unified", false);

// Telemetry: Do not allow archiving of old telemetry data locally.
user_pref("toolkit.telemetry.archive.enabled", false);

// Telemetry: Set telemetry server to a null location to prevent data sending.
user_pref("toolkit.telemetry.server", "data:,");