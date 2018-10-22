class DnsHttps < Formula
  desc "Simple DNS-over-HTTPS proxy"
  homepage "https://github.com/tpetr/dns-https"
  url "https://github.com/tpetr/dns-https/releases/download/v0.1.1/dns-https_0.1.1_Darwin_x86_64.tar.gz"
  version "0.1.1"
  sha256 "783e7a813e86f7db11a3183f7126d7a42a1759ca45f784efa4dd7bb8ebff1ccc"

  def install
    bin.install "dns-https"
  end
end
