require 'sketchup.rb'

module ColorRandomizer
  def self.apply_random_colors
    model = Sketchup.active_model
    selection = model.selection

    if selection.empty?
      UI.messagebox('Please select one or more objects to ColorRandomizer.')
      return
    end

    selection.each do |entity|
      next unless entity.is_a?(Sketchup::Group) || entity.is_a?(Sketchup::ComponentInstance) || entity.is_a?(Sketchup::Face)

      material = entity.material || model.materials.add("RandomMaterial_#{rand(1000)}")
      material.color = Sketchup::Color.new(rand(255), rand(255), rand(255))
      entity.material = material
    end

    UI.messagebox('Random colors applied to selected objects!')
  end
end

unless file_loaded?(File.basename(__FILE__))
  # Add a menu item to activate the plugin
  UI.menu('Plugins').add_item('ColorRandomizer') {
    ColorRandomizer.apply_random_colors
  }

  # Add a toolbar with an icon to activate the plugin
  toolbar = UI::Toolbar.new 'ColorRandomizer'
  cmd = UI::Command.new('ColorRandomizer') {
    ColorRandomizer.apply_random_colors
  }
  cmd.small_icon = File.join(File.dirname(__FILE__), 'icons', 'color_randomizer.png')
  cmd.large_icon = File.join(File.dirname(__FILE__), 'icons', 'color_randomizer.png')
  cmd.tooltip = 'Apply random color to selected objects'
  cmd.status_bar_text = 'Apply random color to selected objects'
  cmd.menu_text = 'ColorRandomizer'

  toolbar = toolbar.add_item cmd
  toolbar.show

  file_loaded(File.basename(__FILE__))
end
