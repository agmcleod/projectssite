class Presskit
  attr_accessor :description,
    :download_images,
    :images,
    :platforms,
    :video

  def initialize(attrs)
    attrs.each do |k, v|
      send("#{k}=".to_sym, v)
    end
  end
end