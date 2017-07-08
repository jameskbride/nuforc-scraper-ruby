describe IndexReportsSince do

  ARBITRARY_URL = 'http://nuforc.org/webreports/ndxpost.html'
  EXACT_DATE = '07/07/2017'

  before(:each) do
    path = File.expand_path File.join(File.dirname(__FILE__), 'reports_since.html')
    @index_reports_html = File::open(path)
  end

  after(:each) do
    @index_reports_html.close
  end

  describe 'given a matching date' do
    it 'should return a list of reports since that date' do
      index_reports = IndexReportsSince.new(ARBITRARY_URL, EXACT_DATE)
      expect(index_reports).to receive(:open).with(ARBITRARY_URL).and_return(@index_reports_html)
      @monthly_reports = index_reports.parse

      expect(@monthly_reports.length).to eq(1)
      expect(@monthly_reports[0].url).to eq('http://nuforc.org/webreports/ndxp170707.html')
    end
  end
end