# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GithubS3 < Formula
  desc "Use GitHub as a file server."
  homepage "https://github.com/j178/github-s3"
  version "1.0-beta"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/j178/github-s3/releases/download/v1.0-beta/github-s3_Darwin_x86_64.tar.gz"
      sha256 "086b3512470be7a3a5a6032a64cc84af80e1107b5fd23ec41b474f0b9f71c9fc"

      def install
        bin.install "github-s3"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/j178/github-s3/releases/download/v1.0-beta/github-s3_Darwin_arm64.tar.gz"
      sha256 "ac42160b2edf8062b495a29194d62ff8a84c90a60deaea7a1d0eebdc1e011eca"

      def install
        bin.install "github-s3"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/j178/github-s3/releases/download/v1.0-beta/github-s3_Linux_arm64.tar.gz"
      sha256 "782b4d17a45e454c494eaf02e179449b271a2daaf64ae01e4db8ce6b13864d16"

      def install
        bin.install "github-s3"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/j178/github-s3/releases/download/v1.0-beta/github-s3_Linux_x86_64.tar.gz"
      sha256 "b57315c7d09212e0602f32194bca716eb5e95098f356890e654d5d799e8b0139"

      def install
        bin.install "github-s3"
      end
    end
  end
end
