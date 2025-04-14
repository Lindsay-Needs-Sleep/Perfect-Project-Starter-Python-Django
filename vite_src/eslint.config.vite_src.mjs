// Must build the override slightly different than at the top-level (because we can't filter these files by their parent directory like we can from the top)
import config from './shared_volume/eslint.config.mjs';
import vite from './shared_volume/eslint.config.vite_src.overrides.mjs';

export default [
    ...config,
    vite,
];
