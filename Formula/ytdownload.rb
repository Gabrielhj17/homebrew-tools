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
    url "https://files.pythonhosted.org/packages/54/7f/e3767c30b57c9a521c5ec7c9b36e6cf69bdb3e7a2e8b8cfaecb19e156f24/yt_dlp-2024.3.7-py2.py3-none-any.whl"
    sha256 "f49a3bb48b03c608d7bb7f67e6515227a58c8fc70c12ed04034a841aaa066b24"
  end

  def install
    virtualenv_install_with_resources
    bin.install "ytdownload"
  end

  test do
    system "#{bin}/ytdownload", "--help"
  end
end
