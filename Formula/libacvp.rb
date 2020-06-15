class Libacvp < Formula
  desc "Client-side implementation of the draft ACVP protoco"
  homepage "https://github.com/cisco/libacvp"
  url "https://github.com/cisco/libacvp/archive/v1.0.2.tar.gz"
  sha256 "4cb2024a08ea6e759efcf73dcb4bbc6246ac5d922f38e8d001cf24d0cd98b43b"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "gcc" => :build
  depends_on "make" => :build
  depends_on "curl"
  depends_on "openssl"

  def install

    openssl = Formulary.factory "openssl"
    curl = Formulary.factory "curl"

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--with-ssl-dir=#{openssl.opt_prefix}",
                          "--with-libcurl-dir=#{curl.opt_prefix}"
    system "make"
    system "make", "install"
  end
end
