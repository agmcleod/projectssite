require 'yaml'

class Project
  attr_accessor :description, :image, :instructions, :name, :url

  class << self
    def all
      YAML.load(IO.read('data.yml')).collect do |vars|
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

  def image?
    !image.nil? && image != ''
  end

  def instructions?
    !instructions.nil? && instructions != ''
  end
end
