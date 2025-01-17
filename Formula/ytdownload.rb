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
    url "https://files.pythonhosted.org/packages/36/37/be7e63d85af5b82e5656a305ed61b864cf68b2262f3f9977752078784cf6/yt_dlp-2024.1.1-py2.py3-none-any.whl"
    sha256 "f1471369e7d720903e24cc91ad3478a4b71491c617899d129ee40f2bbff85f15"
  end

  def install
    virtualenv_install_with_resources
    bin.install "ytdownload"
  end

  test do
    system "#{bin}/ytdownload", "--help"
  end
end
