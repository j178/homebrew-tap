# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Chatgpt < Formula
  desc "A simple cli wrapper for ChatGPT API, powered by GPT-3.5-turbo model."
  homepage "https://github.com/j178/chatgpt"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/j178/chatgpt/releases/download/v0.2.0/chatgpt_Darwin_arm64.tar.gz"
      sha256 "50446862a9afe37432af7485396637877c062af11338ff986cb37a462ebc72c3"

      def install
        bin.install "chatgpt"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/j178/chatgpt/releases/download/v0.2.0/chatgpt_Darwin_x86_64.tar.gz"
      sha256 "258b818e2ec5cf70497c3ac82b0d6943750c8ef863b32510072d6b545d726117"

      def install
        bin.install "chatgpt"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/j178/chatgpt/releases/download/v0.2.0/chatgpt_Linux_arm64.tar.gz"
      sha256 "fabfde26ad922dceefb632d979b7e25114c7ba51b6dd3b98d47d10c29e10e41e"

      def install
        bin.install "chatgpt"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/j178/chatgpt/releases/download/v0.2.0/chatgpt_Linux_x86_64.tar.gz"
      sha256 "2d09a3684897d8b16f61a9e2b8050ab2a13c72334469fed217cc3c5e83e38797"

      def install
        bin.install "chatgpt"
      end
    end
  end
end
