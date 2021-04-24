require "roo"
require "roo-xls"

require_relative "./csv_earnings_report.rb"
require_relative "./pdf_earnings_report.rb"
require_relative "./roster.rb"
require_relative "./xls_roster.rb"

$logger = Logger.new(STDERR)

def multiple_names
  puts ["employee_id", "name1", "name2"].to_csv
  Roster.all
    .select { |r| r.names.count > 1 }
    .each do |r|
      puts [r.employee_id, *r.names].to_csv
    end
end

def multiple_ids
  puts ["name", "employee_id_1", "employee_id_2"].to_csv
  Roster.by_name.each do |name, rosters|
    if rosters.count > 1
      puts [name, *(rosters.map(&:employee_id))].to_csv
    end
  end
end

def earnings_with_ids
  header = [:employee_id, :name, :department_name, :title, :regular, :retro, :other, :overtime, :injured, :detail, :quinn, :total_earnings, :postal, :filename, :year]
  by_name = Roster.by_name
  puts header.to_csv
  CsvEarningsReport.all.each do |cer|
    next unless /Boston Police/ =~ cer.department_name
    h = cer.to_h
    rosters = by_name[cer.name]
    if rosters && rosters.count == 1
      h[:employee_id] = rosters.first.employee_id
    end
    puts header.map { |k| h[k] }.to_csv
  end
end

def roster
  puts %w{employee_id names badges}.to_csv
  Roster.all.each do |r|
    puts [r.employee_id, r.names.join('; '), r.badges.join('; ')].to_csv
  end
end
