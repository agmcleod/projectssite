class Project
  attr_accessor :description, :instructions, :name, :url

  class << self
    def all
      [
        {name: 'Global Game Jam 2013', url: '/ggj2013'},
        {name: 'January Knight', url: '/january-knight.zip', description: 'Unzip the file, and run via command line', instructions: 'java -jar january-knight.jar'},
        {name: 'Badass Stickman', url: '/badass-stickman.zip', description: 'Unzip the file, and run via command line', instructions: 'java -jar badass-stickman.jar'},
        {name: 'LudumDare 26', url: '/ld26.zip', description: 'Unzip the file, and run via command line', instructions: 'java -jar ld26.jar'},
        {name: 'TO Jam - Block the enemy', url: '/blocktheenemy.zip', description: 'Unzip the file, and run via command line', instructions: 'java -jar blocktheenemy.jar'},
        {name: 'Ultimate Roadie', url: '/ultimate-roadie', description: "After a metal concert, you're in charge of getting all the gear into the truck. Dont miss!"},
        {name: 'LD27 - The limits of light', url: '/ld27', description: "Collection game I made for Ludum Dare 28. The key is the game is constantly dark. But you can trigger a flicker light for a few seconds to see your way."},
        {name: '7 Day FPS 2013', url: '/7dfps2013', description: "Tried making something with Three.JS. Didn't get too far, but it was fun!"},
        {name: 'Snowball Effect', url: '/snowballeffect', description: "You are a snowball. Run into things to get bigger and crush the skiing chalet."},
        {name: 'Navigate - a mobile device motion demo', url: '/navigate'},
        {name: 'Github Gameoff 2013 (un-naed)', url: '/github-gameoff-2013', description: "Started on a simple platformer for the github gameoff contest. Idea was to change through different forms to accomplish different tasks. WASD and tab for controls."}
      ].reverse.collect do |vars|
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
