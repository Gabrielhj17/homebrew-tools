class Ytdownload < Formula
  include Language::Python::Virtualenv

  desc "Command-line video downloader using yt-dlp"
  homepage "https://github.com/Gabrielhj17/YTdownload"
  url "https://github.com/Gabrielhj17/YTdownload/raw/refs/heads/main/ytdownload-release.tar.gz"
  sha256 "3eefb11ae9b3c3a53e5970d8fbf58de0eec4e9c5d759d2e959a5586be97393e1"
  license "MIT"

  depends_on "python@3.11"

  resource "yt-dlp" do
    url "https://files.pythonhosted.org/packages/00/25/3e6257fc684d166cfc51f3c1ef7ec030dd05554956f5dc4fcd4b9e3d4625/yt-dlp-2023.12.30.tar.gz"
    sha256 "da99cf126f27f2264c1a10daf0995fbf6c5ce70e3f893879eec4373eb386c289"
  end

  def install
    virtualenv_install_with_resources
    bin.install "ytdownload"
  end

  test do
    system "#{bin}/ytdownload", "--help"
  end
end
