class Passgen < Formula
  desc "Simple command-line password generator"
  homepage "https://github.com/Gabrielhj17/PassGen"
  url "https://raw.githubusercontent.com/Gabrielhj17/PassGen/main/passgen-release.tar.gz"
  version "1.0.0"
  sha256 "ca8b47daf425112d1b2c79e9cb5a61c237c4b5e77cb6cb8ef582c3d94ff7ac23"
  license "MIT"

  depends_on "python@3.11"

  def install
    bin.install "passgen"
  end

  test do
    assert_match(/^[a-zA-Z0-9!@#$%^&*()_+]{12}$/, shell_output("#{bin}/passgen").chomp)
  end
end
