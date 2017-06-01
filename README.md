# Functional-Programming-WS1516

Mein Mitschrieb von Functional Programming an der Uni Tübingen bei Torsten Grust im Wintersemester 2015/16.

# How to build

You can build this script using [`Nix`](http://nixos.org/nix/), the functional package manager. Using `Nix`, you do not have to worry about dependencies like `*tex` packages at all. Just run

```sh
nix-build default.nix
```

and find the generated PDF in `result/Mitschrieb.pdf`. As `Nix` is functional, the output is the result of a pure function, described in `default.nix`. This removes alot of stress from building `*tex` documents. Please note, that running this command the first time will download alot of `*tex` dependencies. As `Nix` is lazy, no network access is required in subsequent builds.

# Contributing

You are welcome to create a Pull Request to this script. Please also recompile the script and include the new `Mitschrieb.pdf` in your PR. As `result` is just a symlink, you must do the following step in order to overwrite the old PDF file.

```sh
nix-build default.nix
cp result/Mitschrieb.pdf Mitschrieb.pdf
```
