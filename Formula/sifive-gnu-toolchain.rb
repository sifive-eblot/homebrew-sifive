require "formula"

class SifiveGnuToolchain < Formula
  homepage "http://sifive.com"
  url "https://github.com/sifive/riscv-gnu-toolchain.git", :branch => "sifive-gcc-9"
  version "9.2.0"

  depends_on "gawk" => :build
  depends_on "gnu-sed" => :build
  depends_on "gmp"
  depends_on "mpfr"
  depends_on "libmpc"
  depends_on "isl"

  def install
    # disable crazy flag additions
    ENV.delete 'CPATH'

    args = [
      "--prefix=#{prefix}",
      "--with-cmodel=medany",
      "--enable-multilib"
    ]

    system "./configure", *args
    system "make"

    # don't install Python bindings if system already has them
    if File.exist?("#{HOMEBREW_PREFIX}/share/gcc-9.2.0")
      opoo "Not overwriting share/gcc-9.2.0"
      rm_rf "#{prefix}/share/gcc-9.2.0"
    end

    # don't install gdb bindings if system already has them
    if File.exist?("#{HOMEBREW_PREFIX}/share/gdb")
      opoo "Not overwriting share/gdb"
      rm_rf "#{prefix}/share/gdb"
      rm "#{prefix}/share/info/annotate.info"
      rm "#{prefix}/share/info/gdb.info"
      rm "#{prefix}/share/info/stabs.info"
    end

    # don't install gdb includes if system already has them
    if File.exist?("#{HOMEBREW_PREFIX}/include/gdb")
      opoo "Not overwriting include/gdb"
      rm_rf "#{prefix}/include/gdb"
    end
  end

  test do
    system "false"
  end
end

