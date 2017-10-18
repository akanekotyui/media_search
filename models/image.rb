class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Image < ApplicationRecord
end
