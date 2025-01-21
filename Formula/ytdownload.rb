class Ytdownload < Formula
  include Language::Python::Virtualenv
  
  desc "Command-line video downloader using yt-dlp"
  homepage "https://github.com/Gabrielhj17/YTdownload"
  url "https://github.com/Gabrielhj17/YTdownload/raw/refs/heads/main/ytdownload-release.tar.gz"
  version "1.0.0"
  sha256 "3eefb11ae9b3c3a53e5970d8fbf58de0eec4e9c5d759d2e959a5586be97393e1"
  license "MIT"

  depends_on "python@3.11"

  resource "yt-dlp" do
    url "https://files.pythonhosted.org/packages/fd/e9/61fc5947d35e9fcdd8efca88a5a2de53946a4aaf4e6c3e23f7b1b721b4c8/yt_dlp-2025.1.15.tar.gz"
    sha256 "e8ec515d49bb62704915d13a22ee6fe03a5658d651e4e64574e3a17ee01f6e3b"
  end

  def install
    virtualenv_install_with_resources
    bin.install "ytdownload"
  end

  test do
    system "#{bin}/ytdownload", "--help"
  end
end
