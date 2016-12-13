# == Schema Information
#
# Table name: apt_schools
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  a_schools    :integer
#  b_schools    :integer
#  c_schools    :integer
#  d_schools    :integer
#  f_schools    :integer
#

class AptSchool < ApplicationRecord
  belongs_to :apartment
end
