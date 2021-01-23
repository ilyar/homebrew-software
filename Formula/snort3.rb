class Snort3 < Formula
  desc "Snort 3 is the next generation Snort IPS (Intrusion Prevention System)"
  homepage "https://github.com/snort3/snort3"
  url "https://github.com/snort3/snort3.git",
    :tag => "3.1.0.0",
    :using => :git
  head "https://github.com/snort3/snort3.git",
    :using => :git
  license "GPLv2"

  depends_on "libdaq"
  depends_on "libdnet"
  depends_on "hwloc"
  depends_on "luajit"
  depends_on "libpcap"
  depends_on "ossp-uuid" => :build
  depends_on "cmake" => :build

  def install
    system "./configure_cmake.sh", "--prefix=#{prefix}"
    cd "build" do
        system "make", "install"
    end
  end

  test do
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
