# Sifive Tools

This provides packages to install additional tools on macOS using
[Homebrew](https://brew.sh).

## Installation

First, install homebrew:

    $ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

Get this tap:

    $ brew tap sifive-eblot/sifive

Build the toolchain:

    $ brew install openocd-riscv xc3sprog

## RISC-V toolchain

[homebrew-riscv](https://github.com/riscv/homebrew-riscv) provides the RISCV
toolchain as Hombrew formula.

### Note about 32-bit architecture

If you need to support RISC-V 32-bit architecture, do no install `riscv-tools`
package, as it wraps the toolchain installation for 64-bit architecture only.

Install the toolchain as:

    $ brew tap riscv/riscv
    $ brew install riscv-gnu-toolchain --enable-multilib
    $ brew install riscv-isa-sim riscv-pk

