class Lecture < ActiveRecord::Base
  has_many :downloads,:dependent=>:destroy
  has_many :announcements,:dependent=>:destroy
  has_many :links,:dependent=>:destroy

  has_many :groups
  
  belongs_to :user

  validates_numericality_of :semester, :integer_only=>true
  validates_format_of :unilink, :with=> /https:\/\/online\.uni-graz\.at\/.+/,:allow_blank=>true
  validates_format_of :tuglink, :with=> /https:\/\/online\.tugraz\.at\/.+/,:allow_blank=>true

  attr_accessible :name, :semester, :description, :tug_link, :tug_list, :tug_pattern, :uni_link, :uni_list, :uni_pattern

  HEADER = /\<TH.+class\s*=\s*\"tblHdr.*\".*\>(.+)\<\/TH\>/i
  GROUP = /\<TH.+class\s*=\s*\"tblGroup\".*\>(.+)\<\/TH\>/i
  DATA = /\<TD.*\>(.+)\<\/TD\>/i
  DATE = /(\d{1,2})\.(\d{1,2})\.(\d{4})/
  TIME = /(\d{1,2}):(\d{1,2})/
  EXCLUSIONS = /(?:LV-frei|abgesagt|Vorbesprechung|Tutorium|Klausur)/i

  def parse
    lists = Array.new
    urls = [@tug_link.empty? ? nil : @tug_link, @uni_link.empty? ? nil : @uni_link].compact!
    urls.each_index do |uni|
      lines = IO.popen("wget --no-check-certificate -O- \"#{urls[uni].gsub("lv.detail", "te_ortzeit.liste")}\"").readlines
      list = Array.new
      headers = Array.new
      groups = Array.new
      row = Array.new
      extract = false
      lines.each do |line|
        if !extract && line.match(/\<TABLE.+class\s*=\s*\"list\".*\>/i)
          extract = true
        elsif extract
          case line
            when DATA
              row << line.match(DATA)[1]
            when /\<TR.*\>/i
              row = Array.new
            when /\<\/TR\>/i
              exclusion = row.empty?
              row.each {|data| exclusion |= data.match(EXCLUSIONS)}
              list.last << row unless exclusion
            when HEADER
              headers << line.match(HEADER)[1]
            when GROUP
              list << Array.new
              groups << line.match(GROUP)[1]
            when /\<\/TABLE\>/i
              extract = false
          end
        end
      end
      lists[uni] = Hash.new
      header_date = headers.index("Datum")
      header_time = headers.index("von")
      list.each_index do |group|
        unless list[group].empty?
          dates = Array.new
          list[group].each do |line|
            date = line[header_date].match(DATE)
            time = line[header_time].match(TIME)
            dates << Time.local(date[3].to_i, date[2].to_i, date[1].to_i, time[1].to_i, time[2].to_i)
          end
          lists[uni][groups[group]] = dates
        end
      end
      @tug_list = lists[0]
      @uni_list = lists[1]
    end
  end
end
