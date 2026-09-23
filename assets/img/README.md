# assets/img — Imágenes del prototipo

El prototipo carga las imágenes **por nombre de archivo**. Para cambiar una,
reemplaza el archivo: no hay que tocar el código.

## Archivos reconocidos

| Archivo | Dónde aparece | Estado |
|---|---|---|
| `icono_wallet.png` | Ícono de pestaña, de app iOS/Android y del manifest | ✅ en uso |
| `walle1.jpg`   | **Fondo global** de toda la app | ✅ en uso |
| `home-hero.jpg`| Banner superior del **Dashboard** | ✅ en uso |
| `wallet-hero.jpg` | Banner superior de la pantalla **Wallet** | ⬚ opcional |
| `card-bus.png`    | Arte de fondo de las tarjetas **TRANSIT** | ⬚ opcional |
| `card-metro.png`  | Arte de fondo de las tarjetas **METRO** | ⬚ opcional |
| `card-mio.png`    | Arte de fondo de las tarjetas **MIO PASS** | ⬚ opcional |
| `card-citybus.png`| Arte de fondo de las tarjetas **CITYBUS** | ⬚ opcional |

Los archivos opcionales **no son obligatorios**: si no existen, el banner se
oculta solo y las tarjetas conservan su degradado original. Nada se rompe.
Puedes agregarlos de a uno.

## Cambiar de formato

Los nombres, **con su extensión**, están en la constante `IMG` dentro de
`index.html`. Si subes `wallet-hero.png` en vez de `.jpg`, ajusta ahí el valor.

## Peso de las imágenes

Los fondos están comprimidos a **900 px de ancho y JPEG calidad 78**
(de 3.8 MB a 252 KB en total). Si reemplazas alguno, respeta ese orden de
magnitud: un fondo de 2 MB arruina la carga en redes móviles, que es
justamente el escenario de uso de esta aplicación.

El ícono se deja en PNG porque necesita transparencia.

## Nota al abrir el prototipo

Las imágenes **no cargan** si abres `index.html` con doble clic (`file://`).
Usa un servidor local:

```powershell
python -m http.server 8080
```
