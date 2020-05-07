# Sifive Tools

This provides packages to install additional tools on macOS using
[Homebrew](https://brew.sh).

## Installation

First, install homebrew:

    $ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Get this tap:

    $ brew tap sifive-eblot/sifive

Build the toolchain:

    $ brew install xc3sprog
    $ brew install --HEAD openocd-riscv

If there is no other openocd installation on the host, it is possible to
install `openocd-riscv` as the default openocd installation using

    $ brew link --force openocd-riscv

## RISC-V toolchain

[homebrew-riscv](https://github.com/riscv/homebrew-riscv) provides the RISCV
toolchain as Homebrew formulas.

### Note about the 32-bit architecture

If you need to build for RISC-V 32-bit architecture, do no install `riscv-tools`
package, as it wraps the toolchain installation for the 64-bit architecture
only.

Install the toolchain as:

    $ brew tap riscv/riscv
    $ brew install riscv-gnu-toolchain --enable-multilib
    $ brew install riscv-isa-sim riscv-pk

