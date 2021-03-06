require "language/node"

class Whistle < Formula
  desc "HTTP, HTTP2, HTTPS, Websocket debugging proxy"
  homepage "https://github.com/avwo/whistle"
  url "https://registry.npmjs.org/whistle/-/whistle-2.5.19.tgz"
  sha256 "a8e4e92732467347cf365fe9954b2b2afd9dd795ffb356f9ff234e8cf68acd9e"
  license "MIT"

  livecheck do
    url :stable
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "07922996a0a0333b0f8088da27225761d32d75f6942f0b1a126863f6f520641c" => :catalina
    sha256 "529c4b61301866180dbd77fa616ef8a2a291fb4bde42422455b8e7b42d376272" => :mojave
    sha256 "2bbfac5596860e5b3178bee52e4bfb364c682806a631b43fb66ca3a87c10cf8e" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"package.json").write('{"name": "test"}')
    system bin/"whistle", "start"
    system bin/"whistle", "stop"
  end
end
