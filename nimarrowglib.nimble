# Package

version       = "0.1.0"
author        = "Arkanoid87"
description   = "Nim bindings for Apache Arrow-glib"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["nimarrowglib"]


# Dependencies

requires "nim >= 1.6.0"
requires "futhark"