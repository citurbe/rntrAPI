# == Schema Information
#
# Table name: destinations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :text
#  address    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Destination < ApplicationRecord
  belongs_to :user
end
