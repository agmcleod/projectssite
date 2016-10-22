class Presskit
  attr_accessor :creators,
    :description,
    :download_images,
    :images,
    :platforms

  def initialize(attrs)
    attrs.each do |k, v|
      send("#{k}=".to_sym, v)
    end
  end
end