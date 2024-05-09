# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Leetgo < Formula
  desc "leetgo is a command line tool for leetcode.com. It can help you to login, submit, test, and view your submissions."
  homepage "https://github.com/j178/leetgo"
  version "1.4.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/j178/leetgo/releases/download/v1.4.7/leetgo_macOS_x86_64.tar.gz"
      sha256 "40986d0f3011ddc86b61880343fd99a8a2218467ac0c12b562e8374dacb09fb7"

      def install
        bin.install "leetgo"
        bash_completion.install "completions/leetgo.bash" => "leetgo"
        zsh_completion.install "completions/leetgo.zsh" => "_leetgo"
        fish_completion.install "completions/leetgo.fish"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/j178/leetgo/releases/download/v1.4.7/leetgo_macOS_arm64.tar.gz"
      sha256 "69dad42d94bb04d55d154248abc8e0c7d590463e18fca122d3a3a7c5a963027e"

      def install
        bin.install "leetgo"
        bash_completion.install "completions/leetgo.bash" => "leetgo"
        zsh_completion.install "completions/leetgo.zsh" => "_leetgo"
        fish_completion.install "completions/leetgo.fish"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/j178/leetgo/releases/download/v1.4.7/leetgo_linux_x86_64.tar.gz"
      sha256 "48acf6550450033f12ee23a94e9505b36b6de64c3120b23fe38d9e0ff200b447"

      def install
        bin.install "leetgo"
        bash_completion.install "completions/leetgo.bash" => "leetgo"
        zsh_completion.install "completions/leetgo.zsh" => "_leetgo"
        fish_completion.install "completions/leetgo.fish"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/j178/leetgo/releases/download/v1.4.7/leetgo_linux_arm64.tar.gz"
      sha256 "7840aaf78646d3cc70377a47d0a8c687745d9449836c61316447fe421541786c"

      def install
        bin.install "leetgo"
        bash_completion.install "completions/leetgo.bash" => "leetgo"
        zsh_completion.install "completions/leetgo.zsh" => "_leetgo"
        fish_completion.install "completions/leetgo.fish"
      end
    end
  end

  test do
    system "#{bin}/leetgo", "-v"
  end
end
