[![Supervision Logo](supervision-logo.png)](#)

---

[![Active Development](https://img.shields.io/badge/Maintenance%20Level-Actively%20Developed-brightgreen.svg)](#)
[![Build](https://github.com/opengateware/console-supervision/actions/workflows/build-pocket.yml/badge.svg)](https://github.com/opengateware/console-supervision/actions/workflows/build-pocket.yml)
[![release](https://img.shields.io/github/release/opengateware/console-supervision.svg)](https://github.com/opengateware/console-supervision/releases)
[![license](https://img.shields.io/github/license/opengateware/console-supervision.svg?label=License&color=yellow)](#legal-notices)
[![issues](https://img.shields.io/github/issues/opengateware/console-supervision.svg?label=Issues&color=red)](https://github.com/opengateware/console-supervision/issues)
[![stars](https://img.shields.io/github/stars/opengateware/console-supervision.svg?label=Project%20Stars)](https://github.com/opengateware/console-supervision/stargazers)
[![discord](https://img.shields.io/discord/676418475635507210.svg?logo=discord&logoColor=white&label=Discord&color=5865F2)](https://chat.raetro.org)
[![Twitter Follow](https://img.shields.io/twitter/follow/marcusjordan?style=social)](https://twitter.com/marcusjordan)

## [Watara Supervision](https://en.wikipedia.org/wiki/Watara_Supervision) Compatible Gateware IP Core

This Implementation of a compatible Watara Supervision hardware in HDL is the work of [Pierre Cornier](https://github.com/pcornier) and [Jamie Blanks](https://github.com/Kitrinx).

## Overview

The Watara Supervision, also known as the QuickShot Supervision in the UK, is a monochrome handheld game console which was introduced in 1992 as a low-cost competitor for Nintendo's Game Boy. It came packaged with a game called Crystball, which is similar to Breakout. One unique feature of the Supervision was that it could be linked up to a television via a link cable. Games played in this way would display in four colors, much like Nintendo's Super Game Boy add-on for the SNES. A full color TV link was also in the works, but because of the Supervision's failure to make a major impression among gamers it was cancelled, along with the games which were in development for it. Only a tiny handful of games were developed by third parties and many were developed in Taiwan or Hong Kong.

## Technical specifications

- The CPU is an 8-bit WDC 65C02 processor.
- The Supervision screen is 2.37 inches x 2.37 inches, or 160 pixels x 160 pixels. It uses an LCD that can display 4 monochrome shades.
- The unit is powered by 4 AA batteries or a 6V AC/DC adapter.
- The unit includes a cartridge port, contrast dial, and a DB-9 connector port for multiplayer.
- Sound is handled by 4 tonal and 1 Noise channel plus an additional DMA stereo output channel via the - built-in speaker or the headphone jack. Volume is controlled with a dial.

## Usage

ROMs should be placed in `/Assets/supervision/common`

## Compatible Platforms

- Analogue Pocket

## Credits and acknowledgment

- [Jamie Blanks](https://github.com/Kitrinx)
- [Jens Gutschmidt](https://opencores.org/projects/cpu65c02_true_cycle)
- [Osman Celimli]
- [Pierre Cornier]
- [Trash Uncle](https://github.com/trashuncle/Gameboy_Palettes)

## Support

Please consider showing your support for this and future projects by contributing to the developers. While it isn't necessary, it's greatly appreciated.

- IP Core Developer: [Pierre Cornier](https://www.patreon.com/pierco)

## Powered by Open-Source Software

This project borrowed and use code from several other projects. A great thanks to their efforts!

| Modules                        | Copyright/Developer      |
| :----------------------------- | :----------------------- |
| [Supervision RTL]              | 2020 (c) Pierre Cornier  |
| [R65C02]                       | 2008 (c) Jens Gutschmidt |

## License

This work is licensed under multiple licenses.

- All original source code is licensed under [GNU General Public License v3.0 or later] unless implicit indicated.
- All documentation is licensed under [Creative Commons Attribution Share Alike 4.0 International] Public License.
- Some configuration and data files are licensed under [Creative Commons Zero v1.0 Universal].

Open Gateware and any contributors reserve all others rights, whether under their respective copyrights, patents, or trademarks, whether by implication, estoppel or otherwise.

Individual files may contain the following SPDX license tags as a shorthand for the above copyright and warranty notices:

```text
SPDX-License-Identifier: GPL-3.0-or-later
SPDX-License-Identifier: CC-BY-SA-4.0
SPDX-License-Identifier: CC0-1.0
```

This eases machine processing of licensing information based on the SPDX License Identifiers that are available at <https://spdx.org/licenses/>.

## Legal Notices

Supervision © 1992 Watara. All rights reserved.

The Open Gateware authors and contributors or any of its maintainers are in no way associated with or endorsed by Intel®, Altera®, AMD®, Xilinx®, Lattice®, Microsoft® or any other company not implicit indicated.
All other brands or product names are the property of their respective holders.

[Supervision RTL]: https://github.com/MiSTer-devel/SuperVision_MiSTer/tree/master/rtl
[R65C02]: https://opencores.org/projects/cpu65c02_true_cycle
[Pierre Cornier]: https://github.com/pcornier

[GNU General Public License v3.0 or later]: https://spdx.org/licenses/GPL-3.0-or-later.html
[Creative Commons Attribution Share Alike 4.0 International]: https://spdx.org/licenses/CC-BY-SA-4.0.html
[Creative Commons Zero v1.0 Universal]: https://spdx.org/licenses/CC0-1.0.html
