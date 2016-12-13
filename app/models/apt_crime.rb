# == Schema Information
#
# Table name: apt_crimes
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  felonies     :integer
#  misdemeanors :integer
#  violations   :integer
#

class AptCrime < ApplicationRecord
  belongs_to :apartment
end
