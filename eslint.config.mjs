// Required to be at the top level dir for vscode dbaeumer.vscode-eslint eslint extension which formats code on save
import config from './vol_shared/eslint.config.mjs';
import proj_node_overrides from './proj_node/eslint.config.overrides.mjs';
import proj_vite_overrides from './proj_vite/eslint.config.overrides.mjs';

export default [
    ...config,
    {
        files: ['**/proj_vite/**'],
        ...proj_vite_overrides,
    },
    {
        files: ['**/proj_node/**'],
        ...proj_node_overrides,
    },
];
