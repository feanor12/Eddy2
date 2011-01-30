class Lecture < ActiveRecord::Base
  has_many :downloads, :dependent => :destroy
  has_many :announcements, :dependent => :destroy
  has_many :links, :dependent => :destroy

  has_many :groups
  
  belongs_to :user

  TUG_LINK = "https:\/\/online\.tugraz\.at\/tug_online\/"
  UNI_LINK = "https:\/\/online\.uni-graz\.at\/kfu_online\/"
  CLVNR = /clvnr=(\d+)/
  CORG = /corg=(\d+)/

  validates_numericality_of :semester, :integer_only => true
  validates_format_of :tuglink, :with => /#{TUG_LINK}.+/, :allow_blank => true
  validates_format_of :unilink, :with => /#{UNI_LINK}.+/, :allow_blank => true
  attr_accessible :name, :semester, :description, :tuglink, :unilink

  def tuglink
    tug_clvnr.nil? ? "" : "#{TUG_LINK}lv.detail?clvnr=#{tug_clvnr}&corg=#{tug_corg}"
  end

  def tuglink=(url)
    clvnr = url.match(CLVNR)
    corg = url.match(CORG)
    self.tug_clvnr = clvnr.nil? ? nil : clvnr[1]
    self.tug_corg = corg.nil? ? nil : corg[1]
    save
  end

  def unilink
    uni_clvnr.nil? ? "" : "#{UNI_LINK}lv.detail?clvnr=#{uni_clvnr}&corg=#{uni_corg}"
  end

  def unilink=(url)
    clvnr = url.match(CLVNR)
    corg = url.match(CORG)
    self.uni_clvnr = clvnr.nil? ? nil : clvnr[1]
    self.uni_corg = corg.nil? ? nil : corg[1]
    puts uni_corg
    save
  end

  HEADER = /\<TH.+class\s*=\s*\"tblHdr.*\".*\>(.+)\<\/TH\>/i
  GROUP = /\<TH.+class\s*=\s*\"tblGroup\".*\>(.+)\<\/TH\>/i
  DATA = /\<TD.*\>(.+)\<\/TD\>/i
  DATE = /(\d{1,2})\.(\d{1,2})\.(\d{4})/
  TIME = /(\d{1,2}):(\d{1,2})/
  EXCLUSIONS = /(?:LV-frei|abgesagt|Vorbesprechung|Tutorium|Klausur)/i

  def parse(link)
    lines = IO.popen("wget --no-check-certificate -O- \"#{link.sub("lv.detail", "te_ortzeit.liste")}\"").readlines
    list = [[]]
    headers = Array.new
    groups = Array.new
    row = Array.new
    extract = false
    lines.each do |line|
      if !extract
        extract |= line =~ /\<TABLE.+class\s*=\s*\"list\".*\>/i
      else
        case line
        when DATA
          row << line.match(DATA)[1]
        when /\<TR.*\>/i
          row = Array.new
        when /\<\/TR\>/i
          exclusion = row.empty?
          row.each {|data| exclusion |= data =~ EXCLUSIONS}
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
    parse = Hash.new
    header_date = headers.index {|header| header =~ /Datum/}
    header_time = headers.index {|header| header =~ /von/}
    header_room = headers.index {|header| header =~ /Ort/}
    list.each_index do |group|
      unless list[group].empty?
        dates = Array.new
        rooms = Array.new
        list[group].each do |line|
          date = line[header_date].match(DATE)
          time = line[header_time].match(TIME)
          dates << Time.local(date[3].to_i, date[2].to_i, date[1].to_i, time[1].to_i, time[2].to_i)
          rooms << line[header_room].sub(/\<\/A\>/i, '')
        end
        if rooms.uniq.size > 1
          dates.each_index do |i|
            parse[rooms[i]] ||= Array.new
            parse[rooms[i]] << dates[i]
          end
        else
          parse[groups[group]] = dates
        end
      end
    end
    parse
  end

  def create_timers data
    data.each do |group, times|
      g = self.groups.create(:name => group)
      times.each {|time| g.timers.create(:deadline => time, :content => self.name)}
    end
  end

  def parse!
    @tug_list = tuglink.empty? ? nil : parse(tuglink)
    @uni_list = unilink.empty? ? nil : parse(unilink)
  end
end
