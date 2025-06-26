# Aseprite Type Definition

![Demo of suggest in VSCode](https://gyazo.com/2a91bc263590356d218dbeae3209cfb8.gif)

A lua type definition for [Aseprite API](https://www.aseprite.org/api/) based on [lua-language-server](https://github.com/sumneko/lua-language-server).
The supported API version is `34` (since Aseprite version `1.3.14.3`)

The API types are defined in [./definitions/aseprite.lua](./definitions/aseprite.lua).
You can integrate them into your workspace by copying the file, cloning the repository, or adding it as a Git submodule.

It is strongly recommended that `Cast Number to Integer` be turned **off** in settings.