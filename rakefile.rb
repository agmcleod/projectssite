require 'haml'
require 'fileutils'
require_relative 'project'

desc 'builds static site'
task :build do
  FileUtils.mkdir_p('build')
  FileUtils.mkdir_p('build/project')

  layout_file = File.read("sitefiles/layouts/layout.haml")

  rendered_html = Haml::Engine.new(layout_file).render do
    Haml::Engine.new(File.read('sitefiles/index.haml')).render
  end

  File.open("build/index.html", "w+") do |f|
    f.write rendered_html
  end

  FileUtils.cp_r('sitefiles/images', 'build')
  FileUtils.cp_r('sitefiles/javascripts', 'build')
  FileUtils.cp_r('sitefiles/stylesheets', 'build')
end