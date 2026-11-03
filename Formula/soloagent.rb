class Soloagent < Formula
  desc "Self-hosted control plane for durable AI agents"
  homepage "https://soloagent.dev"
  url "https://github.com/nearbycoder/soloagent.dev/releases/download/v0.1.1/soloagent-0.1.1.tgz"
  sha256 "709f0322982a9e7da8b973e75bd729f4b1953ba7009224ca3700bc44ad639d2f"
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
