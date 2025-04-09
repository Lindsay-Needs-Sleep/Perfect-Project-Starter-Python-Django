import globals from 'globals';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import js from '@eslint/js';
import { FlatCompat } from '@eslint/eslintrc';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const compat = new FlatCompat({
    baseDirectory: __dirname,
    recommendedConfig: js.configs.recommended,
    allConfig: js.configs.all
});

export default [
    {
        // https://eslint.org/blog/2022/08/new-config-system-part-2/#glob-based-configs-everywhere
        ignores: ['**/node_modules/*', '**/public/*'],
    },
    ...compat.extends('eslint:recommended'),
    {
        languageOptions: {
            ecmaVersion: 2025,
            sourceType: 'module',
        },

        rules: {
            indent: ['error', 4, {
                ignoredNodes: ['TemplateLiteral > *'],
            }],

            'linebreak-style': ['error', 'unix'],
            quotes: ['error', 'single'],
            semi: ['error', 'always'],

            'no-unused-vars': ['error', {
                vars: 'all',
                args: 'none',
                ignoreRestSiblings: true,
            }],
        },
    },
    {
        files: ['**/vite_src/**'],
        languageOptions: {
            globals: {
                ...globals.browser,
                window: true,
            },
        },
    },
    {
        files: ['**/node_src/**'],
        languageOptions: {
            globals: {
                ...globals.node,
            },
        },
    },
];
