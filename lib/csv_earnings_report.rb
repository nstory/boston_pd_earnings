# parses employee-earnings-report-20??.csv files available from
# https://data.boston.gov/dataset/employee-earnings-report
# normalizes header names to be consistent
CsvEarningsReport = Struct.new(
  :name, :department_name, :title, :regular, :retro, :other, :overtime,
  :injured, :detail, :quinn, :total_earnings, :postal,
  :filename, :year, keyword_init: true) do
    MAPPING = {
      details: :detail,
      quinn_education_incentive: :quinn,
      zip: :postal,
      zip_code: :postal,
      department: :department_name
    }

    def self.all
      files.flat_map do |f|
        read_file f[:filename], f[:year]
      end
    end

    private

    def self.read_file(filename, year)
      rows = CSV.foreach(filename, headers: true, encoding: "ISO-8859-1")
      rows.map do |row|
        h = row.to_h.transform_keys { |k| k.strip.gsub(/[ \/]+/, "_").downcase.to_sym }
        h.transform_keys! { |k| MAPPING.fetch(k, k) }
        h.merge!({filename: filename, year: year})
        new(h)
      end
    end

    def self.files
      ENV.map do |k,v|
        if /^EARNINGS_REPORT_(\d\d\d\d)$/ =~ k
          {filename: v, year: $1.to_i}
        end
      end.compact
    end
  end
