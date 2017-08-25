
require 'sketchup.rb'

module DBekrenevPlugins
  module EstimatePlugin
    @positions = ["Куб"]
    
    def self.make_report
        model_name = if  Sketchup.active_model.title.empty? 
        then "unsaved-model" 
        else  Sketchup.active_model.title 
        end 
 
       entities = Sketchup.active_model.entities
 
        File.open("C:\\#{model_name}-estimate-report.html", 'w') do |file| 
        file.puts("<!doctype html>")
        file.puts("<html>\n<head></head>\n<body>\n")
        file.puts("<table>")
          for p in @positions do 
           cubes = entities.select {|e| e.typename=='Group' }.select { |e| e.name==p} 
    
           file.puts("<tr><td>#{p}</td><td>{#cubes}</td></tr>")  
          end
        file.puts("</table>\n</body>")        
      end
    end

    unless file_loaded?(__FILE__)
      menu = UI.menu('Tools')
      menu.add_item('Create estimate report') {
        self.make_report
      }
      
       
 
      file_loaded(__FILE__)
    end

  end 
end
