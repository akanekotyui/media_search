class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection('development')
 

class Image < ApplicationRecord
end
