class SpartaCli < Formula
  desc "Fewlines Sparta CLI"
  homepage "https://github.com/fewlinesco/sparta-cli"
  url "https://github.com/fewlinesco/sparta-cli/releases/download/1.1.0/sparta-cli-v1.1.0.tar.gz"
  sha256 "a0a9d1d346255ed3c1022dbdc9dc641e754aabb8a1a07ecaa98b461ffe2c0f44"
  license "MIT"
  depends_on "heroku/brew/heroku-node"

  def install
    inreplace "bin/sparta", /^CLIENT_HOME=/, "export HEROKU_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/sparta", "\"$DIR/node\"", "#{Formula["heroku-node"].opt_share}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/sparta"
  end

  test do
    system bin/"sparta", "version"
  end
end
