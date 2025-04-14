// Required to be at the top level dir for vscode dbaeumer.vscode-eslint eslint extension which formats code on save
import config from './shared_volume/eslint.config.mjs';
import node_src_overrides from './shared_volume/eslint.config.node_src.overrides.mjs';
import vite_src_overrides from './shared_volume/eslint.config.vite_src.overrides.mjs';

export default [
    ...config,
    {
        files: ['**/vite_src/**'],
        ...vite_src_overrides,
    },
    {
        files: ['**/node_src/**'],
        ...node_src_overrides,
    },
];
