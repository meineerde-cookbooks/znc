# Description

Installs and configures ZNC, an IRC bouncer.

# Requirements


## Platform

* Debian, Ubuntu

# Usage

## default

Include the default recipe in a run list, to get `znc`.  By default `znc` is installed from packages but this can be changed by using the `install_method` attribute.

Using the `init_style` attribute, you can install ZNC either under the old SysV Init or runit. While the conservative default is `init`, I recommend `runit`.

## package

This recipe installs ZNC from packages.

## source

This recipe installs ZNC from source.

## module_colloquy

Installs the [colloquy module](http://wiki.znc.in/Colloquy) to send push notitifications to iOS devices running Colloquy.

## logs2html

Installs the [irclog2html](http://mg.pov.lt/irclog2html/) python package and configures it to process selected channels into HTML files.

# Databags

The cookbook is mainly configured through data bags. Each user has a data bag item under `znc_users`. An example databag item is below.

    {
      "id": "some-dude",

      "nick": "some-dude",
      "real_name": "Some Dude",
      "pass": "supersecretsupersecret",
      "buffer": 50000,
      "keep_buffer": false,

      "modules": {
        "admin": "",
        "chansaver": "",
        "keepnick": "",
        "kickrejoin": "",
        "log": "",
        "nickserv": "",
        "savebuff": "supersecretsupersecret",
        "simple_away": "-notimer",
        "stickychan": ""
      },

      "servers": {
        "chat.freenode.net": "+7000",
        "irc.freenode.net": "+7000"
      },

      "channels": {
        "#github": {
          "logs2html": true
        },
        "#chiliproject": {
          "logs2html": true
        },
        "#chef": {}
      }
    }


# License and Author

Author:: Holger Just <hjust@meine-er.de>
Copyright:: 2012, Holger Just, 2011 Seth Chisamore

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
