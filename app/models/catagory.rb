# == Schema Information
#
# Table name: catagories
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  content      :text(4294967295)
#  start_at     :datetime         not null
#  end_at       :datetime         not null
#  published_at :datetime
#  status       :integer          default("draft"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Catagory < ApplicationRecord
  has_many :article
  validates :title, presence: true
  scope :published_status, -> { where("status = 1") }
end
