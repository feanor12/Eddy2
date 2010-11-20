class Lecture < ActiveRecord::Base
  has_many :downloads,:dependent=>:destroy
  has_many :announcements,:dependent=>:destroy
  has_many :links,:dependent=>:destroy
  belongs_to :user

  validates_numericality_of :semester, :integer_only=>true
  validates_format_of :unilink, :with=> /https:\/\/online\.uni-graz\.at\/.+/,:allow_blank=>true
  attr_accessible :name,:semester,:description,:unilink,:tuglink

  def tuglink
    if self.tug_clvnr
      "https://online.tugraz.at/tug_online/lv.detail?clvnr=#{tug_clvnr}"
    else
      ""
    end
  end

  def tuglink=(url)
    r_clvnr=/clvnr=([\d]{6})/
    r_corg=/corg=([\d]{4})/
    clvnr=url.match(r_clvnr)
    corg=url.match(r_corg)
    self.tug_clvnr = clvnr[1] unless clvnr.nil?
    self.tug_corg = corg[1] unless corg.nil?
    save
  end

end
