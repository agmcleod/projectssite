require 'yaml'
require 'active_support/inflector'

class Project
  attr_accessor :challenges,
    :credits,
    :description,
    :download,
    :image,
    :instructions,
    :name,
    :url

  class << self
    def all
      return @data if @data
      data = YAML.load(IO.read('data.yml'))
      @data = data.collect do |vars|
        Project.new vars
      end
    end
  end

  def initialize(attrs = {})
    attrs.each do |k, v|
      send("#{k}=".to_sym, v)
    end
  end

  def description?
    !description.nil? && description != ''
  end

  def download?
    download
  end

  def image?
    !image.nil? && image != ''
  end

  def instructions?
    !instructions.nil? && instructions != ''
  end
end
