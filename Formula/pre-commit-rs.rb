class PreCommitRs < Formula
  desc "pre-commit implemeneted in Rust"
  homepage "https://github.com/j178/pre-commit-rs"
  version "0.0.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/j178/pre-commit-rs/releases/download/v0.0.3/pre-commit-rs-aarch64-apple-darwin.tar.gz"
      sha256 "be61ea6273d34e7ffea51432af6cb46cfcf91e6d331cbdd3fdcc3b6cd56a64da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/j178/pre-commit-rs/releases/download/v0.0.3/pre-commit-rs-x86_64-apple-darwin.tar.gz"
      sha256 "cdf19db140855944ad30309314438a856d7830c2df4ad9da00520bbf2021f87a"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/j178/pre-commit-rs/releases/download/v0.0.3/pre-commit-rs-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "55f8b6b811aff597724c36a08262a10b8030da18f4f600187c0b835358b6d4f8"
  end

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-pc-windows-gnu":    {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "pre-commit" if OS.mac? && Hardware::CPU.arm?
    bin.install "pre-commit" if OS.mac? && Hardware::CPU.intel?
    bin.install "pre-commit" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
