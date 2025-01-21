class Ytdownload < Formula
  include Language::Python::Virtualenv
  
  desc "Command-line video downloader using yt-dlp"
  homepage "https://github.com/Gabrielhj17/YTdownload"
  url "https://github.com/Gabrielhj17/YTdownload/raw/refs/heads/main/ytdownload-release.tar.gz"
  version "1.1.0"
  sha256 "e5362e04ee34c4729289a7e5c55860b402aaa484970250dec10c27594ce2ee85"
  license "MIT"
  depends_on "python@3.11"

  resource "yt-dlp" do
    url "https://files.pythonhosted.org/packages/fd/e9/61fc5947d35e9fcdd8efca88a5a2de53946a4aaf4e6c3e23f7b1b721b4c8/yt_dlp-2025.1.15.tar.gz"
    sha256 "e8ec515d49bb62704915d13a22ee6fe03a5658d651e4e64574e3a17ee01f6e3b"
  end

  def install
    virtualenv_create(libexec, "python3.11")
    virtualenv_install_with_resources
    
    temp_script = Pathname.new("#{libexec}/bin/ytdownload_temp")
    temp_script.write <<~EOS
      #!/usr/bin/env python3
      import os
      import sys
      sys.path.insert(0, "#{libexec}/lib/python3.11/site-packages")
      from ytdownload.ytdownload import main
      if __name__ == "__main__":
          sys.exit(main())
    EOS
    
    FileUtils.chmod "+x", temp_script
    
    FileUtils.mv(temp_script, bin/"ytdownload", force: true)
  end

  test do
    system "#{bin}/ytdownload", "--help"
  end
end
