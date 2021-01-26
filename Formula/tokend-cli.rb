class TokendCli < Formula
  desc "Production Grade TokenD Installation"
  homepage "https://gitlab.com/tokend/tokend-cli"
  url "https://gitlab.com/tokend/tokend-cli/-/archive/v4.2.1/tokend-cli-v4.2.1.tar.gz"
  sha256 "9f3f1218992ca0e6db6d9f42a1970a94f0a9fd8f0a9624101b4611d84728e868"
  license "Apache-2.0"
  head "https://gitlab.com/tokend/tokend-cli.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/gitlab.com/tokend/tokend-cli").install buildpath.children
    cd "src/gitlab.com/tokend/tokend-cli" do
      system "go", "build", "-o", bin/"tokend", "internal/cmd/genconfig.go"
    end
  end

  test do
    system "#{bin}/tokend", "help"
  end
end
