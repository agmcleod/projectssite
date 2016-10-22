require 'haml'
require 'fileutils'
require_relative 'project'

desc 'builds static site'

def copy_assets
  FileUtils.cp_r('sitefiles/images', 'build')
  FileUtils.cp_r('sitefiles/javascripts', 'build')
  FileUtils.cp_r('sitefiles/stylesheets', 'build')
end

task :build do
  FileUtils.mkdir_p('build')

  Rake::Task['projects'].invoke(false)
  Rake::Task['presskits'].invoke(false)
  copy_assets
end

task :projects, [:copy_assets] do |t, args|
  ca = args[:copy_assets] != false
  lf = File.read('sitefiles/layouts/layout.haml')
  rendered_html = Haml::Engine.new(lf).render do
    Haml::Engine.new(File.read('sitefiles/index.haml')).render
  end

  File.open("build/index.html", "w+") do |f|
    f.write rendered_html
  end
  copy_assets if ca
end

task :presskits, [:copy_assets] do |t, args|
  ca = args[:copy_assets] != false
  lf = File.read('sitefiles/layouts/presskit.haml')
  Project.presskits.each do |project|
    rendered_html = Haml::Engine.new(lf).render do
      Haml::Engine.new(File.read('sitefiles/presskit.haml')).render(Object.new, project: project)
    end

    FileUtils.mkdir_p("build/#{project.url.gsub('/', '')}")
    File.open("build/#{project.url.gsub('/', '')}/index.html", "w+") do |f|
      f.write rendered_html
    end
  end
  copy_assets if ca
end