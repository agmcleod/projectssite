require 'yaml'
require 'active_support/inflector'
require_relative 'presskit'

class Project
  attr_accessor :challenges,
    :credits,
    :description,
    :download,
    :full_description,
    :full_page,
    :image,
    :instructions,
    :name,
    :platforms,
    :presskit,
    :screenshots,
    :url,
    :youtube_id

  class << self
    def all
      return @data if @data
      data = YAML.load(IO.read('data.yml'))
      @data = data.collect do |vars|
        Project.new vars
      end
    end

    def presskits
      data = self.all
      data.select{ |project| project.presskit? }
    end
  end

  def initialize(attrs = {})
    attrs.each do |k, v|
      if k == :presskit
        self.presskit = Presskit.new(v)
      else
        send("#{k}=".to_sym, v)
      end
    end

    if self.full_page.nil?
      self.full_page = false
    end
  end

  def description?
    !description.nil? && description != ''
  end

  def download?
    download
  end

  def full_page?
    full_page
  end

  def image?
    !image.nil? && image != ''
  end

  def instructions?
    !instructions.nil? && instructions != ''
  end

  def presskit?
    self.presskit
  end
end
