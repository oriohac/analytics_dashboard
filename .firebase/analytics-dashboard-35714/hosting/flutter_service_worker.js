'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "9888fba89868262a0706879ba9f33e51",
"main.dart.js": "524f63d91fe870468ec699febd275cac",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"manifest.json": "1e39740b0c0f15f9b9600a0b00d0fa5e",
"assets/AssetManifest.bin": "58c98f86adcab8aa96156af18cc05521",
"assets/AssetManifest.bin.json": "5ee24fefab35e12f88b17ba2f615ecf8",
"assets/AssetManifest.json": "9d9cf7aa8c8d2bc14b2857ae2944b3ef",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/lib/assets/fonts/Jakarta.ttf": "2f5e58f99464aa2582e5ce6f75aff5f3",
"assets/lib/assets/images/usersicon1.png": "0c27ad71e106c3a68a7397e3c5f0bf30",
"assets/lib/assets/images/discount-shape.svg": "0193bdb45a269973f8c6d4f4017a2cab",
"assets/lib/assets/images/box-tick.svg": "19bc5cb815496a44a722765de85ddb96",
"assets/lib/assets/images/category.svg": "b0c9d65de9753570d675899f241c2eaf",
"assets/lib/assets/images/trend-up.svg": "454431e7ed26380fa396aaeb3a93e845",
"assets/lib/assets/images/box.svg": "2ead87245a418ad966e916afad9fba41",
"assets/lib/assets/images/brightness.svg": "3c420c9388aaa0dfd3e04e6cbc5f35ec",
"assets/lib/assets/images/appbaricon.png": "25483664ef6cdaf7548d1f9614efd4e6",
"assets/lib/assets/images/coin.svg": "99a9112b442e0c3452e8b00b79d24c48",
"assets/lib/assets/images/liltrendingdown.svg": "0882bcb332c8d8e0c3ef5d26d0dd83b9",
"assets/lib/assets/images/usersicon3.png": "b42d5489e05f184c1a71a95f3e5a6060",
"assets/lib/assets/images/moon.svg": "fe1d70ab77d333ca5c5df741726d8d94",
"assets/lib/assets/images/solar_calendar-linear.svg": "bd88f1adafb82acdb99945e53e12dc78",
"assets/lib/assets/images/document-download.svg": "604b4a591fd15ffb0a0619b3d132419c",
"assets/lib/assets/images/setting.svg": "72de5893922ff5a0e57624234b1637c9",
"assets/lib/assets/images/profile-user.svg": "8fe7a3edea4a99c25061d88035ca1314",
"assets/lib/assets/images/usersicon2.png": "917ca63911c5591043b4968878a98538",
"assets/lib/assets/images/shopping-cart.svg": "05973a8a0c10397bbf3dc58d7ced1f23",
"assets/lib/assets/images/high.svg": "9fe68dfb22f781378e712c9915dc46bd",
"assets/lib/assets/images/solar_bell-outline.svg": "e54747172b1a31ea78fe1f6b741cc4de",
"assets/lib/assets/images/usersicon5.png": "098d764e17a9d267bb93483645a3b15c",
"assets/lib/assets/images/liltrendingup.svg": "8aad5642da3baee3f871a7df66964917",
"assets/lib/assets/images/rotate.svg": "800421cf6311516769901016860bf1e4",
"assets/lib/assets/images/vector.svg": "ed2274001c19f2591c9ab4f0f48cde69",
"assets/lib/assets/images/arrow-right.svg": "d8688caf5afd9b086c621f183bd05e32",
"assets/lib/assets/images/info-circle.svg": "a3d51220dc054f62224d12e4f030c880",
"assets/lib/assets/images/arrowdown.svg": "010b3ad2b1addcb141fe25b512388fc7",
"assets/lib/assets/images/low.svg": "8898628a9cec39c1a365946a72693dce",
"assets/lib/assets/images/usersicon4.png": "1589ca1bfebf8f72b32d986ab30f8b3a",
"assets/lib/assets/images/logout.svg": "b6962dba782bd2bb4bee96604c4adda1",
"assets/fonts/MaterialIcons-Regular.otf": "8e4d7e85ae4c0118cd0b046a6d4e25e4",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/NOTICES": "278955f9b5a51ed1e31583c8c138fdea",
"assets/FontManifest.json": "992a417da66a2a50bcf647cbc8694046",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "f308d986562dd0b04e0d7b07e3fe25f5",
"/": "f308d986562dd0b04e0d7b07e3fe25f5",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4"};
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
