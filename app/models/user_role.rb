# == Schema Information
#
# Table name: user_roles
#
#  id           :integer          not null, primary key
#  name   :integer(255)      not null
#  status       :integer          default("draft"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class UserRole < ApplicationRecord
  
end
