# Smart Transit Wallet 🚊💳

Aplicación web progresiva (PWA) para la consulta, registro y administración de tarjetas de transporte público (TransMilenio, Metro, SITP, MIO). Diseñada para ofrecer una experiencia móvil moderna, fluida y con soporte offline.

## ✨ Características

- 📱 **Diseño Móvil & PWA:** Totalmente responsiva e instalable en dispositivos móviles o escritorio.
- ⚡ **Despliegue Inmediato:** Preparada para producción en **Vercel** con cabeceras de seguridad y caché optimizadas (`vercel.json`).
- 📶 **Soporte Offline:** Service Worker integrado (`sw.js`) para funcionamiento sin conexión tras la primera carga.
- 🎨 **Visualización de tarjetas y saldo:** Simulación interactiva de tarjetas, movimientos y recargas.

## 🚀 Despliegue en Vercel

1. Ve a [Vercel](https://vercel.com) e inicia sesión con tu cuenta de GitHub.
2. Haz clic en **"Add New Project"** y selecciona el repositorio `loames990/WALLET`.
3. Deja los valores por defecto (Framework Preset: **Other** / Root Directory: `./`).
4. Haz clic en **Deploy**.

## 🛠️ Estructura del Proyecto

```
.
├── assets/
│   └── img/                 # Íconos, banners y recursos gráficos
│       ├── icon-192.png
│       ├── icon-512.png
│       ├── icono_wallet.png
│       ├── home-hero.jpg
│       ├── walle1.jpg
│       └── README.md
├── index.html               # Aplicación principal
├── manifest.webmanifest     # Manifiesto de la PWA
├── sw.js                    # Service Worker (Caché y soporte offline)
├── vercel.json              # Configuración y cabeceras de seguridad para Vercel
├── .gitignore               # Archivos ignorados por Git
└── README.md                # Documentación del proyecto
```

## 💻 Desarrollo Local

Para probar localmente (requerido para probar Service Workers y Assets):

```bash
# Con Python
python -m http.server 8080

# O con npx serve
npx serve .
```

Luego abre tu navegador en `http://localhost:8080`.
