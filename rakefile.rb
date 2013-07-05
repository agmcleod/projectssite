require 'haml'
require 'fileutils'
require_relative 'project'

desc 'builds static site'
task :build do
  FileUtils.mkdir_p('build')
  Dir['sitefiles/*.haml'].each do |file|
    rendered_html = Haml::Engine.new(File.read("sitefiles/layouts/layout.haml")).render do
      Haml::Engine.new(File.read(file)).render
    end
    File.open("build/#{file.gsub('sitefiles/', '').gsub('haml','html')}", 'w+') do |f|
      f.write(rendered_html)
    end
  end
  FileUtils.cp_r('sitefiles/images', 'build')
  FileUtils.cp_r('sitefiles/javascripts', 'build')
  FileUtils.cp_r('sitefiles/stylesheets', 'build')
end