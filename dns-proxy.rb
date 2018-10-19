class DnsProxy < Formula
  desc "DNS proxy"
  homepage "https://github.com/tpetr/dns-proxy"
  url "https://github.com/tpetr/dns-proxy/releases/download/v0.1.1/dns-proxy_0.1.1_Darwin_x86_64.tar.gz"
  version "0.1.1"
  sha256 "c417343c651cd2a342da5de644049ca16111f339d4def44b7f223c136b99550e"

  def install
    bin.install "dns-proxy"
  end
end
