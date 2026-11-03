class Soloagent < Formula
  desc "Self-hosted control plane for durable AI agents"
  homepage "https://soloagent.dev"
  url "https://github.com/nearbycoder/soloagent.dev/releases/download/v0.2.1/soloagent-0.2.1.tgz"
  sha256 "b1bd60d016c87eab49b575bd7729363d2ee8215fb620364438920698a359ddf4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/soloagent --version")
    assert_match "soloagent", shell_output("#{bin}/soloagent --help")
  end
end
