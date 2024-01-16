# Prettierd Format

Sublime Text plugin to format files faster using [prettierd](https://github.com/fsouza/prettierd).

<br />

## Installation

1. Install [prettierd](https://github.com/fsouza/prettierd) globally with npm/yarn/pnpm:

```sh
npm i -g @fsouza/prettierd
```

2. Install this plugin with [Package Control](https://packagecontrol.io/packages/Prettierd%20Formatter):

`Package Control: Install Package` → `Prettierd Format`

3. Restart Sublime Text

<br />

## Usage

By default it formats on save any file supported by [Prettier](https://prettier.io/docs/en/) out-of-the-box.

### Commands

To format a file:

- `Prettierd: Format`

To save a file without formatting:

- `Prettierd: Save without formatting`

### Options

Enable/disable format on save:

```json
"format_on_save": true
```

Add additional extensions (enabled via prettier plugins) to be formatted either on save or commands:

```json
"additional_extensions": ["php"]
```

Exclude extensions from being formatted on save:

```json
"disabled_extensions_on_save": ["md"]
```

Exclude directories from being formatted on save:

```json
"disabled_directories_on_save": ["*/node_modules/*"]
```

<br />

## Notes

This plugin does nothing else than piping the input to `prettierd` and replacing the view contents with the output.

It is basically just like executing `cat file.js | prettierd file.js` with the command line.

For this reason, any issue with prettier plugins or configuration should be investigated on the [prettierd](https://github.com/fsouza/prettierd) repo as it is the underlying tool actually interacting with Prettier.

### Astro / Svelte

As of September 2023, there are some upstream issues with Astro and Svelte files.

You can format them with the command `LSP: format` after installing their LSPs and enabling format on save for each language in the LSP settings.

Using the above command not only respects the `.prettierrc` configuration but is also very fast.

<br />

## License

0BSD
