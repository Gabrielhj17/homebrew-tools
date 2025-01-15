class Passgen < Formula
  desc "Simple command-line password generator"
  homepage "https://github.com/Gabrielhj17/PassGen"
  url "https://raw.githubusercontent.com/Gabrielhj17/PassGen/main/passgen-release.tar.gz"
  version "1.0.0"
  sha256 "7bbc8ca3ca5289d4a0c6ffd32514b8fa98fa0e588923dcb1a3009e838cbd0853"
  license "MIT"

  depends_on "python@3.11"

  def install
    bin.install "passgen"
  end

  test do
    assert_match(/^Generated password: [a-zA-Z0-9!@#$%^&*()_+]{12}$/, shell_output("#{bin}/passgen").chomp)
  end
end
