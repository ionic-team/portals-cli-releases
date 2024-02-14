# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Portals < Formula
  desc ""
  homepage "https://ionic.io/portals"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ionic-team/portals-cli-releases/releases/download/0.2.4/portals_Darwin_x86_64.tar.gz"
      sha256 "0b735fe072336024358fc021b517fcab786123ae369dc5a9d238a04f1abb5bfa"

      def install
        bin.install "portals"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/ionic-team/portals-cli-releases/releases/download/0.2.4/portals_Darwin_arm64.tar.gz"
      sha256 "5f481c361ef53315ee6b2ec9aca01b725bb2a2f8c38fc59461d08182fce27cf0"

      def install
        bin.install "portals"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ionic-team/portals-cli-releases/releases/download/0.2.4/portals_Linux_arm64.tar.gz"
      sha256 "513b557a20a49eabd5cbbb04002dc29278bd64bcfcfb80ad41721f1e8aa6c6f8"

      def install
        bin.install "portals"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/ionic-team/portals-cli-releases/releases/download/0.2.4/portals_Linux_x86_64.tar.gz"
      sha256 "8c35a669a5b3f1b6a1557dd89b0eb21321131091367ffcdcda3b7170de41ee5b"

      def install
        bin.install "portals"
      end
    end
  end

  test do
    system "#{bin}/portals --version"
  end
end
