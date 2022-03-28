require 'nokogiri'
class Parser_class
    def initialize
        ##
    end
    def get_sub_structure(root, h)
        for sub_folder in root.elements
            if sub_folder.node_name == 'folder'
                puts("\t" * h + '└─────>' + sub_folder['name'])
                get_sub_structure(sub_folder, h+1)
            elsif sub_folder.node_name == 'file'
                puts("\t" * h + '└─────>' + sub_folder['name'])
            end
        end        
    end

    def parseXML(file)
        sample_data = File.open('sample.xml')
        if sample_data 
            parsed_info = Nokogiri::XML(sample_data)
            root_file = parsed_info.root
            get_sub_structure(root_file, 0)        
        end
    end
end

# begin
#     parser = Parser_class.new
#     if parser
#         parser.parseXML('sale.xml')    
#     else
#         raise 'File not found'
#     end
# rescue Exception => e
#     puts e.message        
# end

Parser_class.new.parseXML('sample.xml')