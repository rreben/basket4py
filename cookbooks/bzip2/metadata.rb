name             'bzip2'
maintainer       'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license          'Apache 2.0'
description      'Installs bzip2 package.'
long_description 'Installs bzip2 package.'
version          '0.1.0'

%w(redhat centos).each do |name|
  supports name, '~> 7.0'
  supports name, '~> 6.4'
  supports name, '~> 5.8'
end

supports 'ubuntu', '= 14.04'
supports 'ubuntu', '= 12.04'
