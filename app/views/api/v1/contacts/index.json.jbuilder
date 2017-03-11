json.array! @contacts.each do |contact|
  json.id contact.id
  json.first_name contact.first_name
  json.last_name contact.last_name
  json.email_address contact.email_address
  json.phone_number contact.phone_number
  json.company_name contact.company_name
end
