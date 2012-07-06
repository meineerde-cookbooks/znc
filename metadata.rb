maintainer       "Seth Chisamore"
maintainer_email "cookbooks@chisamore.com"
license          "Apache 2.0"
description      "Installs/Configures ZNC IRC bouncer"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "build-essential"

%w{ debian ubuntu }.each do |os|
  supports os
end
