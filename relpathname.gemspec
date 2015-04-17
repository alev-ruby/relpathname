Gem::Specification.new do |s|
  s.name        = 'relpathname'
  s.version     = '0.0.2'
  s.date        = Time.now.strftime '%Y-%m-%d'
  s.summary     = "Relative version of Pathname class"
  s.description = "Pathname-extension producing relative path from Pathname.cwd"
  s.authors     = ["A. Levenkov"]
  s.email       = 'artem@levenkov.org'
  s.files       = Dir["lib/**/*.rb"]
  s.homepage    =
    'http://rubygems.org/gems/relpathname'
  s.license       = 'MIT'
end
