# Functional-Programming-WS1516

Mein Mitschrieb von Functional Programming an der Uni Tübingen bei Torsten Grust im Wintersemester 2015/16.

# How to build

You can build this script using [http://nixos.org/nix/](`Nix`), the functional package manager. Using `Nix`, you do not have to worry about dependencies like `\*tex` packages at all. Just run

```sh
nix-build default.nix
```

and find the generated PDF in `result/Mitschrieb.pdf`. As `Nix` is functional, the output is the result of a pure function, described in `default.nix`. This removes alot of stress from building `\*tex` documents. Please note, that running this command the first time fill download alot of `\*tex` dependencies. After the first time, no network access is needed.

# Contributing

You are welcome to create a Pull Request to this script. Please generate the script then and include the new `Mitschrieb.pdf` in your PR. As `result` is just a symlink, you must do this in order to overwrite the old PDF file.

```sh
nix-build default.nix
cp result/Mitschrieb.pdf Mitschrieb.pdf
```
