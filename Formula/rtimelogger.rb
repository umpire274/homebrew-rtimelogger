class Rtimelogger < Formula
  desc "Rust-based CLI tool for personal time logging and tracking"
  homepage "https://github.com/umpire274/rTimelogger"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/umpire274/rTimelogger/releases/download/v#{version}/rtimelogger-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "92d496669f38fba3b40913d23e0ced2fa4ba2c2617a41f13d887007fa3872a9b"
    elsif Hardware::CPU.arm?
      url "https://github.com/umpire274/rTimelogger/releases/download/v#{version}/rtimelogger-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "67173e18e2abb3576df052fb1e6279684c7d737a1b1c4421aae9239e00b00d86"
    end
  end

  on_linux do
    url "https://github.com/umpire274/rTimelogger/releases/download/v#{version}/rtimelogger-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f763c5356a03797458ee9cc216ce275280b4ea9483d9945e4d2ea26e83ae5327"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "rtimelogger"
    pkgshare.install "README.md" if File.exist?("README.md")
    pkgshare.install "CHANGELOG.md" if File.exist?("CHANGELOG.md")
    pkgshare.install "LICENSE" if File.exist?("LICENSE")
  end

  test do
    output = shell_output("#{bin}/rtimelogger --version")
    assert_match version.to_s, output
  end
end

