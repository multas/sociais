class Blacklist < ActiveRecord::Base
  
  scope :enabled, where(:enabled => true)
  scope :disabled, where(:enabled => false)
end
