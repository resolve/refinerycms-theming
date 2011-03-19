#!/usr/bin/env ruby
version = '1.0.0'
raise "Could not get version so gemspec can not be built" if version.nil?
files = Dir[%q{**/*}].flatten.reject{|f| f =~ /\.gem$/}

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{refinerycms-theming}
  s.version           = %q{#{version}}
  s.description       = %q{Theming functionality for the Refinery CMS project, extracted from Refinery CMS core.}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{Theming functionality for the Refinery CMS project.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\\ Digital)
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  #{"s.test_files        = [
    '#{Dir.glob("test/**/*.rb").join("',\n    '")}'
  ]" if File.directory?("test")}

  s.add_dependency('refinerycms-core', '>= 0.9.9.1')
end
EOF

File.open(File.expand_path("../../refinerycms-theming.gemspec", __FILE__), 'w').puts(gemspec)
