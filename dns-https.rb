class DnsHttps < Formula
  desc "Simple DNS-over-HTTPS proxy"
  homepage "https://github.com/tpetr/dns-https"
  url "https://github.com/tpetr/dns-https/releases/download/v0.1.1/dns-https_0.1.1_Darwin_x86_64.tar.gz"
  version "0.1.1"
  sha256 "11ea587e29e88ad3bbff7ca172a6bb6704a5cdd04683158db7cdb6679cc04ba4"

  def install
    bin.install "dns-https"
  end
end
