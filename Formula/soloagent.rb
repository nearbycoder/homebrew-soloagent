class Soloagent < Formula
  desc "Self-hosted control plane for durable AI agents"
  homepage "https://soloagent.dev"
  url "https://github.com/nearbycoder/soloagent.dev/releases/download/v0.2.0/soloagent-0.2.0.tgz"
  sha256 "73f5beb41094d8c1088c0c357adf17082c2941153c0169d14337ea8dfc0a92a8"
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
