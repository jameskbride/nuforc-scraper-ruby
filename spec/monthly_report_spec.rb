describe MonthlyReport do

  ARBITRARY_URL = 'http://nuforc.org/webreports/ndxevent.html'

  before(:each) do
    path = File.expand_path File.join(File.dirname(__FILE__), 'monthly_report.html')
    @monthly_reports_html = File::open(path)
  end

  after(:each) do
    @monthly_reports_html.close
  end

  it 'should return a list of incidents' do
    monthly_report = MonthlyReport.new(ARBITRARY_URL)

    expect(monthly_report).to receive(:open).with(ARBITRARY_URL).and_return(@monthly_reports_html)

    incidents = monthly_report.parse
    puts incidents.select {|report| report != nil}.empty?

    expect(incidents.length).to eq(529)
  end
end