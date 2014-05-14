# My projects site

This little app/repo is used for generating my projects site: http://projects.agmprojects.com. It uses a YAML file in the root of the app, and the rake task `rake build` to generate the static output. You're welcome to use the code here for your own, but I ask that you remove things that I have yet to standardize or move into a config file.

Such as:

- The title of the site
- my GA code
- my image files

## Future development

I will likely be coverting this to more of a sinatra site. As i wish to have individual project pages that will require a bit of a backend for things like selecting & downloading images in a single zip file.