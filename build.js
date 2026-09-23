const fs = require('fs');
const path = require('path');

const targetDir = path.join(__dirname, 'www');
if (!fs.existsSync(targetDir)) {
  fs.mkdirSync(targetDir, { recursive: true });
}

// Copy assets directory
const srcAssets = path.join(__dirname, 'assets');
const destAssets = path.join(targetDir, 'assets');
if (fs.existsSync(srcAssets)) {
  fs.cpSync(srcAssets, destAssets, { recursive: true });
}

// Copy single files
const files = ['index.html', 'manifest.webmanifest', 'sw.js'];
for (const file of files) {
  const src = path.join(__dirname, file);
  const dest = path.join(targetDir, file);
  if (fs.existsSync(src)) {
    fs.copyFileSync(src, dest);
  }
}

console.log('Build completed: Web assets successfully copied to www/');
