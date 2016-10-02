describe MonthlyReport do

  ARBITRARY_URL = 'http://nuforc.org/webreports/ndxevent.html'

  before(:each) do
    path = File.expand_path File.join(File.dirname(__FILE__), 'monthly_report.html')
    @index_reports_html = File::open(path)

    month_report = MonthlyReport.new(ARBITRARY_URL)
    expect(month_report).to receive(:open).with(ARBITRARY_URL).and_return(@index_reports_html)
    @incidents = month_report.parse
  end

  after(:each) do
    @index_reports_html.close
  end

  it 'should return a list of monthly reports' do
    expect(@incidents.length).to eq(529)
  end
end