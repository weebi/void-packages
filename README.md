
# Void packages

This repository contains Void Linux package templates created or edited by me mainly for convenience, but also to replace all the random `build.sh` scripts laying around in locally cloned repositories. YMMV

**Requires [xbps-src](https://github.com/void-linux/void-packages#quick-start).**

## List of packages in this repository

| **Package**                                                               | **Description**                                            | **Notes**                                                                           |
| :------------------------------------------------------------------------ | :--------------------------------------------------------- | :---------------------------------------------------------------------------------- |
| acarsdec-3.7 ([Link](https://github.com/TLeconte/acarsdec))               | Decoder for ACARS to use with SDRs                         | *Built with RTL-SDR support only.*                                                  |
| airspyhf-1.6.8 ([Link](https://github.com/airspy/airspyhf))               | Airspy HF+ tools                                           | *Patched udev destination from `/etc/udev/rules.d` to `/usr/lib/udev/rules.d`.*     |
| dsd-1.7.0 ([Link](https://github.com/szechyjs/dsd))                       | Digital speech decoder for several digital voice formats   |                                                                                     |
| dsdcc-1.9.3 ([Link](https://github.com/f4exb/dsdcc))                      | Digital Speech Decoder (DSD) rewritten as a C++ library    | *Built with `USE_MBELIB=ON`.*                                                       |
| dumphfdl-1.3.0 ([Link](https://github.com/szpajder/dumphfdl))             | Multichannel HFDL decoder                                  |                                                                                     |
| dumpvdl2-2.2.0 ([Link](https://github.com/szpajder/dumpvdl2))             | VDL Mode 2 message decoder and protocol analyzer           |                                                                                     |
| hamlib-4.3.1 ([Link](https://sourceforge.net/projects/hamlib))            | Library to control radio transceivers and receivers        | *Downgraded to v4.3.1 from v4.4.*                                                   |
| it++-4.3.1 ([Link](https://sourceforge.net/projects/itpp))                | Mathematical and signal processing library for C++         |                                                                                     |
| libacars-2.1.4 ([Link](https://github.com/szpajder/libacars))             | Library for decoding ACARS messages                        |                                                                                     |
| mbelib-1.3.0 ([Link](https://github.com/szechyjs/mbelib))                 | P25 Phase 1 and ProVoice vocoder                           |                                                                                     |
| SoapyAirspyHF-0.2.0 ([Link](https://github.com/pothosware/SoapyAirspyHF)) | SoapySDR plugin to support the Airspy HF+                  |                                                                                     |