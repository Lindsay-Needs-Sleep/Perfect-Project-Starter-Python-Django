// Required for vscode dbaeumer.vscode-eslint eslint extension which formats code on save
import config from './shared_volume/eslint.config.mjs';
import overrides from './eslint.config.overrides.mjs';

export default [
    ...config,
    overrides,
];
