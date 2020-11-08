class Whaler < Formula
    desc "Whaler is a Go program which is designed to reverse engineer docker images into the Dockerfile that created it."
    homepage "https://github.com/P3GLEG/Whaler/"
    url "https://github.com/P3GLEG/Whaler/archive/1.0.tar.gz"
    sha256 "6618887bd578dd8aca02399c370f882e34334ee43fd749e73d4044eda32704c7"
    head "https://github.com/P3GLEG/Whaler.git"
    license "GPL-3.0"

    depends_on "go" => :build

    def install
        ENV["CGO_ENABLED"] = "0"
        ENV["GOPATH"] = buildpath
        (buildpath/"src/github.com/P3GLEG/Whaler").install buildpath.children
        cd "src/github.com/P3GLEG/Whaler" do
            system "go", "get"
            system "go", "build", *std_go_args
        end
    end

    test do
        output = shell_output("#{bin}/whaler --help")
        expect = %{
Usage of whaler:
  -f string
        File containing images to analyze seperated by line
  -filter
        Filters filenames that create noise such as node_modules. Check ignore.go file for more details (default true)
  -sV string
        Set the docker client ID to a specific version -sV=1.36
  -v    Print all details about the image
  -x    Save layers to current directory
}
        assert_match expect, output
    end
end
