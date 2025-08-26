class Prek < Formula
  desc "Better `pre-commit`, re-engineered in Rust"
  homepage "https://github.com/j178/prek"
  version "0.1.4"
  if OS.mac?
    url "https://github.com/j178/prek/releases/download/v0.1.4/prek-aarch64-apple-darwin.tar.gz" if Hardware::CPU.arm?
    if Hardware::CPU.intel?
      url "https://github.com/j178/prek/releases/download/v0.1.4/prek-x86_64-apple-darwin.tar.gz"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/j178/prek/releases/download/v0.1.4/prek-aarch64-unknown-linux-gnu.tar.gz"
    end
    if Hardware::CPU.intel?
      url "https://github.com/j178/prek/releases/download/v0.1.4/prek-x86_64-unknown-linux-gnu.tar.gz"
    end
  end

  BINARY_ALIASES = {
    "aarch64-apple-darwin":                   {},
    "aarch64-pc-windows-gnu":                 {},
    "aarch64-unknown-linux-gnu":              {},
    "aarch64-unknown-linux-musl-dynamic":     {},
    "aarch64-unknown-linux-musl-static":      {},
    "arm-unknown-linux-gnueabihf":            {},
    "arm-unknown-linux-musl-dynamiceabihf":   {},
    "arm-unknown-linux-musl-staticeabihf":    {},
    "armv7-unknown-linux-gnueabihf":          {},
    "armv7-unknown-linux-musl-dynamiceabihf": {},
    "armv7-unknown-linux-musl-staticeabihf":  {},
    "i686-pc-windows-gnu":                    {},
    "i686-unknown-linux-gnu":                 {},
    "i686-unknown-linux-musl-dynamic":        {},
    "i686-unknown-linux-musl-static":         {},
    "powerpc64-unknown-linux-gnu":            {},
    "powerpc64le-unknown-linux-gnu":          {},
    "riscv64gc-unknown-linux-gnu":            {},
    "s390x-unknown-linux-gnu":                {},
    "x86_64-apple-darwin":                    {},
    "x86_64-pc-windows-gnu":                  {},
    "x86_64-unknown-linux-gnu":               {},
    "x86_64-unknown-linux-musl-dynamic":      {},
    "x86_64-unknown-linux-musl-static":       {},
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
    bin.install "prek" if OS.mac? && Hardware::CPU.arm?
    bin.install "prek" if OS.mac? && Hardware::CPU.intel?
    bin.install "prek" if OS.linux? && Hardware::CPU.arm?
    bin.install "prek" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
