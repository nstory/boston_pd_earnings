PdfEarningsReport = Struct.new(
  :deptid, :department, :emplid, :empl_rcd, :name, :title, keyword_init: true
) do

  def self.earnings_report_2008
    read_file ENV.fetch('EARNINGS_REPORT_2008_PDF'), 2008
  end

  def self.read_file(filename, year)
    text = `pdftotext -layout '#{filename}' -`
    text.each_line
      .map(&:strip)
      .select { |l| /^211000/ =~ l }
      .map do |l|
        if regexp.match(l)
          h = $~.named_captures
          h.transform_keys!(&:downcase)
          h.transform_values!(&:strip)
          h["emplid"] = h["emplid"].to_i
          new(h)
        else
          $logger.warn "regexp does not match \"#{l}\""
          nil
        end
      end.compact
  end

  def self.files
    ENV.map do |k,v|
      if /^EARNINGS_REPORT_(\d\d\d\d)_PDF$/ =~ k
        {filename: v, year: $1.to_i}
      end
    end.compact
  end

  def self.regexp
    @regexp ||= %r{
    ^
    (?<DeptId>211000)\s+
      (?<Department>Boston\sPolice\sDept)\s+
      (?<Emplid>\d{6})\s+
      (?<Empl_Rcd>\d+)\s+
      (?<Name>[a-zA-Z, '.-]+?)
    (?<Title>#{title_disjunction})
    }x
  end

  def self.title_disjunction
    @title_disjunction ||= unique_police_titles.map { |t| Regexp.escape(t).gsub('\\ ', '\s*') }.join('|')
  end

  def self.unique_police_titles
    @unique_police_titles ||= CsvEarningsReport.all
      .select { |er| /Boston Police/ =~ er.department_name }
      .map(&:title)
      .uniq + [
        'Police Offc', 'Wkg Frprs Hostler (Police)', 'Chief Matron (Police)',
        'Cap.D.D.C-pd Details Section', 'Hostler (Police)', 'Police Lieut/Hdq Dispatch',
        'MotorEquipRpprClassII(Bpdfleet', 'Motor Equ RpprclassI(Bpdfleet)',
        "Police Lieut/Mobile Oper", "Computer Programmer", "Sergeant Mounted Patrol",
        "Dir-Transportation (Bpd)", "Radio Repairprs", "Telephone Operator",
        "Head Storekeeper", "Telephone Operator", "Telephone Operator", "Lawyer I",
        "Dir of Ballistics", "Motor Equip Repprs ClassIIIbpd"
      ]
  end
end
