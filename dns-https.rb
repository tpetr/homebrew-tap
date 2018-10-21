class DnsHttps < Formula
  desc "Simple DNS-over-HTTPS proxy"
  homepage "https://github.com/tpetr/dns-https"
  url "https://github.com/tpetr/dns-https/releases/download/v0.1.0/dns-https_0.1.0_Darwin_x86_64.tar.gz"
  version "0.1.0"
  sha256 "d3892b997896d3711a83c99949c419b0ec3562a08a83ff4d00b71b5f5ea9178a"

  def install
    bin.install "dns-https"
  end
end
