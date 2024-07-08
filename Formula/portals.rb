# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Portals < Formula
  desc ""
  homepage "https://ionic.io/portals"
  version "0.3.2"

  on_macos do
    on_intel do
      url "https://github.com/ionic-team/portals-cli-releases/releases/download/0.3.2/portals_Darwin_x86_64.tar.gz"
      sha256 "a49e40cd033f5cb5b83a608376e32b3852ba2c37ddbb824b32d0acc0575c2086"

      def install
        bin.install "portals"
      end
    end
    on_arm do
      url "https://github.com/ionic-team/portals-cli-releases/releases/download/0.3.2/portals_Darwin_arm64.tar.gz"
      sha256 "ffcf1c408a9c91f904864268ad45052c767d06bac281950e49e1b2dd46ef7287"

      def install
        bin.install "portals"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/ionic-team/portals-cli-releases/releases/download/0.3.2/portals_Linux_x86_64.tar.gz"
        sha256 "655925ef1e1274d6417f9d135b2f319a1ef3fcb9bff8c7c4dc639f6a21085ba1"

        def install
          bin.install "portals"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/ionic-team/portals-cli-releases/releases/download/0.3.2/portals_Linux_arm64.tar.gz"
        sha256 "b0023023871d282c3982977e1e526a15aaab7cd4b29d53f7980e8dd3ebe301f6"

        def install
          bin.install "portals"
        end
      end
    end
  end

  test do
    system "#{bin}/portals --version"
  end
end
