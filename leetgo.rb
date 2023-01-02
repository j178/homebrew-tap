# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Leetgo < Formula
  desc "leetgo is a command line tool for leetcode.com. It can help you to login, submit, test, and view your submissions."
  homepage "https://github.com/j178/leetgo"
  version "0.1.0-alpha"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/j178/leetgo/releases/download/v0.1.0-alpha/leetgo_Darwin_arm64.tar.gz"
      sha256 "f1aa719bf109b539e33eff397c6fba112f7aee5d7bd0da83fc2a0717b34d1607"

      def install
        bin.install "leetgo"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/j178/leetgo/releases/download/v0.1.0-alpha/leetgo_Darwin_x86_64.tar.gz"
      sha256 "89206c2171bfd431e3778d32e38b7a3b14272e933c34c1484fb6184e441fcac5"

      def install
        bin.install "leetgo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/j178/leetgo/releases/download/v0.1.0-alpha/leetgo_Linux_x86_64.tar.gz"
      sha256 "e6cded785a425768c41b918f149e40796ef6967f982dbb995b93c95c45d24358"

      def install
        bin.install "leetgo"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/j178/leetgo/releases/download/v0.1.0-alpha/leetgo_Linux_arm64.tar.gz"
      sha256 "558d7e681ae802517c29e1db5a8ab73e4610ec109e700b2cd7be7af4b338e648"

      def install
        bin.install "leetgo"
      end
    end
  end
end
