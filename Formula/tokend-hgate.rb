class TokendHgate < Formula
  desc "Hgate uses keypair provided in config file to sign and submit transactions into TokenD"
  homepage "https://tokend.gitlab.io/hgate/"
  url "https://gitlab.com/tokend/hgate/-/archive/1.1.0/hgate-1.1.0.tar.gz"
  sha256 "2d6f5352a7e94a84ecbd2589b080ec9e1a3c6ea71b523ce6c4f9e5ab9acc011f"
  license "Apache-2.0"
  head "https://gitlab.com/tokend/hgate.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tokend/hgate").install buildpath.children
    cd "src/github.com/tokend/hgate" do
      system "go", "build",
        "--ldflags",
        "-X github.com/tokend/hgate/internal/config.HGateRelease='#{version}'",
        "-o", "#{bin}/hgate",
        "github.com/tokend/hgate"
    end
  end

  test do
    system "#{bin}/hgate", "--version"
  end
end
