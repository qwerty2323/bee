Gem::Specification.new do |s|
  s.name        = 'bee'
  s.version     = '0.0.1'
  s.date        = '2015-10-29'
  s.summary     = "Test assignment"
  s.description = "Queen Bee and Hive"
  s.authors     = ["Ivan Shelomentsev"]
  s.email       = 'Shelomentsev.Ivan@gmail.com'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage    =
    'https://github.com/qwerty2323/bee'
  s.license       = 'MIT'
end