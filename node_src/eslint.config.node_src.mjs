// Required for vscode dbaeumer.vscode-eslint eslint extension which formats code on save
import config from './shared_volume/eslint.config.mjs';
import node from './shared_volume/eslint.config.node_src.overrides.mjs';

export default [
    ...config,
    node,
];
