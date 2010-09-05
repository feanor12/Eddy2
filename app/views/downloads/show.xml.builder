xml.instruct!
xml.metalink(:xmlns=>"urn:ietf:params:xml:ns:metalink"){
  xml.published(@download.created_at)
  xml.file(:name=>@download.name){
    @download.links.each do |l|
    xml.url(l.url,:priority=>"1")
    end
    xml.description(@download.description)
  }
}

