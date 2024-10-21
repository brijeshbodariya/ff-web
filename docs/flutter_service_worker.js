'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "d7d285befded63c856c18d38b9df3005",
"version.json": "abcc4a0b827ab311adab5f0c33a73051",
"index.html": "64699810d54cc1c217c73975b6afc385",
"/": "64699810d54cc1c217c73975b6afc385",
"main.dart.js": "d07b761228d3eb08fcc3d2863aadd30c",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "960367f920b12d5bea00ec6caf5a6450",
"assets/AssetManifest.json": "b864f4c17e20ac6a05cc49f154e07142",
"assets/NOTICES": "14f03c76f0ef8e1dcb24dbb1033442bf",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "03e9b7fe6d4d2ac351485d2888d7eea3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "2206cc7227f1cacdee674379d3e419c4",
"assets/fonts/MaterialIcons-Regular.otf": "0e6b016990cf441cfe619c31ae763c16",
"assets/assets/ads/ads_data.json": "7e5aa78ea2b434fd8d167879b05823e3",
"assets/assets/images/img_splash_bg.png": "4fffea16fbf13dda74a4f53fc3227677",
"assets/assets/icons/ic_61-70.png": "94d87b07fab11119140850f56d19f510",
"assets/assets/icons/ic_sport_car.png": "1b41f6ff9e9dd31f3af969c1a6b703b5",
"assets/assets/icons/ic_advance_calculator.png": "52f13bf62b9c37f753341747f7fc4c12",
"assets/assets/icons/ic_info_make_it_rain.png": "de9e2c2953787e5b0bdaa485ef6a65fd",
"assets/assets/icons/ic_ff_character.png": "6e55423f8cfdff64883bb116dfed8db4",
"assets/assets/icons/ic_ff_shiba.png": "40cf2efa495ac1389424c151978af203",
"assets/assets/icons/ic_ff_exclusive_maps.png": "af1ec7e455b54d93f717821b8d9f8d16",
"assets/assets/icons/ic_military_jeep.png": "a41373903a93bf255989faba5f9baf04",
"assets/assets/icons/ic_ff_tips_tricks.png": "a94fab8639496778f049d26a79685de0",
"assets/assets/icons/ic_council%2520hall.png": "ed6f536567dcbe8ba810f1b48d96895d",
"assets/assets/icons/ic_info_one_finger.png": "104a9f4185ad926c11b53a509ae2457b",
"assets/assets/icons/ic_caroline.png": "9cd440cd9e222da636ff6a69e0fbd3c9",
"assets/assets/icons/ic_get_daily_diamond.png": "fa19c4f47e1d8c2b280970bebf78b8d3",
"assets/assets/icons/ic_ffwc_throne.png": "dceebfc70e15055d28d22931a13597e1",
"assets/assets/icons/ic_kla.png": "6ad41a3a02f518926a200ba02e5fccaf",
"assets/assets/icons/ic_miguel.png": "260c4838580b0f74d7f5b7644aaf55ff",
"assets/assets/icons/ic_info_ff_ottero.png": "3f8de6c927c61f433342e63596756dba",
"assets/assets/icons/ic_antonio.png": "01f6bfb45b13214bb04247eb1556dd00",
"assets/assets/icons/ic_exclusive_emotes.png": "e6a6dff9e396bb9473cbb800a2ef9ec7",
"assets/assets/icons/ic_kelly.png": "ff5356a4c7ae40872d74ae67108e4567",
"assets/assets/icons/ic_80.png": "d824127da32c3f97f99f95ba9e4800c0",
"assets/assets/icons/ic_info_take_cover.png": "89e79a829277f43e8887301c3d2112a8",
"assets/assets/icons/ic_info_ff_shiba.png": "e91ea5cf7726c50005f30615a3f2ed63",
"assets/assets/icons/ic_wukong.png": "3b00c068138eaf4ee88b6b6dc00715a0",
"assets/assets/icons/ic_yes.png": "be1882097b56b3b3d66eeca0b3e4e489",
"assets/assets/icons/ic_pro_football.png": "5ebc903f8775ed377752eacc4933ada0",
"assets/assets/icons/ic_amphibian.png": "455e4b56909b2a38855e0add8ef60d0a",
"assets/assets/icons/ic_ff_weapons.png": "f07a0f8ee81c42fd043fe086474846e0",
"assets/assets/icons/ic_threaten.png": "212f29d9dc49af33a5c95d14e0bfb392",
"assets/assets/icons/ic_info_bhangra.png": "ed7788feb4feb191945a082bab211a14",
"assets/assets/icons/ic_provoke.png": "fa2b9135216586bed356949c3a4dee98",
"assets/assets/icons/ic_info_baby_shark.png": "8f5b8f99106015bddeeb8059aab7fa2e",
"assets/assets/icons/ic_info_ff_robo.png": "e1ff19854a31c924e8b19ca754488f8f",
"assets/assets/icons/ic_ford.png": "9acbc4e62cdea263e2367263d3a353c2",
"assets/assets/icons/ic_8.png": "8839112594d90dbd52e9b176034bfb7e",
"assets/assets/icons/ic_splash.png": "11f9bf5b0ba9482f2099cc998cffba24",
"assets/assets/icons/ic_info_ff_moony.png": "af5fca8a1711eec3b645024cfff12b77",
"assets/assets/icons/ic_info_eat_my_dust.png": "dd4b826f5197e1c3b0396c2e839a6d18",
"assets/assets/icons/ic_tuk_tuk.png": "1328d0a2da695854e2ccc180957f99a4",
"assets/assets/icons/ic_basic_calculator.png": "93f772fb24bdc9c1120ba1cf7bfd9637",
"assets/assets/icons/ic_ff_yeti.png": "57312540fa09e441312c23951bcc5bad",
"assets/assets/icons/ic_info_council_hall.png": "dd5f866d52ce61dc3cecf234fb6af0b4",
"assets/assets/icons/ic_51-60.png": "f4465d351bae1d8049382b5b2694d214",
"assets/assets/icons/ic_celebrate.png": "32f3a0750eb516466b604dcbfdc28df1",
"assets/assets/icons/ic_hampton.png": "9ae73b344b41ce36acda9fcfbbf11a17",
"assets/assets/icons/ic_info_threaten.png": "624086af58536435bd6319b1a6bed899",
"assets/assets/icons/ic_pro_player.png": "a4d829274e97cbff21de883724173eab",
"assets/assets/icons/ic_ff_moony.png": "a6d66ed0ee1bef8b9b26272c1795fc9a",
"assets/assets/icons/ic_ff_calculator.png": "ba9d8985b8493661fa7d481bdde079ea",
"assets/assets/icons/ic_calculator_now.png": "b4f74f9c468227e879aff10daad4c70f",
"assets/assets/icons/ic_paloma.png": "e837cee92e9ffc5a185f3b69ad2f5b51",
"assets/assets/icons/ic_2.png": "9419619d175d434152857bf1b900e460",
"assets/assets/icons/ic_info_hampton.png": "549fe4e32706ab6585121fec7f9599f8",
"assets/assets/icons/ic_info_ff_yeti.png": "4e9a889f1fea40db9bdd3c6ff40d4190",
"assets/assets/icons/ic_3.png": "7131bf0c04487bee53faedfe9fd20bdd",
"assets/assets/icons/ic_ff_derki.png": "777d5ec92fb4ae0ce44c4e033776897c",
"assets/assets/icons/ic_mix_player.png": "b53c2761c141093bdbee95ec155e3e66",
"assets/assets/icons/ic_1.png": "c4cfda375f432d7d6546547076100483",
"assets/assets/icons/ic_info_ffwc_throne.png": "c15091f79ebbc912569eaea2088685ea",
"assets/assets/icons/ic_santa_catarina.png": "afabf757c2cdbddaab02fce3ffd425f8",
"assets/assets/icons/ic_baby_shark.png": "2cf330ce0212ce7b72b244975e2ce8a7",
"assets/assets/icons/ic_ff_panda.png": "1790dba46627a209f0927c4dccda9ea8",
"assets/assets/icons/ic_normal_calculator.png": "7305f675eafa3975cf06998ffc3ae22a",
"assets/assets/icons/ic_nikita.png": "4aa542ceaa2015bc0270283fe2a39d00",
"assets/assets/icons/ic_4.png": "37082e01a4e7c445ff8e7f906cccd336",
"assets/assets/icons/ic_info_pushup.png": "8ff54fd8fe9a69c9abacb0ece1199e25",
"assets/assets/icons/ic_council_hall.png": "ed6f536567dcbe8ba810f1b48d96895d",
"assets/assets/icons/ic_hayato.png": "72db4b6a8e9cc92775254acffdb1da2c",
"assets/assets/icons/ic_ff_robo.png": "72171db7883922e6ae446636b34ac57e",
"assets/assets/icons/ic_bhangra.png": "f0d0bd79714a92c19b9b4099f630b096",
"assets/assets/icons/ic_41-50.png": "111a2fd11d96a7bd50809c46d42b000e",
"assets/assets/icons/ic_info_provoke.png": "74a735cbe0494f7b99f63b8577715411",
"assets/assets/icons/ic_5.png": "ff33374dc7afde0f0af7ff6c7dac72a1",
"assets/assets/icons/ic_info_santa_catarina.png": "f0168c09babbbc44293cb461a649a759",
"assets/assets/icons/ic_7.png": "5035e804d36607181dcad26f22b7ba10",
"assets/assets/icons/ic_back.png": "10cfa1d6b4eb52ad2c6d3155beb70cc2",
"assets/assets/icons/ic_info_celebrate.png": "41bafecf3bcb2a66e4648cea9cc6fd88",
"assets/assets/icons/ic_info_ff_derki.png": "9e7c70e808374bc82438d4aef76699b1",
"assets/assets/icons/ic_pets_enforcement.png": "df02b00b4183f52cb1d1b7230e745c1e",
"assets/assets/icons/ic_info_ff_panda.png": "44c6240ae226a62fff856d2a8cdfe82c",
"assets/assets/icons/ic_6.png": "229c092e661e0875b8c7e0f5470cf2b0",
"assets/assets/icons/ic_moco.png": "dbb835072b19407cee04c28dd8d8d1b3",
"assets/assets/icons/ic_van.png": "b828fe832f89bcfd19c4dba6a6a924b2",
"assets/assets/icons/ic_info_ff_flash.png": "e5a5c9cc91103d839a6795398c9f53a3",
"assets/assets/icons/ic_one_finger.png": "31c8d03e361a8b793cb39dc51d06e05c",
"assets/assets/icons/ic_causal_player.png": "9fcba8bd785c2e173995d68b60145265",
"assets/assets/icons/ic_bayfront.png": "9f004f4b99c47466c9cbc717fe7acdfc",
"assets/assets/icons/ic_active_now.png": "1ed05100699ff4707a1e8635e503f8e7",
"assets/assets/icons/ic_ff_vehicles.png": "d2e9b08fbee441347242841376b70e7d",
"assets/assets/icons/ic_motor_cycle.png": "bdc61e6f7570241595d577660fa51da7",
"assets/assets/icons/ic_ok.png": "0bf9f77d5fe78e18713159f2375da57c",
"assets/assets/icons/ic_no.png": "42aeebf9e6954eedb997622c01368bd7",
"assets/assets/icons/ic_misha.png": "50ca32ed5b9f6627126fd57da92a25c9",
"assets/assets/icons/ic_make_it_rain.png": "f99248cbd53e8583cb2e0e94ff9c643d",
"assets/assets/icons/ic_lets_started.png": "a4f6e26d4a48c9154627ea2a170acb99",
"assets/assets/icons/ic_exc_player.png": "198be86eb1947739de41e4c9fc3b0c6c",
"assets/assets/icons/ic_eat_my_dust.png": "9c53a962610a92bcddb53bf6a0750544",
"assets/assets/icons/ic_monster_car.png": "b719da3e6633c885ec8d7f122032c761",
"assets/assets/icons/ic_take_cover.png": "741085622b9520db7be3f78c0ea78d4c",
"assets/assets/icons/ic_0-25.png": "9813217e8f876f4c4f89ee969a227463",
"assets/assets/icons/ic_ff_flash.png": "d7a91617cca2f5b365461367bd15fe5b",
"assets/assets/icons/ic_ff_ottero.png": "b93c6fd15da2c836c43840b153e8d0c3",
"assets/assets/icons/ic_olivia.png": "d53eb47c3584da2bb12f848d716b5510",
"assets/assets/icons/ic_maxim.png": "4b9a51242ac8b60f251a55400f739f09",
"assets/assets/icons/ic_info_pro_football.png": "85299cda72021bdd990b871d255702ca",
"assets/assets/icons/ic_pushup.png": "61869a64a090e0c2c85b0dd8ae200f08",
"assets/assets/icons/ic_andrew.png": "f7e4f4edc5ca42ecef770f0d37b09f36",
"assets/assets/icons/ic_info_bayfront.png": "cd925e414dd7f6f499a43de6550caf3c",
"assets/assets/icons/ic_26-40.png": "70f05874ab9b3729d09c103b74357b48",
"assets/assets/icons/ic_ff_daily_diamond.png": "8c55b65f73bd4b20b7fee1660e0934b5",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
