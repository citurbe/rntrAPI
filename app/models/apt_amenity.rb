# == Schema Information
#
# Table name: apt_amenities
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  count        :integer
#  name         :string
#

class AptAmenity < ApplicationRecord
  belongs_to :apartment
end
