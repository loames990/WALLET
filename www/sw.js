/* Smart Transit Wallet — service worker
   Permite que el prototipo funcione sin conexión, requisito para
   instalarlo como app (PWA) o empaquetarlo en un APK. */

const CACHE = 'stw-v1';

const ASSETS = [
  './',
  './index.html',
  './manifest.webmanifest',
  './assets/img/icono_wallet.png',
  './assets/img/icon-192.png',
  './assets/img/icon-512.png',
  './assets/img/walle1.jpg',
  './assets/img/home-hero.jpg'
];

self.addEventListener('install', e => {
  // addAll falla entera si un archivo no existe; los opcionales se piden uno a uno.
  e.waitUntil(
    caches.open(CACHE)
      .then(c => Promise.allSettled(ASSETS.map(u => c.add(u))))
      .then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys()
      .then(ks => Promise.all(ks.filter(k => k !== CACHE).map(k => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', e => {
  const req = e.request;
  if (req.method !== 'GET' || new URL(req.url).origin !== location.origin) return;

  // El documento: red primero (para ver cambios), caché como respaldo sin conexión.
  if (req.mode === 'navigate') {
    e.respondWith(
      fetch(req)
        .then(r => {
          const copy = r.clone();
          caches.open(CACHE).then(c => c.put(req, copy));
          return r;
        })
        .catch(() => caches.match(req).then(r => r || caches.match('./index.html')))
    );
    return;
  }

  // Estáticos: caché primero.
  e.respondWith(
    caches.match(req).then(hit => hit || fetch(req).then(r => {
      if (r.ok) {
        const copy = r.clone();
        caches.open(CACHE).then(c => c.put(req, copy));
      }
      return r;
    }).catch(() => hit))
  );
});
