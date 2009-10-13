gem 'google-geocode', :version => '~> 1.2.1', :lib => 'google_geocode'
gem "RedCloth", :lib => "redcloth", :source => "http://code.whytheluckystiff.net"
puts "\n"
if yes?("Install required gems as root? (y/n)")
  rake "gems:install", :sudo => true
else
  rake "gems:install", :sudo => false
end

plugin 'later_dude', :git => "git://github.com/clemens/later_dude.git"
plugin 'ym4r-gm', :git => "git://github.com/molpe/ym4r-gm.git"

#puts "++++++++++++++++++++++++++++++++++++++++++++++++++++"
#puts "Note: ym4r_gm seems to have a problem with Rails 2.2."
#puts "But it can be resolved easily: http://railsforum.com/viewtopic.php?id=24839"
#puts "++++++++++++++++++++++++++++++++++++++++++++++++++++"

plugin 'tog_conclave', :git => "git://github.com/tog/tog_conclave.git"

route "map.routes_from_plugin 'tog_conclave'"

generate "update_tog_migration"

rake "db:migrate"
