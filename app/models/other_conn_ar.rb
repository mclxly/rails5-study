class OtherConnAr < ApplicationRecord
  self.abstract_class = true
  # establish_connection "other_#{Rails.env}"
  establish_connection "other_#{Rails.env}".to_sym
  self.table_name_prefix = 'wp_'
end
