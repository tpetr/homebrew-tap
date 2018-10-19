class DnsProxy < Formula
  desc "DNS Proxy"
  homepage "https://github.com/tpetr/dns-proxy"
  url "https://github.com/tpetr/dns-proxy/archive/v0.1.0.tar.gz"
  sha256 "32e10f5031275bdf9399b0d306f42f9a8baafda4ed806cc271160cbba74dfd39"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/tpetr/dns-proxy").install buildpath.children
    cd "src/github.com/tpetr/dns-proxy" do
      system "dep", "ensure", "-vendor-only"
      system "go", "build", "-ldflags", "-X main.version=#{version}", "-o",
             bin/"dns-proxy"
      prefix.install_metafiles
    end
  end
end
