# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  content      :text(4294967295)
#  text    :text(65535)
#  start_at     :datetime         not null
#  end_at       :datetime         not null
#  published_at :datetime
#  status       :integer          default("draft"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Article < ApplicationRecord
  belongs_to :catagory, foreign_key: 'catagories_id'
  mount_uploader :attachment, AttachmentUploader
  validates :title, presence: true
end
