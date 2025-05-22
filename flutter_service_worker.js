'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.wasm": "f950f411cd0d6ad3d5ed586e41f84d61",
"icons/Icon-192.png": "4754d57e73829290fe3488851cbac8e8",
"icons/Icon-512.png": "4754d57e73829290fe3488851cbac8e8",
"assets/fonts/MaterialIcons-Regular.otf": "12fffdd153556a4eafa087fe23bb62d5",
"assets/AssetManifest.bin.json": "d00aabbd3c306939999e9e39a90933da",
"assets/AssetManifest.bin": "bcf8589662bf9096e52f83493e418c96",
"assets/AssetManifest.json": "26d7ffca47a805e672a9cdeefadbb64c",
"assets/assets/me.jpeg": "bdddb62238c377f0027a8f20d68d8908",
"assets/assets/fonts/noto/NotoSans-Light.ttf": "1e81ec98e0668cbee241a1f0a0ab90ad",
"assets/assets/fonts/noto/NotoSans-Black.ttf": "a45b4647b217a27f7eb0db1f4a4a2421",
"assets/assets/fonts/noto/NotoSans-SemiBold.ttf": "f5a1e1476234ba356911d9b4e287e30d",
"assets/assets/fonts/noto/NotoSans-Medium.ttf": "a1311858ffd88b69aa5eadafd8f5c164",
"assets/assets/fonts/noto/NotoSans-SemiBoldItalic.ttf": "69f9af3b328aa8557b3c81df5ccaece6",
"assets/assets/fonts/noto/NotoSans-Regular.ttf": "f46b08cc90d994b34b647ae24c46d504",
"assets/assets/fonts/noto/NotoSans-LightItalic.ttf": "df8dedaaf9c464305f57eaad5d2a30f3",
"assets/assets/fonts/noto/NotoSans-ThinItalic.ttf": "a16fd39654ea16dc249af4623b1e05cb",
"assets/assets/fonts/noto/NotoSans-ExtraBoldItalic.ttf": "cb45ddbeb7ca5b0c1934ce48f8a3767b",
"assets/assets/fonts/noto/NotoSans-Italic.ttf": "a6d070775dd5e6bfff61870528c6248a",
"assets/assets/fonts/noto/NotoSans-BlackItalic.ttf": "13ac991d429a2ca6be9451e38a5079cd",
"assets/assets/fonts/noto/NotoSans-MediumItalic.ttf": "c3df9f63939ae47a3f978d3fdfd8ed8b",
"assets/assets/fonts/noto/NotoSans-ExtraLightItalic.ttf": "e7842c55efb8a16943eabe63ad94a93b",
"assets/assets/fonts/noto/NotoSans-ExtraLight.ttf": "b4dcd4a644afea0c03cc0aacd66105eb",
"assets/assets/fonts/noto/NotoSans-Bold.ttf": "2ea5e0855d5a3ec3f561b5bc62b39805",
"assets/assets/fonts/noto/NotoSans-ExtraBold.ttf": "6d20a0d666df4e4ed72c2f666a974ea0",
"assets/assets/fonts/noto/NotoSans-Thin.ttf": "52d74c81e361a9c83871d47fe86a3c59",
"assets/assets/fonts/noto/NotoSans-BoldItalic.ttf": "4321108b0cf255575499e2361b6501e0",
"assets/assets/fonts/poppins/Poppins-Black.ttf": "9a3a3c0803219892727ed9d85ad5caea",
"assets/assets/fonts/poppins/Poppins-ExtraBold.ttf": "4252dae8574e434c7bb0127b8ffd06df",
"assets/assets/fonts/poppins/Poppins-Medium.ttf": "614a91afc751f09d049231f828801c20",
"assets/assets/fonts/poppins/Poppins-Bold.ttf": "124cd57d8f41f6db22a724f882dca3f4",
"assets/assets/fonts/poppins/Poppins-ExtraLight.ttf": "a0f2eadb0002101ea5da28381ce16cde",
"assets/assets/fonts/poppins/Poppins-Italic.ttf": "07502c4fe46025097dd8b1e331182ee0",
"assets/assets/fonts/poppins/Poppins-SemiBold.ttf": "0fc985df77c6b59d37e79b97ed7fb744",
"assets/assets/fonts/poppins/Poppins-Regular.ttf": "cd6b896a19b4babd1a2fa07498e9fc47",
"assets/assets/fonts/poppins/Poppins-Light.ttf": "1bb10326b972c92be6c59c048a4327e4",
"assets/assets/GoogleSansRegular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"assets/assets/androidNativeApp.jpg": "fd80f67c871feef2031d093d442b9a4c",
"assets/assets/YClogo.png": "50e526538854b6a7e95585cc0ffffcab",
"assets/assets/dodecaCopter.jpg": "e03ed351db8b1a4cec0754660142638f",
"assets/assets/deepLearningProject.jpg": "198fae0de587a015d7ef733d8fa4fdb3",
"assets/assets/FontManifest.json": "fc26ad8cb0c2c1bd0df400fba1a8e6fb",
"assets/assets/project_placeholder.jpg": "84fa007a80677d9e29b3c1760193a6a7",
"assets/assets/webDevelopmentProject.jpg": "08b4f967a5faee0a74617957a0d95f2c",
"assets/assets/preview_placeholder.jpg": "a3d9ff4dc293531f1f0a4b7cb2f17c37",
"assets/assets/flutterApp.jpg": "1ab169bc8dd324f003df13dd87146779",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "825e75415ebd366b740bb49659d7a5c6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "79d80c8b11210a5bdc305c5ae3179eb6",
"assets/NOTICES": "2db9e91ba17e7936a4739464522a87cb",
"main.dart.js": "9258c766efe8a5455344f5ccf9f3fd3d",
"manifest.json": "218160b7641886fdf86132ab637dcce6",
"version.json": "7367c9ca1c69727a8bb09a7d2d21d48c",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"flutter_bootstrap.js": "b430150006e71b63c25f0f05a5c7275f",
"project.html": "d33abfe5c22b8bc028352093a64350c1",
"project_info.html": "f7cefbb77dae33e73dcb569382da22fb",
"main.dart.mjs": "7c95726cca727d686b6b19907a8df8f8",
"index.html": "96cedc4b7baa3ae632033c55d9d11126",
"/": "96cedc4b7baa3ae632033c55d9d11126",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
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
