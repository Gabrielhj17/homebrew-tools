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
    url "https://files.pythonhosted.org/packages/22/80/74951a8b513090fc0c65d88a483e7d031c8c77441ee1de0c1e0ec449bb18/yt_dlp-2024.3.10-py2.py3-none-any.whl"
    sha256 "313d93a48c6bea8b138c571f5323151fab1577dda4d4c42b658db999818b3844"
  end

  def install
    virtualenv_install_with_resources
    bin.install "ytdownload"
  end

  test do
    system "#{bin}/ytdownload", "--help"
  end
end
