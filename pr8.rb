require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.hospitalsafetygrade.org/all-hospitals'
doc = Nokogiri::HTML(URI.open(url))

csv_file = CSV.open('hospitals.csv', 'w')
csv_file << ['Auto-incremental number', 'hospital name']

hospitals = doc.css('div.column1 a')

hospitals.each_with_index do |hospital, index|
  csv_file << [index + 1, hospital.text.strip]
end

csv_file.close