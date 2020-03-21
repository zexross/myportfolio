'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/manifest.json": "218160b7641886fdf86132ab637dcce6",
"/index.html": "f271ba9654781a3a611a655931aa25ee",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/AssetManifest.json": "6c232a14bafc93f75cc55e7bc943060b",
"/assets/LICENSE": "a8049a27651f4d3f05d08ab3e9b17397",
"/assets/assets/yc.jpeg": "dc07ada316cda966ccf0f20a04e038d0",
"/assets/assets/YClogo.png": "50e526538854b6a7e95585cc0ffffcab",
"/assets/assets/GoogleSansRegular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"/assets/assets/FontManifest.json": "fc26ad8cb0c2c1bd0df400fba1a8e6fb",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/FontManifest.json": "1aec13edc46e7b323f753e17a04186ab",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/main.dart.js": "c44b25f81521277d233b4f1bb5f7097d"
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
