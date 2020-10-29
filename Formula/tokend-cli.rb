class TokendCli < Formula
    desc "Production Grade TokenD Installation"
    homepage "https://gitlab.com/tokend/tokend-cli"
    url "https://gitlab.com/tokend/tokend-cli/-/archive/4.2/tokend-cli-4.2.tar.gz"
    sha256 "65c6a1e418417f1be6cf7885ba22ba0b03bbd0b4f79a40b8857d9e0c86021960"
    license "Apache-2.0"
    head "https://gitlab.com/tokend/tokend-cli.git"

    depends_on "go" => :build
    depends_on "kubectl" => :recommended
    depends_on "awscli" => :recommended
    depends_on "kops" => :recommended

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
