describe IndexReportsByMonth do

  ARBITRARY_URL = 'http://nuforc.org/webreports/ndxevent.html'

  before(:each) do
    path = File.expand_path File.join(File.dirname(__FILE__), 'reports_by_month.html')
    @index_reports_html = File::open(path)
  end

  after(:each) do
    @index_reports_html.close
  end

  it 'should return a list of monthly reports' do
    index_reports = IndexReportsByMonth.new(ARBITRARY_URL)

    expect(index_reports).to receive(:open).with(ARBITRARY_URL).and_return(@index_reports_html)

    monthly_reports = index_reports.parse
    puts monthly_reports.select {|report| report != nil}.empty?

    expect(monthly_reports.length).to eq(888)
  end

  it 'should populate the month reports with a full url' do
    index_reports = IndexReportsByMonth.new(ARBITRARY_URL)

    expect(index_reports).to receive(:open).with(ARBITRARY_URL).and_return(@index_reports_html)

    monthly_reports = index_reports.parse
    puts monthly_reports.select {|report| report != nil}.empty?

    expect(monthly_reports[0].url).to eq('http://nuforc.org/webreports/ndxe201609.html')
  end
end