events_path = "#{Rails.root}/public/images"
events = `ls #{events_path}`.split("\n")

puts "all events"
puts events

events.each do |event_name|
  event = Event.find_by_name(event_name)
  event = Event.first_or_create(name: event_name)
  photo_path = "#{Rails.root}/public/images/#{event_name}"
  puts "new photo path"
  puts photo_path

  photos = `ls #{photo_path}`.split("\n")
  puts "events/photos"
  puts photos
  puts "........"

  photos.each do |photo_name|
    photo = Photo.first_or_create(name: photo_name, event_id: event.id)
  end
end

#photo


