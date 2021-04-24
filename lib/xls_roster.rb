XlsRoster = Struct.new(:name, :emplid, :title, :badge, :filename) do
  def self.read_file(env, worksheet, drop_rows, mapping)
    filename = ENV.fetch(env)
    ss = Roo::Spreadsheet.open(filename)
    ws = ss.sheet(worksheet)
    rows = ws.each.drop(drop_rows)
    headers = rows.first.map(&:strip).map { |h| h.gsub(/\s+/, " ") }
    rows[1 .. -1].map do |row|
      hsh = headers.zip(row).to_h
      values = mapping.map { |k| hsh.fetch(k) }
      new(values[0], values[1].to_i, values[2], normalize_badge(values[3]), filename)
    end
  end

  def self.all
    alpha_listing_with_badges_2020 + alpha_listing_with_badges_2016 + cy2015_annual_earnings_bpd + prr_9_4_2020
  end

  def self.alpha_listing_with_badges_2016
    read_file("ALPHA_LISTING_WITH_BADGES_2016", "ALPHa_LISTING_BPD_with_badges", 0, ["NAME", "IDNO6", "TITLE", "BADGE"])
  end

  def self.alpha_listing_with_badges_2020
    read_file("ALPHA_LISTING_WITH_BADGES_2020", "ALPHa_LISTING_BPD_FRONT_DESK_B1", 0, ["NAME", "IDNO6", "TITLE", "BADGE"])
  end

  def self.cy2015_annual_earnings_bpd
    read_file("CY2015_ANNUAL_EARNINGS_BPD", "2015 Annual Earnings Rpt", 0, ["NAME", 'EMPL ID', "TITLE"])
  end

  def self.prr_9_4_2020
    read_file("PRR_9_4_2020", "Job Data", 1, ["LN,FN", "ID", "Job Title"])
  end

  def self.normalize_badge(str)
    str ? str.sub(/^[0 ]+/, "") : nil
  end
end
