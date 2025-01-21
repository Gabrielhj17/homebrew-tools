class Ytdownload < Formula
  include Language::Python::Virtualenv
  
  desc "Command-line video downloader using yt-dlp"
  homepage "https://github.com/Gabrielhj17/YTdownload"
  url "https://github.com/Gabrielhj17/YTdownload/raw/refs/heads/main/ytdownload-release.tar.gz"
  version "1.1.0"
  sha256 "ca245148b942caec61cb0b16d527a0f6a2d6c1fcefd3b5825a581539f34d285f"
  license "MIT"
  depends_on "python@3.11"

  resource "yt-dlp" do
    url "https://files.pythonhosted.org/packages/fd/e9/61fc5947d35e9fcdd8efca88a5a2de53946a4aaf4e6c3e23f7b1b721b4c8/yt_dlp-2025.1.15.tar.gz"
    sha256 "e8ec515d49bb62704915d13a22ee6fe03a5658d651e4e64574e3a17ee01f6e3b"
  end

  def install
    virtualenv_create(libexec, "python3.11")
    virtualenv_install_with_resources
    
    # Write a proper wrapper script
    (bin/"ytdownload").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/lib/python3.11/site-packages:$PYTHONPATH"
      exec "#{libexec}/bin/python3.11" -m ytdownload.ytdownload "$@"
    EOS
    chmod 0755, bin/"ytdownload"
  end

  test do
    system bin/"ytdownload", "--help"
  end
end
