'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "cbcc194359f55e14da3cf22a27fe442f",
"/": "cbcc194359f55e14da3cf22a27fe442f",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"main.dart.js": "acbb308fb866fa41e1fd661730daa50d",
"version.json": "7367c9ca1c69727a8bb09a7d2d21d48c",
"project_info.html": "f7cefbb77dae33e73dcb569382da22fb",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"manifest.json": "218160b7641886fdf86132ab637dcce6",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/fonts/MaterialIcons-Regular.otf": "c3a5b1d7f6075055f79ce437da0b4122",
"assets/AssetManifest.bin": "8b1f28b6f4341f00654355c2d2919797",
"assets/AssetManifest.json": "05ca0483f561524b431ff783f18a6100",
"assets/NOTICES": "216c8c89bea1af00d89729a2fc63f505",
"assets/FontManifest.json": "e8acd1c1c1d801d0c48df8da2b19e528",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/atlas_icons/lib/fonts/arrow/arrow.ttf": "f0bca8f3df2d457d1822104026a864ba",
"assets/packages/atlas_icons/lib/fonts/school/school.ttf": "abbc42cd2c6e617d358e785604bc7ba8",
"assets/packages/atlas_icons/lib/fonts/construction/construction.ttf": "01a8c67d528d23e2431829056b492a64",
"assets/packages/atlas_icons/lib/fonts/weather/weather.ttf": "5bbf59a7de30cadad61b8c21c663d4cd",
"assets/packages/atlas_icons/lib/fonts/achievement/achievement.ttf": "db24e8f8b1ae0cf17026df72ccb53df1",
"assets/packages/atlas_icons/lib/fonts/laboratory/laboratory.ttf": "bea4ee233f9556f4037281d4807e982a",
"assets/packages/atlas_icons/lib/fonts/web-design/web-design.ttf": "869cf4c1860bbfbd099d761f48fe59f9",
"assets/packages/atlas_icons/lib/fonts/goals/goals.ttf": "095d14f7bd8f385c6b114a3f44bcf594",
"assets/packages/atlas_icons/lib/fonts/furniture/furniture.ttf": "b23bd60b0e062ac0996b38b3cda26549",
"assets/packages/atlas_icons/lib/fonts/ecology/ecology.ttf": "edd4ed1bc9fd213fc7e06b9e2f2fa878",
"assets/packages/atlas_icons/lib/fonts/working-together/working-together.ttf": "d39b4b168bb22afeb32f5e00599e7a6a",
"assets/packages/atlas_icons/lib/fonts/love/love.ttf": "3d6418bb79023676024abd3e510c61e2",
"assets/packages/atlas_icons/lib/fonts/world-monuments/world-monuments.ttf": "5beb7d7d45fd01f2e024d43d2b193091",
"assets/packages/atlas_icons/lib/fonts/hotel-service/hotel-service.ttf": "ffb310641ab00d74a4a2785a41a47376",
"assets/packages/atlas_icons/lib/fonts/electronic-gadget/electronic-gadget.ttf": "dd0777731851af00092e58d442cdde57",
"assets/packages/atlas_icons/lib/fonts/basic-ui/basic-ui.ttf": "7a096616f5c2eb33237853a6e7ea1326",
"assets/packages/atlas_icons/lib/fonts/food-beverage/food-beverage.ttf": "18cf44e6ef1578c06ca4ebbba872ba7f",
"assets/packages/atlas_icons/lib/fonts/partnership/partnership.ttf": "a58168079c868e6e93a4ce9284a5bfe0",
"assets/packages/atlas_icons/lib/fonts/real-estate/real-estate.ttf": "55d435070d7431fce6e2d5bf2dc0ebc9",
"assets/packages/atlas_icons/lib/fonts/winter/winter.ttf": "25f130f2438e3c658664d2e414d184dc",
"assets/packages/atlas_icons/lib/fonts/internet-security/internet-security.ttf": "13fd032e2373648b16fbd61134fde1ff",
"assets/packages/atlas_icons/lib/fonts/leadership/leadership.ttf": "76e03ead528ab466f535b5bbab5a2696",
"assets/packages/atlas_icons/lib/fonts/hand-gesture/hand-gesture.ttf": "ba4244e7e283cd3e51199523b5c60ac5",
"assets/packages/atlas_icons/lib/fonts/cinema/cinema.ttf": "c5ecb26da290bc00e455c03497fcaf6f",
"assets/packages/atlas_icons/lib/fonts/marketing/marketing.ttf": "692bd4e118f0ffcadcd96b32254b61db",
"assets/packages/atlas_icons/lib/fonts/sport/sport.ttf": "6a7a9f2c2e9e88d86f02e1de20a0261f",
"assets/packages/atlas_icons/lib/fonts/fitness-gym/fitness-gym.ttf": "472361cb55f2af8365d97dd1868d0eb3",
"assets/packages/atlas_icons/lib/fonts/communication/communication.ttf": "509504ce47999e6b13a89f3c74461136",
"assets/packages/atlas_icons/lib/fonts/yoga/yoga.ttf": "d3111823cab25a7f7a8ef780996a753d",
"assets/packages/atlas_icons/lib/fonts/personal-development/personal-development.ttf": "7ad25a50bac1037e605fe976c18db32b",
"assets/packages/atlas_icons/lib/fonts/travel/travel.ttf": "9c8aab0af6eba11334e792ccb67ab491",
"assets/packages/atlas_icons/lib/fonts/transportation/transportation.ttf": "b726fd177b452c1a6c7f0356ae06b75d",
"assets/packages/atlas_icons/lib/fonts/thanksgiving/thanksgiving.ttf": "63341982bcc4aa6e2ad8b2681a3faba3",
"assets/packages/atlas_icons/lib/fonts/audio/audio.ttf": "eef4d8884d318d637482ce73093aa42d",
"assets/packages/atlas_icons/lib/fonts/medical/medical.ttf": "3bd7186a844cd824526a840bbf9ea42b",
"assets/packages/atlas_icons/lib/fonts/christmas/christmas.ttf": "1b508d29498dbbea3b17e7edaf5d2fa5",
"assets/packages/atlas_icons/lib/fonts/data-document/data-document.ttf": "426613f392ad06ddef87c6ebbfea7857",
"assets/packages/atlas_icons/lib/fonts/business-finance/business-finance.ttf": "c28f9b0a8e82713c6db879f38bf28b45",
"assets/packages/atlas_icons/lib/fonts/social/social.ttf": "1645ddd2b15576abd6f3b3adc9736bcb",
"assets/packages/atlas_icons/lib/fonts/content-box/content-box.ttf": "e2d0ad6a4c6d88ea7eac098e2364de08",
"assets/packages/atlas_icons/lib/fonts/virtual-reality/virtual-reality.ttf": "f61a189dd30563a2113971385d48f996",
"assets/assets/fonts/poppins/Poppins-Regular.ttf": "cd6b896a19b4babd1a2fa07498e9fc47",
"assets/assets/fonts/poppins/Poppins-SemiBold.ttf": "0fc985df77c6b59d37e79b97ed7fb744",
"assets/assets/fonts/poppins/Poppins-Medium.ttf": "614a91afc751f09d049231f828801c20",
"assets/assets/fonts/poppins/Poppins-Light.ttf": "1bb10326b972c92be6c59c048a4327e4",
"assets/assets/fonts/poppins/Poppins-Black.ttf": "9a3a3c0803219892727ed9d85ad5caea",
"assets/assets/fonts/poppins/Poppins-Bold.ttf": "124cd57d8f41f6db22a724f882dca3f4",
"assets/assets/fonts/poppins/Poppins-Italic.ttf": "07502c4fe46025097dd8b1e331182ee0",
"assets/assets/fonts/poppins/Poppins-ExtraBold.ttf": "4252dae8574e434c7bb0127b8ffd06df",
"assets/assets/fonts/poppins/Poppins-ExtraLight.ttf": "a0f2eadb0002101ea5da28381ce16cde",
"assets/assets/dodecaCopter.jpg": "e03ed351db8b1a4cec0754660142638f",
"assets/assets/me.jpeg": "bdddb62238c377f0027a8f20d68d8908",
"assets/assets/YClogo.png": "50e526538854b6a7e95585cc0ffffcab",
"assets/assets/androidNativeApp.jpg": "fd80f67c871feef2031d093d442b9a4c",
"assets/assets/webDevelopmentProject.jpg": "08b4f967a5faee0a74617957a0d95f2c",
"assets/assets/FontManifest.json": "fc26ad8cb0c2c1bd0df400fba1a8e6fb",
"assets/assets/GoogleSansRegular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"assets/assets/flutterApp.jpg": "1ab169bc8dd324f003df13dd87146779",
"assets/assets/deepLearningProject.jpg": "198fae0de587a015d7ef733d8fa4fdb3",
"project.html": "d33abfe5c22b8bc028352093a64350c1",
"icons/Icon-192.png": "4754d57e73829290fe3488851cbac8e8",
"icons/Icon-512.png": "4754d57e73829290fe3488851cbac8e8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
