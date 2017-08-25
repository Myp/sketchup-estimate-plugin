
require 'sketchup.rb'
require 'extensions.rb'

module DBekrenevPlugins
  module EstimatePlugin

    unless file_loaded?(__FILE__)
      ex = SketchupExtension.new('Estimate Plugin', 'estimate-plugin/main')
      ex.description = 'Plugin make estimate material reports'
      ex.version     = '0.0.1'
      ex.copyright   = 'Dmitry Bekrenev'
      ex.creator     = 'Dmitry Bekrenev'
      Sketchup.register_extension(ex, true)
      file_loaded(__FILE__)
    end

  end 
end 
