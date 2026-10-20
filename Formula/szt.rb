class Szt < Formula
  desc "Disk usage tree (sizetree) that shows what's taking up space"
  homepage "https://github.com/urtti/szt"
  url "https://github.com/urtti/szt/releases/download/1.0.0/szt-1.0.0-macos.tar.gz"
  sha256 "38155b09086212adbfd45a956bd07279335520c965cbdbd737c078d176772596"
  license "MIT"

  depends_on macos: :sequoia

  def install
    bin.install "szt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/szt --version")
    (testpath/"folder/big.bin").write "x" * 100_000
    assert_match "big.bin", shell_output("#{bin}/szt --no-color #{testpath}/folder")
  end
end
