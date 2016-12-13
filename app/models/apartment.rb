# == Schema Information
#
# Table name: apartments
#
#  id      :integer          not null, primary key
#  user_id :integer
#  address :string
#

class Apartment < ApplicationRecord
  belongs_to :user
  has_one :apt_school, dependent: :destroy
  has_one :apt_commute, dependent: :destroy
  has_one :apt_crime, dependent: :destroy
  has_many :apt_amenities, dependent: :destroy
end
