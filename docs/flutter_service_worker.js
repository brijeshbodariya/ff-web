'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "837beba2e20c84f679afc5cc4e93997d",
"version.json": "abcc4a0b827ab311adab5f0c33a73051",
"index.html": "cd5ce4facc872d37b60efa61f0f64cee",
"/": "cd5ce4facc872d37b60efa61f0f64cee",
"main.dart.js": "70ad0b8262514e3297d7f0ef84f208c6",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "2a91e1ccff530e1dc30d480ec0167816",
"icons/Icon-192.png": "c50c9f809ebb1770a1e93507f8279786",
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
"assets/assets/ads/ads_data.json": "0fa23c52205548ebcbbdb81e238f268c",
"assets/assets/images/img_splash_bg.png": "4fffea16fbf13dda74a4f53fc3227677",
"assets/assets/icons/ic_61-70.png": "ae3689c4663dedef756412d7fe124cdb",
"assets/assets/icons/ic_sport_car.png": "337c16aeda9d6e31aba08c157812c09d",
"assets/assets/icons/ic_advance_calculator.png": "3a9a514cb2228b258893356b006fe25d",
"assets/assets/icons/ic_info_make_it_rain.png": "32c022abff014f8513d66362825b96a8",
"assets/assets/icons/ic_ff_character.png": "9c784b0ec5d2a93dbc3cf3aee0792ccd",
"assets/assets/icons/ic_ff_shiba.png": "d8e9db87857aa16441fcec72f53bd99d",
"assets/assets/icons/ic_ff_exclusive_maps.png": "1a26cfcb62b3d1054489019be46d22b9",
"assets/assets/icons/ic_military_jeep.png": "45e677915102173481d71831d8637216",
"assets/assets/icons/ic_ff_tips_tricks.png": "502cf2189f56ad7e2574fb49533019ee",
"assets/assets/icons/ic_council%2520hall.png": "8e399c663325b612da2b00f8a44b1bd7",
"assets/assets/icons/ic_info_one_finger.png": "470b4513d7ec99c131ff3f91f7418bfe",
"assets/assets/icons/ic_caroline.png": "24db327e9569db5870199d1892f37f68",
"assets/assets/icons/ic_get_daily_diamond.png": "c4f293f835d2ab3cbc818755b58c8138",
"assets/assets/icons/ic_ffwc_throne.png": "1e79a534ff22585d61e9882cde657131",
"assets/assets/icons/ic_kla.png": "fed642022509733e6b6866579260894b",
"assets/assets/icons/ic_miguel.png": "ba8dbdff45fdebe59779afa06e35af95",
"assets/assets/icons/ic_info_ff_ottero.png": "abe60e4b0f9a09c3dd3bfe3f7bcc7772",
"assets/assets/icons/ic_antonio.png": "c6fa1211b5aa21b2084647046e33edc4",
"assets/assets/icons/ic_exclusive_emotes.png": "1f87608067e0838e72e5585cbf9f1107",
"assets/assets/icons/ic_kelly.png": "9b9eea90414fd3bc283469458fb43bf9",
"assets/assets/icons/ic_80.png": "01e42f5df86a5bc95bb6d082b8ca58e4",
"assets/assets/icons/ic_info_take_cover.png": "ba7699382f51a9efce3423c61773e044",
"assets/assets/icons/ic_info_ff_shiba.png": "489cc32d8cd1667af52a3c60c832b9c5",
"assets/assets/icons/ic_wukong.png": "b2126c7bf2b58a25003fe6d3acb982e8",
"assets/assets/icons/ic_yes.png": "dd494b144856eb2106d872ce53b47cee",
"assets/assets/icons/ic_pro_football.png": "2b215d9c0a6460552d350acad7b7f562",
"assets/assets/icons/ic_amphibian.png": "b09c8ff0baaaf7d05a481e42ccc14c0f",
"assets/assets/icons/ic_ff_weapons.png": "bea486c4f08c4a3813ba03a8a6a56752",
"assets/assets/icons/ic_threaten.png": "72e5cc428014f7df0f8865747d3b056d",
"assets/assets/icons/ic_info_bhangra.png": "e8e2aac5bf9c63b2a317fb398314ae11",
"assets/assets/icons/ic_provoke.png": "d4ce17f9125db970a18f1b900ba2b2e4",
"assets/assets/icons/ic_info_baby_shark.png": "b0362779e732526e7c7e6c9d1219e88a",
"assets/assets/icons/ic_info_ff_robo.png": "6be2eac9e39d13224733c66b7e96350f",
"assets/assets/icons/ic_ford.png": "041d1dc0ad26c20dc69ee3f1a5f4dc25",
"assets/assets/icons/ic_8.png": "2d851e4c565394f47d58d40443ad8ff0",
"assets/assets/icons/ic_splash.png": "ea4a1c8d46db222ba7eada5e0ede25ab",
"assets/assets/icons/ic_info_ff_moony.png": "0d79ea0f8c42a38118dc009f729324b0",
"assets/assets/icons/ic_info_eat_my_dust.png": "f852f5227c7fabbccce0155b80890303",
"assets/assets/icons/ic_tuk_tuk.png": "4bb2351c4eecf7a27938939249f28e29",
"assets/assets/icons/ic_basic_calculator.png": "27424c1672466edd5dba8e43c67a8b67",
"assets/assets/icons/ic_ff_yeti.png": "9da5cbfa71005cafe32ce0b0b6421f93",
"assets/assets/icons/ic_info_council_hall.png": "a8b075d02e0e9d24c30aefaa98844ee3",
"assets/assets/icons/ic_51-60.png": "a1c3fc696b54e2209149cde9c4e62f1c",
"assets/assets/icons/ic_celebrate.png": "0f281892ec7b67cea251cc7b5402184f",
"assets/assets/icons/ic_hampton.png": "97274ec758b91e500c0475bb49979d36",
"assets/assets/icons/ic_info_threaten.png": "6f3261f67761cac51f7abef4fa566647",
"assets/assets/icons/ic_pro_player.png": "e6b592faab7b06e7421b338b9df7da6f",
"assets/assets/icons/ic_ff_moony.png": "c84ad751bb82caca841e88e001796373",
"assets/assets/icons/ic_ff_calculator.png": "4a4841acef60a4864bcec7c75b7d5b63",
"assets/assets/icons/ic_calculator_now.png": "2c5dc3424d2b32a562908c7dc4ddaadb",
"assets/assets/icons/ic_paloma.png": "a8102ca0cf1dcd8ec3c89f5ef65d36ce",
"assets/assets/icons/ic_2.png": "0adf6123bd20e405e48c2b74c8a628fb",
"assets/assets/icons/ic_info_hampton.png": "5d8da3349edfdbdd751c05157950ed72",
"assets/assets/icons/ic_info_ff_yeti.png": "cb13d431dbc5ad8a92c38caff8afb9f9",
"assets/assets/icons/ic_3.png": "3907cf3a3a1f905aebd5191ff9c36b3e",
"assets/assets/icons/ic_ff_derki.png": "a86c603fa050b4d06a0185377f9aa97f",
"assets/assets/icons/ic_mix_player.png": "d01b0d952bb46e333e87b229e347f8ea",
"assets/assets/icons/ic_1.png": "7a9c5a11386ce213c3286298bc408377",
"assets/assets/icons/ic_info_ffwc_throne.png": "faeda952ca42a34e114f18d2c99c4fa3",
"assets/assets/icons/ic_santa_catarina.png": "c45502eddc4ff498e3f5279adfb91dee",
"assets/assets/icons/ic_baby_shark.png": "613bde220bc68921a388128957627280",
"assets/assets/icons/ic_ff_panda.png": "67ee1ceb3646066f53242bf93c15cbd5",
"assets/assets/icons/ic_normal_calculator.png": "a221506393e6274a0ffd0560f430c539",
"assets/assets/icons/ic_nikita.png": "f5e964934fd6cfa240c605b959cea007",
"assets/assets/icons/ic_4.png": "3284540e92230de42077558dd114da3b",
"assets/assets/icons/ic_info_pushup.png": "2f400e57710dd3e16db15d743e3fc466",
"assets/assets/icons/ic_council_hall.png": "f8cc4ed30aadb88f76242aa026772eec",
"assets/assets/icons/ic_hayato.png": "d52218faf1ba9ab9c2ffb81db12bc09b",
"assets/assets/icons/ic_ff_robo.png": "e88271408401e9f183504fdf79ff6cc9",
"assets/assets/icons/ic_bhangra.png": "3b86da6293e906025b18cb4d4d0ffe90",
"assets/assets/icons/ic_41-50.png": "39260022636f5bf2b700ab705296372d",
"assets/assets/icons/ic_info_provoke.png": "9ab9832b333cd6dc22a9311668f34bfb",
"assets/assets/icons/ic_5.png": "e51d4d7411909f93e0497faa8d40580a",
"assets/assets/icons/ic_info_santa_catarina.png": "fb74d3804f4c312670cee48b7d06ca8c",
"assets/assets/icons/ic_7.png": "deb7035f4c8b038939ee7bc98a5274bd",
"assets/assets/icons/ic_back.png": "9c5c1bfbee20498cdfc74cee5dac0d40",
"assets/assets/icons/ic_info_celebrate.png": "5e503b4e73afa24a7968f311d800070c",
"assets/assets/icons/ic_info_ff_derki.png": "b603fdea029db6e9d6069eaf882dd98b",
"assets/assets/icons/ic_pets_enforcement.png": "2b3a6eb9bdbf8b597027519c75d1f654",
"assets/assets/icons/ic_info_ff_panda.png": "5a5aeb8c76a01dc0bab69b200fa0c170",
"assets/assets/icons/ic_6.png": "d153ad9c18f94e9c5e6bd038ee7e52ae",
"assets/assets/icons/ic_moco.png": "6d5b5e32c77776ec36dadf322d438eb4",
"assets/assets/icons/ic_van.png": "e6c2b4b583f3a4fb94acf1012e1713c2",
"assets/assets/icons/ic_info_ff_flash.png": "2c7db1ad4d2a1fe4d40b2e60712f9c24",
"assets/assets/icons/ic_one_finger.png": "d59094f09f07a6a3dbc0c821e597f34d",
"assets/assets/icons/ic_causal_player.png": "a14fb4af378afdd7e2ae37da345d446d",
"assets/assets/icons/ic_bayfront.png": "77130489ff650cbf6a850a353f518f2d",
"assets/assets/icons/ic_active_now.png": "84d8132768c9971505049b0b8c896412",
"assets/assets/icons/ic_ff_vehicles.png": "1098870bbad6f43942629b67ea1c9f17",
"assets/assets/icons/ic_motor_cycle.png": "ec1b0f1ad00341a1bc0ba5ccbe03e393",
"assets/assets/icons/ic_ok.png": "abd769763a44d7ff3eb539247c1b2dab",
"assets/assets/icons/ic_no.png": "2b303fa679ad15291e8e566507610fd9",
"assets/assets/icons/ic_misha.png": "a519a8a634a1f9fcfd815293ced58a8e",
"assets/assets/icons/ic_make_it_rain.png": "c08a422403cc787881ebd2255225bf1f",
"assets/assets/icons/ic_lets_started.png": "24611d9cc35be63ae472f62f142b7167",
"assets/assets/icons/ic_exc_player.png": "30a733b6545065b24e80d762e3f05e64",
"assets/assets/icons/ic_eat_my_dust.png": "11003dec8001089a7a2a627fe336c491",
"assets/assets/icons/ic_monster_car.png": "13e3dabe04b5fa0742e3247585901c08",
"assets/assets/icons/ic_take_cover.png": "f474f115ddb6c556f18e2baf7b52a036",
"assets/assets/icons/ic_0-25.png": "95e7dca5332de7cfb47505adbf3ffa03",
"assets/assets/icons/ic_ff_flash.png": "490aaefb14a5a1596bea0b6463bfb4b3",
"assets/assets/icons/ic_ff_ottero.png": "3c7f8d6cabbafd2d9239901e1fdfad22",
"assets/assets/icons/ic_olivia.png": "7b9729567111f0f38d080acb4fdb955d",
"assets/assets/icons/ic_maxim.png": "24e53ef8bc0b538684aa5e1e7ffccd7c",
"assets/assets/icons/ic_info_pro_football.png": "c732d475f1440130214a88330baa2d1b",
"assets/assets/icons/ic_pushup.png": "1bd70607f92398c1a05066be6451ed73",
"assets/assets/icons/ic_andrew.png": "986027877cb5d253ee74a408be27cf4b",
"assets/assets/icons/ic_info_bayfront.png": "ff810b57c92ea2fcea661e44c22dfa69",
"assets/assets/icons/ic_26-40.png": "0fdb579a72eb9af6c9133c4b0cc0aa25",
"assets/assets/icons/ic_ff_daily_diamond.png": "c07ca473358df3b4511e2a50e62704cf",
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
