require_relative 'index_reports_by_month'
require 'securerandom'

index_reports_by_month = IndexReportsByMonth.new('http://nuforc.org/webreports/ndxevent.html')

begin
  monthly_reports = index_reports_by_month.parse
  monthly_reports.each {|report|
    incidents = report.parse
    incidents.each {|incident|
      begin
        incident.parse
        incident_json = incident.to_json
        File.write("#{ARGV[0]}/#{SecureRandom.uuid}.json", incident_json)
      rescue
        puts "Couldn't parse the incident"
      end
    }

  }
rescue
  puts "Couldn't parse the index"
end