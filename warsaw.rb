# encoding: UTF-8
require_relative '../bicycle_report-gem/lib/bicycle_report.rb'

#Warszawa - https://www.openstreetmap.org/relation/336074
lat_min = 52.1024
lat_max = 52.4334
lon_min = 20.7891
lon_max = 21.3010
main_generator = ReportGenerator.new(lat_min, lat_max, lon_min, lon_max)
main_generator.set_language(:pl)
# TODO: main_generator.register_linkable_source("(...)")
main_generator.start_writing_summary_pages()

bicycle_ways = BicycleWayRaportGenerator.new(lat_min, lat_max, lon_min, lon_max)
names_of_streets_where_contraflow_is_unwanted = []
names_of_streets_certain_to_not_be_oneway = [
#following roads are not really oneway for practical purposes
]
bicycle_ways.process(names_of_streets_certain_to_not_be_oneway, names_of_streets_where_contraflow_is_unwanted)

krakow_crossing = CrossingReportGenerator.new(lat_min, lat_max, lon_min, lon_max)
krakow_crossing.generate_html_files_about_crossings

krakow_bicycle_parking = BicycleParkingRaportGenerator.new(lat_min, lat_max, lon_min, lon_max)
krakow_bicycle_parking.generate_statistics_about_bicycle_parkings

main_generator.copy_css()
main_generator.finish_writing_summary_pages()
