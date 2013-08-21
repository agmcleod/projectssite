class Project
  attr_accessor :description, :instructions, :name, :url

  class << self
    def all
      [
        {name: 'Global Game Jam 2013', url: '/ggj2013'},
        {name: 'January Knight', url: '/january-knight.zip', description: 'Unzip the file, and run via command line', instructions: 'java -jar january-knight.jar'},
        {name: 'Badass Stickman', url: '/badass-stickman.zip', description: 'Unzip the file, and run via command line', instructions: 'java -jar badass-stickman.jar'},
        {name: 'LudumDare 26', url: '/ld26.zip', description: 'Unzip the file, and run via command line', instructions: 'java -jar ld26.jar'},
        {name: 'TO Jam - Block the enemy', url: '/blocktheenemy.zip', description: 'Unzip the file, and run via command line', instructions: 'java -jar blocktheenemy.jar'}
        {name: 'Ultimate Roadie', url: '/ultimate-roadie'}
      ].collect do |vars|
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
end
