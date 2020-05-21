'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/manifest.json": "218160b7641886fdf86132ab637dcce6",
"/project_info.html": "f7cefbb77dae33e73dcb569382da22fb",
"/index.html": "125bd1393368c144889af0d0104ece94",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/AssetManifest.json": "a27b5b66afe4835a43a27b69c4af753f",
"/assets/LICENSE": "a8049a27651f4d3f05d08ab3e9b17397",
"/assets/assets/yc.jpeg": "dc07ada316cda966ccf0f20a04e038d0",
"/assets/assets/YClogo.png": "50e526538854b6a7e95585cc0ffffcab",
"/assets/assets/androidNativeApp.jpg": "fd80f67c871feef2031d093d442b9a4c",
"/assets/assets/dodecaCopter.jpg": "e03ed351db8b1a4cec0754660142638f",
"/assets/assets/deepLearningProject.jpg": "198fae0de587a015d7ef733d8fa4fdb3",
"/assets/assets/webDevelopmentProject.jpg": "08b4f967a5faee0a74617957a0d95f2c",
"/assets/assets/GoogleSansRegular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"/assets/assets/flutterApp.jpg": "1ab169bc8dd324f003df13dd87146779",
"/assets/assets/FontManifest.json": "fc26ad8cb0c2c1bd0df400fba1a8e6fb",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/FontManifest.json": "1aec13edc46e7b323f753e17a04186ab",
"/icons/Icon-512.png": "4754d57e73829290fe3488851cbac8e8",
"/icons/Icon-192.png": "4754d57e73829290fe3488851cbac8e8",
"/main.dart.js": "330bac55e3bbfbb275c3f247888508a8",
"/project.html": "d33abfe5c22b8bc028352093a64350c1"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
