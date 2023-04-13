import { defineConfig } from 'vite'

// https://vitejs.dev/config/
export default defineConfig({
    publicDir: '../public/',
    build: {
        outDir: '../public/bundles/',
        copyPublicDir: false,
        lib: {
            entry: 'src/my-element.js',
            formats: ['es'],
        },
        rollupOptions: {
            external: /^lit/,
        },
    },
})
