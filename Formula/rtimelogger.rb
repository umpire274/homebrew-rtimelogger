class Rtimelogger < Formula
  desc "Rust-based CLI tool for personal time logging and tracking"
  homepage "https://github.com/umpire274/rTimelogger"
  license "MIT"
  version "0.4.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/umpire274/rTimelogger/releases/download/v#{version}/rtimelogger-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cba54117e682cb18ebcab8af7a02df8b8db40b1b46700b5e09e7a9a7211e9266"
    elsif Hardware::CPU.arm?
      url "https://github.com/umpire274/rTimelogger/releases/download/v#{version}/rtimelogger-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "94d9cac43907ffc2ea84435ae370007db324e7555d07989fd402d0dd49a5ee36"
    end
  end

  on_linux do
    url "https://github.com/umpire274/rTimelogger/releases/download/v#{version}/rtimelogger-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d890957849955d39eb1a1aae14dcf80473f48c3f516bd4f01e20f155f262407f"
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

