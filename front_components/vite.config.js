import { defineConfig } from 'vite'

// https://vitejs.dev/config/
export default defineConfig(({ command, mode, ssrBuild }) => {
    const prod = mode == 'production';
    return {
        publicDir: './public/',
        build: {
            outDir: './public/bundles/',
            copyPublicDir: false,
            minify: prod,
            sourcemap: prod ? 'hidden' : true,
            lib: {
                entry: 'src/my-element.js',
                formats: ['es'],
            },
            rollupOptions: {
                external: /^lit/,
            }
        },
        server: {
            watch: {
              usePolling: true
            }
          }
    }
})
