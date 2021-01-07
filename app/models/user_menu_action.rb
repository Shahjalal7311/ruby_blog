# == Schema Information
#
# Table name: user_menus
#
#  id           :integer          not null, primary key
#  parentMenu   :integer(255)      not null
#  status       :integer          default("draft"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class UserMenuAction < ApplicationRecord
  scope :getActionMenus, -> { where("actionStatus = 1") }
end
