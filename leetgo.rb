# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Leetgo < Formula
  desc "leetgo is a command line tool for leetcode.com. It can help you to login, submit, test, and view your submissions."
  homepage "https://github.com/j178/leetgo"
  version "1.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/j178/leetgo/releases/download/v1.3.5/leetgo_macOS_x86_64.tar.gz"
      sha256 "7f2c0458641fd97060e2630ecaa85f44fdfc4ec6897c06127e9af4c6378a304b"

      def install
        bin.install "leetgo"
        bash_completion.install "completions/leetgo.bash" => "leetgo"
        zsh_completion.install "completions/leetgo.zsh" => "_leetgo"
        fish_completion.install "completions/leetgo.fish"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/j178/leetgo/releases/download/v1.3.5/leetgo_macOS_arm64.tar.gz"
      sha256 "53d880f8a923c118355ef0e908ea0c05e22ab1fd8bbb51a8f3b5ae533d63be7f"

      def install
        bin.install "leetgo"
        bash_completion.install "completions/leetgo.bash" => "leetgo"
        zsh_completion.install "completions/leetgo.zsh" => "_leetgo"
        fish_completion.install "completions/leetgo.fish"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/j178/leetgo/releases/download/v1.3.5/leetgo_linux_arm64.tar.gz"
      sha256 "22e869345cb5720c1eb6d9c6cdbe536894d2c89cf766fbf21e374183a1314fab"

      def install
        bin.install "leetgo"
        bash_completion.install "completions/leetgo.bash" => "leetgo"
        zsh_completion.install "completions/leetgo.zsh" => "_leetgo"
        fish_completion.install "completions/leetgo.fish"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/j178/leetgo/releases/download/v1.3.5/leetgo_linux_x86_64.tar.gz"
      sha256 "14b3a8f6b198a9abeb001e3d3dce68c169b1de4c2328ad7b31d16625934edffa"

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
