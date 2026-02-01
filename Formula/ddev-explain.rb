# typed: false
# frozen_string_literal: true

class DdevExplain < Formula
  desc "CLI tool that summarizes DDEV project configurations"
  homepage "https://github.com/dkd-dobberkau/ddev-explain"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/dkd-dobberkau/ddev-explain/releases/download/v0.1.0/ddev-explain_0.1.0_darwin_amd64.tar.gz"
      sha256 "d6649cc50779ab8783211a24a56ea12ad11ea2f7770101faedf4f6447a2e326c"
    end
    on_arm do
      url "https://github.com/dkd-dobberkau/ddev-explain/releases/download/v0.1.0/ddev-explain_0.1.0_darwin_arm64.tar.gz"
      sha256 "9840354be2e170d082d99112f417ad9cbd620e60e6f88a1a7b02264999293a4c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dkd-dobberkau/ddev-explain/releases/download/v0.1.0/ddev-explain_0.1.0_linux_amd64.tar.gz"
      sha256 "d86ec5faf9da837503fffcee2bdc7c9b8a57510619da9a5cea0994606f1dbfee"
    end
    on_arm do
      url "https://github.com/dkd-dobberkau/ddev-explain/releases/download/v0.1.0/ddev-explain_0.1.0_linux_arm64.tar.gz"
      sha256 "4d471bd4fddbcb7fe88927f4ac872b4e797e5ba836b29c5746167ac8d9121f28"
    end
  end

  def install
    bin.install "ddev-explain"
  end

  test do
    system "#{bin}/ddev-explain", "--help"
  end
end
