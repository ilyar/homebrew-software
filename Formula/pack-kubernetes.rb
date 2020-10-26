class PackKubernetes < Formula
    url "file:///dev/null"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    version "1.0.0"
    depends_on "kubectl"
    depends_on "helm"
    depends_on "kops"
end
