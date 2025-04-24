// this is the eslint config that is used when inside this proj's container
import config from './shared_volume/eslint.config.mjs';
import overrides from './eslint.config.overrides.mjs';

// Must build the override slightly different than at the top-level (because we can't filter these files by their parent directory like we can from the top)
export default [
    ...config,
    overrides,
];
