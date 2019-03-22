# NanoPi Neo4 buildroot system
Base on original [flatmax/NanoPi.Neo4.buildroot.external](https://github.com/flatmax/NanoPi.Neo4.buildroot.external) do something improve for my environment

# Status
| Config | U-Boot | U-Boot Logo | Kernel Logo |
|-|:-:|:-------------:|:------:|
| neo4_defconfig | 2014.09 |  YES | YES |
| neo4-linux-distro_defconfig | 2017.09 + linux distro boot | NO | YES |
| neo4-rkimg_defconfig(not yet ready) | 2017.09 + rkparm boot | NO | YES |

# Todo
- Switch to u-boot 2017-09
- ~~Create disk image use the genimage of buildroot(no need root privileges)~~
