
require 'httparty'

class SchoolAdapter
  include HTTParty

  def self.get_schools(zipcode)
    self.get("https://data.cityofnewyork.us/resource/r2nx-nhxe.json?location_1_zip=#{zipcode}")
  end

  def self.filter_schools(zipcode, grade)
    dbnList = get_schools(zipcode).map{|result| result.fetch("ats_system_code")}.join("','")
    self.get("https://data.cityofnewyork.us/resource/fcpn-yy58.json?$where=_2010_2011_overall_grade='#{grade}' AND dbn in('#{dbnList}')")
  end

  def self.get_schools_of_grade(zip, grade)
    filter_schools(zip, grade)
  end

  def self.get_all_grades(apartment)
    zip = apartment.zip
    AptSchool.create(
      apartment_id: apartment.id,
      a_schools: JSON(self.get_schools_of_grade(zip, 'A').response.body).count,
      b_schools: JSON(self.get_schools_of_grade(zip, 'B').response.body).count,
      c_schools: JSON(self.get_schools_of_grade(zip, 'C').response.body).count,
      d_schools: JSON(self.get_schools_of_grade(zip, 'D').response.body).count,
      f_schools: JSON(self.get_schools_of_grade(zip, 'F').response.body).count,
    )
  end

  def self.get_lat_lon
    list = filter_schools.map {|school| school.fetch('dbn')}.join("','")
    self.get("https://data.cityofnewyork.us/resource/r2nx-nhxe.json?location_1_zip=#{@zipcode}&$where=ats_system_code in ('#{list}')")
  end

  def self.get_school_markers(zipcode: '10004', grade: 'F')
    @zipcode = zipcode
    @grade = grade
    get_lat_lon.map {|result| {name:result.fetch("location_name"),lat:result.fetch("latitude"),lon:result.fetch("longitude")}}
  end

end
