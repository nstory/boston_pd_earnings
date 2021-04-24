Roster = Struct.new(:employee_id, :names, :badges, keyword_init: true) do
  def self.by_id
    all.inject({}) do |h,r|
      h[r.employee_id] = r
      h
    end
  end

  def self.by_name
    hsh = Hash.new { |h,k| h[k] = [] }
    Roster.all.each do |r|
      r.names.each { |n| hsh[n] << r }
    end
    hsh
  end

  def self.all
    by_id = Hash.new { |h,k| h[k] = {names: [], badges: []} }

    # add Excel rosters
    XlsRoster.all.each do |xr|
      r = by_id[xr.emplid]
      r[:names] << xr.name
      r[:badges] << xr.badge if xr.badge
    end

    # add PDF earnings report (the one that contains employee ids)
    PdfEarningsReport.earnings_report_2008.each do |per|
      r = by_id[per.emplid]
      r[:names] << per.name
    end

    by_id.map do |id, r|
      new(employee_id: id, names: r[:names].uniq, badges: r[:badges].uniq)
    end
  end
end
