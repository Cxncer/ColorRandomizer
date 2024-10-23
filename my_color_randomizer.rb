=begin
Copyright 2024, Author 
All Rights Reserved

License: AuthorsLicenseStatement 
Author: MSP
Organization:  
Name: ColorRandomizer
Version: 1.0.0
SU Version: SU2017 Up 
Date: 23 Oct 2024
Description: Apply random color to selected objects. 
Usage:  
History:
    1.0.0 2024-10-23 First Developed
=end

require 'sketchup.rb'
require 'extensions.rb'

module ColorRandomizer
  # Load extension
  loader = SketchupExtension.new('ColorRandomizer', 'ColorRandomizer/color_randomizer')
  loader.copyright = 'Copyright 2024 by MSP'
  loader.creator = 'MSP'
  loader.version = '1.0.0'
  loader.description = 'Apply random colors to selected objects.'

  Sketchup.register_extension(loader, true)
end
