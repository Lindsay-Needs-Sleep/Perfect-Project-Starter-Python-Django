// Required to be at the top level dir for vscode dbaeumer.vscode-eslint eslint extension which formats code on save
import config from './vol_shared/eslint.config.mjs';
import node_src_overrides from './node_src/eslint.config.overrides.mjs';
import vite_src_overrides from './vite_src/eslint.config.overrides.mjs';

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
