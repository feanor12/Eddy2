xml.instruct!
xml.metalink(:xmlns=>"urn:ietf:params:xml:ns:metalink"){
  @downloads.each do |download|
  xml.file(:name=>raw(download.name)){
    download.links.each do |l|
    xml.url(raw(l.url),:priority=>"1")
    end
    xml.description(download.description)
  }
  end
}

