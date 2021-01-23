class Libdaq < Formula
  desc "LibDAQ is a pluggable abstraction layer for interacting with a data source (traditionally a network interface or network data plane)"
  homepage "https://github.com/snort3/libdaq"
  url "https://github.com/snort3/libdaq.git",
    :tag => "v3.0.0",
    :using => :git
  head "https://github.com/snort3/libdaq.git",
    :using => :git
  license "GPLv2"

  depends_on "make" => :build

  def install
    system "./bootstrap"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
