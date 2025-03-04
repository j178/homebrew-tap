class Prefligit < Formula
  desc "pre-commit implemented in Rust"
  homepage "https://github.com/j178/prefligit"
  version "0.0.10"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/j178/prefligit/releases/download/v0.0.10/prefligit-aarch64-apple-darwin.tar.gz"
    end
    if Hardware::CPU.intel?
      url "https://github.com/j178/prefligit/releases/download/v0.0.10/prefligit-x86_64-apple-darwin.tar.gz"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/j178/prefligit/releases/download/v0.0.10/prefligit-x86_64-unknown-linux-gnu.tar.gz"
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
    bin.install "prefligit" if OS.mac? && Hardware::CPU.arm?
    bin.install "prefligit" if OS.mac? && Hardware::CPU.intel?
    bin.install "prefligit" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
