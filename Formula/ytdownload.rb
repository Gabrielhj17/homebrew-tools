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
    # The URL and sha256 should be updated to the latest version
    url "https://files.pythonhosted.org/packages/95/cf/280a95c40acfdd0d5a3c61954becee69e761b3303cb8f79b7bc7624ca302/yt_dlp-2024.3.10-py2.py3-none-any.whl"
    sha256 "58e0547f0c5d9929fab43185f2c4d4d30f3025b04daaefb29fcd9d69e6c43894"
  end

  def install
    virtualenv_install_with_resources
    bin.install "ytdownload"
  end

  test do
    system "#{bin}/ytdownload", "--help"
  end
end
