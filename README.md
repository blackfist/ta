#WTH
I was looking at Open Source intel about threat actors and I got irritated that I didn't have a standard
way of describing and linking threat actors. Then I looked at STIX and threw up in my mouth because of 
all the XML. I though I would mess around and see if I could make something that I liked better.

# Things left to do
This thing would still need some way to track which campaigns are associated with the Threat Actor and
also needs a way to track iocs associated with the Threat Actor. Possibly by embedding VERIS incidents
in an array.

#Basic example

````
@ta = ThreatActor.new()
@ta.actor_id = SecureRandom.uuid.upcase
@ta.sources << Source.new(title:"'Hidden Lynx' Group Hacks for Highest Bidder: Symantec Report", 
  number:1,
  date_published:"20130918",
  date_accessed:"20131216",
  intel_discipline:"OSINT",
  organization: "eWeek",
  tlp:"WHITE",
  url:"http://www.eweek.com/security/hidden-lynx-group-hacks-for-highest-bidder-symantec-report.html")
@ta.sources.first.authors << Author.new(first_name:"Robert", last_name:"Lemos")
@ta.aliases << Alias.new(name:"Hidden Lynx",organization:"Symantec",sources:[1])
@ta.aliases << Alias.new(name:"Aurora Panda",organization:"Crowdstrike",sources:[1])
@ta.countries << Country.new(name:"CN",sources:[1])
@ta.motives << Motive.new(variety:"Financial",sources:[1])
puts JSON.pretty_generate(JSON.parse(@ta.to_json))
@test = ThreatActor.find_by("sources.organization" => "eWeek")
````