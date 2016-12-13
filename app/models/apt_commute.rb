# == Schema Information
#
# Table name: apt_commutes
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  duration     :string
#

class AptCommute < ApplicationRecord
  belongs_to :apartment
end
