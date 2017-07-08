require_relative 'index_reports_by_month'
require_relative 'index_reports_since'
require 'securerandom'
require 'commander'

class NuforcScraper
  include Commander::Methods

  def run
    program :name, 'Nuforc Scraper'
    program :version, '1.0.0'
    program :description, 'Scrapes the NUFORC UFO Database found at: http://nuforc.org'

    command :scrape do |c|
      c.syntax = 'scrape DIR'
      c.description = 'Scrapes all reports and writes them to the provided directory DIR'
      c.option '--since mm/dd/YYYY', String, 'Scrapes reports posted since a given date'
      c.action do |args, options|
        if options.since
          reporter = IndexReportsSince.new('http://nuforc.org/webreports/ndxpost.html', options.since)
        else
          reporter = IndexReportsByMonth.new('http://nuforc.org/webreports/ndxevent.html')
        end

        index_reports(reporter, args.first)
      end
    end

    run!
  end

  def index_reports(reporter, dir)
    begin
      monthly_reports = reporter.parse
      monthly_reports.each {|report|
        incidents = report.parse
        incidents.each {|incident|
          begin
            incident.parse
            incident_json = incident.to_json
            File.write("#{dir}/#{SecureRandom.uuid}.json", incident_json)
          rescue
            puts "Couldn't parse the incident"
          end
        }

      }
    rescue
      puts "Couldn't parse the index"
    end
  end
end

NuforcScraper.new.run if $0 == __FILE__