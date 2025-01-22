# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GithubS3 < Formula
  desc "Use GitHub as a file server."
  homepage "https://github.com/j178/github-s3"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/j178/github-s3/releases/download/v1.0.2/github-s3_Darwin_x86_64.tar.gz"
      sha256 "00a027fca5fe6c9a370b07597c6e1694e2914f3e7951783baa0d971dcb2886d1"

      def install
        bin.install "github-s3"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/j178/github-s3/releases/download/v1.0.2/github-s3_Darwin_arm64.tar.gz"
      sha256 "9e64cbba45fcadcd29d3bffe3c0abc1a124dcdb90300f247206705ae5c81bb15"

      def install
        bin.install "github-s3"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/j178/github-s3/releases/download/v1.0.2/github-s3_Linux_x86_64.tar.gz"
        sha256 "d4d8ad2b1e474e8fec456554fa40bb18dec6cd70827b24d5900a6b678d1763e5"

        def install
          bin.install "github-s3"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/j178/github-s3/releases/download/v1.0.2/github-s3_Linux_arm64.tar.gz"
        sha256 "6f4bdede1a52eff1dce3c40c6127263ae7d6d15a3309d15921437b44d7279aa6"

        def install
          bin.install "github-s3"
        end
      end
    end
  end
end
