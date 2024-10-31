class PreCommit < Formula
  desc "pre-commit implemeneted in Rust"
  homepage "https://github.com/j178/pre-commit-rs"
  version "0.0.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/j178/pre-commit-rs/releases/download/v0.0.1/pre-commit-rs-aarch64-apple-darwin.tar.gz"
      sha256 "2f76864d141d07c8d4e8690871dc7dd55f34111a8d42eb2a012dad813f873d50"
    end
    if Hardware::CPU.intel?
      url "https://github.com/j178/pre-commit-rs/releases/download/v0.0.1/pre-commit-rs-x86_64-apple-darwin.tar.gz"
      sha256 "0971ab884673b9b7d5b79e9249635319fc20c3ab68e8c5e05f5d01d6b8f4a0d1"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/j178/pre-commit-rs/releases/download/v0.0.1/pre-commit-rs-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e5a24546d4bbf677911cefb968cc887646a6e86f106dc03d34bb61f27134fc8f"
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
