'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/manifest.json": "eac86fbafdc7fc64217b8c9c547f9366",
"/index.html": "99e87eb18f19de155f0f4f97c0a241ed",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/AssetManifest.json": "d174dcbc06544d994d328c8656aeabaf",
"/assets/LICENSE": "1a80be6c5724a31e6f9c9e06dba53b63",
"/assets/assets/yc.jpeg": "dc07ada316cda966ccf0f20a04e038d0",
"/assets/assets/GoogleSansRegular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"/assets/assets/FontManifest.json": "fc26ad8cb0c2c1bd0df400fba1a8e6fb",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/FontManifest.json": "1aec13edc46e7b323f753e17a04186ab",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/main.dart.js": "d95bfaf6d1e36d83c4aee6747130a8e2"
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
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
