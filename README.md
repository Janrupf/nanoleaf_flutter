# Nanoleaf Flutter
Desktop (and maybe mobile) Application to control your Nanoleafs.

## Disclaimer
**This project is in a somewhat early state**. Basic device control already works, but 
features like installing and removing effects are not implemented yet (choosing effects 
works already!). The UI might also need some cleanup.

## Why
This is meant to provide an alternative for the official Desktop App from Nanoleaf. 
Thanks to the OpenAPI and the more or less accurate documentation, this project has been
born. Other than the official beta desktop Application, Nanoleaf Flutter also runs on 
Linux (and possibly the Web too).

## TODO List
(not complete)

- [ ] Adding/removing devices
  - [x] Using physical access (aka pushing the button)
  - [ ] Using the code
- [x] Basic device control (set color, effect, brightness)
- [ ] Triggering firmware updates
- [ ] Effect gallery
- [ ] "Painting" the panels (per panel color configuration)
- [ ] Significantly improved UI

## Similar projects
| Name                    | URL                                                                                                                                    | Linux          | Windows | macOS        | Web        | iOS        | Android    | Language      |
|:-----------------------:|----------------------------------------------------------------------------------------------------------------------------------------|:--------------:|:-------:|:------------:|:----------:|:----------:|:----------:|:-------------:|
| Nanoleaf Desktop        | https://github.com/rowak/nanoleaf-desktop                                                                                              | Y              | Y       | Y            | N          | N          | N          | Java          |
| Nanoleaf Smarter Series | https://play.google.com/store/apps/details?id=me.nanoleaf.nanoleaf, https://apps.apple.com/us/app/nanoleaf-smarter-series/id1049333656 | N              | N       | N            | N          | Y          | Y          | ???           |
| Nanoleaf Desktop App    | https://research.nanoleaf.me/nanoleaf-desktop-app/                                                                                     | M (with hacks) | Y       | Y            | N          | N          | N          | NodeJS, C/C++ |
| Nanoleaf Flutter        | https://github.com/Janrupf/nanoleaf_flutter                                                                                            | Y              | Y       | Y (untested) | M (future) | M (future) | M (future) | Dart, C/C++   |

- Y = Yes
- M = Maybe
- N = No
