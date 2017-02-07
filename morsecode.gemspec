Gem::Specification.new do |s|
  s.name = 'morsecode'
  s.version = '0.2.1'
  s.summary = 'Transforms Morse code to a string, or a string into Morse code'
  s.authors = ['James Robertson']
  s.files = Dir['lib/morsecode.rb']
  s.signing_key = '../privatekeys/morsecode.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/morsecode'
  s.required_ruby_version = '>= 2.1.2'
end
