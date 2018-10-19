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

  def post_install
    unless File.file?(etc/"dns-proxy.json")
      (etc/"dns-proxy.json").write(<<~EOS
      {
        "ListenAddr": ":10053",
        "Handlers": [
          {
            "URL": "https://cloudflare-dns.com/dns-query"
          },
          {
            "URL": "udp://1.1.1.1:53"
          }
        ]
      }
      EOS
      )
    end
  end

  def caveats; <<~EOS
    To configure dns-proxy, take the default example configuration at
      #{etc}/dns-proxy.json and edit to taste.
  EOS
  end

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/dns-proxy</string>
          <string>#{etc}/dns-proxy.json</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
      </dict>
    </plist>
  EOS
  end
end
