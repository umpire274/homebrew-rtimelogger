class Rtimelog < Formula
  desc "Rust-based CLI tool for personal time logging and tracking"
  homepage "https://github.com/umpire274/rTimelog"
  license "MIT"
  version "0.3.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/umpire274/rTimelog/releases/download/v#{version}/rtimelog-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_SHA256_MAC_INTEL"
    elsif Hardware::CPU.arm?
      url "https://github.com/umpire274/rTimelog/releases/download/v#{version}/rtimelog-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_SHA256_MAC_ARM"
    end
  end

  on_linux do
    url "https://github.com/umpire274/rTimelog/releases/download/v#{version}/rtimelog-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "REPLACE_WITH_SHA256_LINUX_X64"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "rtimelog"
    pkgshare.install "README.md" if File.exist?("README.md")
    pkgshare.install "CHANGELOG.md" if File.exist?("CHANGELOG.md")
    pkgshare.install "LICENSE" if File.exist?("LICENSE")
  end

  test do
    output = shell_output("#{bin}/rtimelog --version")
    assert_match version.to_s, output
  end
end

