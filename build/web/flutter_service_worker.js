'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "9841a9717c8b5a2a5dab47d81e4345a3",
"version.json": "90e7a2a5bd58a44c097c8b976d07b238",
"google_sign_in_dev.txt": "fcba08b20a1fbc8b1b431f4cc93637da",
"favicon.ico": "7e9acff1ac4e5ba72a05db8d9608cdb4",
"index.html": "476ad48f5add8e9066138f8a47dabfee",
"/": "476ad48f5add8e9066138f8a47dabfee",
"main.dart.js": "0281b3a4b0df1b5d3ecab8a049ff9fe0",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"icons/Icon-192.png": "337d07e1e110948a6a7a598a71946e0c",
"icons/Icon-maskable-192.png": "2b1a826134f313b5d8b998d4e72ecd2d",
"icons/Icon-maskable-512.png": "ada42772ff640cbeace409be05d03f2a",
"icons/Icon-512.png": "dae23d02706aad2cf0a6e2b173075e24",
"manifest.json": "9038db30c3d1d6580d10489602d92a2d",
"assets/AssetManifest.json": "6892ccd60fa0555790065ed274c4f510",
"assets/intro_body.png": "13637abb0c53fa837ed757a6fea763c2",
"assets/NOTICES": "755c3d497e2754a58c5b5979bab4c49e",
"assets/FontManifest.json": "f884e9cf90b1c5fa4384ddca7d334257",
"assets/AssetManifest.bin.json": "24706ef599d5752682324cbe8f2cac6b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_inappwebview_web/assets/web/web_support.js": "509ae636cfdd93e49b5a6eaf0f06d79f",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "8a83e3d71e7a54b04e94851d6fd122c7",
"assets/fonts/MaterialIcons-Regular.otf": "1d449af0a69a966031ed6c6d6075732a",
"assets/assets/audios/9.wav": "988ef31f762126b1882b46f75d87bca4",
"assets/assets/audios/8.wav": "47ebcf722da395e877ef333807936b18",
"assets/assets/audios/6.wav": "41c9597543d2856857ab32408df7dd48",
"assets/assets/audios/7.wav": "189daeecddf85fe49d3f6d71f42790c3",
"assets/assets/audios/5.wav": "63b24c7f488e638da192faec1d957e1d",
"assets/assets/audios/4.wav": "14c7cf4d7a6779fd0668410850a5ced1",
"assets/assets/audios/1.wav": "47e2fb0cbb44c66f655d08df05eeffad",
"assets/assets/audios/3.wav": "f19e76ce86eb3a963f0e34be0441a68a",
"assets/assets/audios/2.wav": "deb57a01bf4785324c58680d3c1b6834",
"assets/assets/images/img_discover.png": "1a8b0c88a7b386a14ed222cb8505945d",
"assets/assets/images/img_england.png": "dfb90cc54a53f85c124f65475989ab3b",
"assets/assets/images/img_weather.png": "3602769b76b5ff2f7fbd388b20edd191",
"assets/assets/images/img_animal.png": "d2520cca304761fa306a66f3a0b1e5ea",
"assets/assets/images/img_occupation.png": "011adb140057afd7476afb205096a28c",
"assets/assets/images/img_number.png": "1dfae8a9942271ef1a52166dcf7581bb",
"assets/assets/images/img_vietnam.png": "c6e38cb733c4b2a019e225c2cf4d28b0",
"assets/assets/images/img_vehicle.png": "ba025c16f90228aea8d1848ecb551656",
"assets/assets/images/img_alphabet.png": "f6ad703d21374268295ed3cb6e2da5f0",
"assets/assets/images/img_color.png": "7fdce0e6c0a6fb19e8aa3f5e057273f8",
"assets/assets/images/img_vietnameseFood.png": "560f94a99049e7050386750effa82ae3",
"assets/assets/images/img_words_and_sentences.png": "118fe7ef4747b390952fe49b1e770feb",
"assets/assets/images/img_default_image.png": "350c19e8b14e671552f02e2d5535cc14",
"assets/assets/images/img_letter.png": "8f9b17f74a6de93f71aab17e7cb86bba",
"assets/assets/logo/app_icon.png": "86cde5d28ac30d140bba13029e6e4a53",
"assets/assets/icons/ic_eye_slash.svg": "5ac00353dc8af3995c511739896bdcf5",
"assets/assets/icons/ic_setting_active.svg": "146dfb6a4f3341494a0e3be648baa7a0",
"assets/assets/icons/ic_words_and_sentences_active.svg": "42df9d16637fea8d0e3d00583be4e8af",
"assets/assets/icons/ic_words_and_sentences_inactive.svg": "d3d4c6839dd22ec61e5fd8c18909ab51",
"assets/assets/icons/ic_audio_playing.svg": "f53cc5052dd3964a1307211c96c9e1d8",
"assets/assets/icons/ic_bell.svg": "117fa546f3ba30315e59b17dba51bba4",
"assets/assets/icons/ic_completed.svg": "7df1f4354fe1179e70d29b7b56222cd5",
"assets/assets/icons/ic_letters_and_numbers_active.svg": "c7bc8d4e74bedb61b090a3e9fdd2a5c6",
"assets/assets/icons/ic_home_active.svg": "c171af56c55c1c1ae40ac6fd5790bbcb",
"assets/assets/icons/ic_google.svg": "85ece1fbe163e98741b010bc157f65b3",
"assets/assets/icons/ic_eye.svg": "a325a3590dd0e896b1710da23c2a0e64",
"assets/assets/icons/ic_sutu.svg": "03034f04f47f96b8a831c1882a9bd184",
"assets/assets/icons/ic_onboard_background.svg": "e06f9b977693c91bbb212e4b19021f33",
"assets/assets/icons/ic_in_progress.svg": "43e5eb8a269f814411fc6ba34f21a857",
"assets/assets/icons/ic_letters_and_numbers_inactive.svg": "81a4c86a368b279535574e2618962ebd",
"assets/assets/icons/ic_home_inactive.svg": "1c93561ec9d99cf349b899e952943de0",
"assets/assets/icons/ic_setting_inactive.svg": "6ec97bf72be9e500943f7f1ccdb1568a",
"assets/assets/icons/ic_back.svg": "eec6aa5038013e415274da230d3007ab",
"assets/assets/icons/ic_not_started.svg": "646299a27ab83cc2bc335d5c3e986225",
"assets/assets/icons/ic_discover_active.svg": "9f31ff16b8de046591cca3f711b4919a",
"assets/assets/icons/ic_discover_inactive.svg": "b1ff35d10df2d299ce27c645e856323e",
"assets/assets/fonts/SF-Compact-Rounded-Heavy.otf": "6a3ea5e05f56444d3480b3e7c0de053d",
"assets/assets/fonts/SF-Pro-Display-Regular.otf": "aaeac71d99a345145a126a8c9dd2615f",
"assets/assets/fonts/SF-Pro-Display-Bold.otf": "644563f48ab5fe8e9082b64b2729b068",
"assets/assets/fonts/iciel-Pony.ttf": "1716f3f87bf9af14a763249e77f202da",
"assets/assets/fonts/SF-Pro-Display-SemiBold.otf": "e6ef4ea3cf5b1b533a85a5591534e3e4",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
