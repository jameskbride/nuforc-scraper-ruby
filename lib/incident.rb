require_relative 'index_reports_by_month'

class Incident < IndexReportsByMonth

  attr_reader :url, :date_time

  def initialize(url, date_time)
    super(url)
    @date_time = date_time
  end

  def parse
  end
end
