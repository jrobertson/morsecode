Gem::Specification.new do |s|
  s.name = 'morsecode'
  s.version = '0.1.6'
  s.summary = 'morsecode'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb','lib/morsecode.xml']
  s.add_dependency('dynarex') 
  s.signing_key = '../privatekeys/morsecode.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/morsecode'
end
