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

# Output

````
{
  "_id": null,
  "actor_id": "58B6AAF6-E198-416F-BAEA-7F61E5302085",
  "aliases": [
    {
      "_id": {
        "$oid": "52af7e937275620779020000"
      },
      "name": "Hidden Lynx",
      "organization": "Symantec",
      "sources": [
        1
      ]
    },
    {
      "_id": {
        "$oid": "52af7e937275620779030000"
      },
      "name": "Aurora Panda",
      "organization": "Crowdstrike",
      "sources": [
        1
      ]
    }
  ],
  "countries": [
    {
      "_id": {
        "$oid": "52af7e937275620779040000"
      },
      "name": "CN",
      "sources": [
        1
      ]
    }
  ],
  "motives": [
    {
      "_id": {
        "$oid": "52af7e937275620779050000"
      },
      "sources": [
        1
      ],
      "variety": "Financial"
    }
  ],
  "schema_version": "0.1",
  "sources": [
    {
      "_id": {
        "$oid": "52af7e927275620779000000"
      },
      "authors": [
        {
          "_id": {
            "$oid": "52af7e927275620779010000"
          },
          "first_name": "Robert",
          "handle": null,
          "last_name": "Lemos"
        }
      ],
      "date_accessed": "2013-12-16",
      "date_published": "2013-09-18",
      "intel_discipline": "OSINT",
      "number": 1,
      "organization": "eWeek",
      "title": "'Hidden Lynx' Group Hacks for Highest Bidder: Symantec Report",
      "tlp": "WHITE",
      "url": "http://www.eweek.com/security/hidden-lynx-group-hacks-for-highest-bidder-symantec-report.html"
    }
  ]
}
````