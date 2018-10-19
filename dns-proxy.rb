class DnsProxy < Formula
  desc "DNS proxy"
  homepage "https://github.com/tpetr/dns-proxy"
  url "https://github.com/tpetr/dns-proxy/releases/download/v0.1.2/dns-proxy_0.1.2_Darwin_x86_64.tar.gz"
  version "0.1.2"
  sha256 "b42dcf390fe6202209f7e4a7c296eec2cfd148e07d1235162c8aa50b89a6f598"

  def install
    bin.install "dns-proxy"
  end
end
