# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Chatgpt < Formula
  desc "A simple cli wrapper for ChatGPT API, powered by GPT-3.5-turbo model."
  homepage "https://github.com/j178/chatgpt"
  version "1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/j178/chatgpt/releases/download/v1.1/chatgpt_Darwin_x86_64.tar.gz"
      sha256 "7226b561e1a050d3714b720fc09e92fd3ba922c6c9e25fc5287c8164380f642c"

      def install
        bin.install "chatgpt"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/j178/chatgpt/releases/download/v1.1/chatgpt_Darwin_arm64.tar.gz"
      sha256 "6142b9cb38978a67e80077489fb678025f54d59fabe1eaf3d989dcb064ed2a02"

      def install
        bin.install "chatgpt"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/j178/chatgpt/releases/download/v1.1/chatgpt_Linux_arm64.tar.gz"
      sha256 "629691208d70f4002327f4a98686148ba439174c777478a92dfd68fd7d04a67e"

      def install
        bin.install "chatgpt"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/j178/chatgpt/releases/download/v1.1/chatgpt_Linux_x86_64.tar.gz"
      sha256 "c15357f0a4d943ece274f07b5fc2aa958be796c3dc47b6e2625c4bc3d2d04a72"

      def install
        bin.install "chatgpt"
      end
    end
  end
end
