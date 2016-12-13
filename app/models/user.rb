# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :text
#  password_digest :text
#  commute         :integer
#  amenities       :integer
#  schools         :integer
#  safety          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  destination     :text
#

class User < ApplicationRecord
  has_secure_password
  has_many :destinations
  has_many :apartments
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create
end
