#!/usr/bin/env ruby
require 'mailchimp'
require 'json'

mailchimpAPIKey = "54bd35215a8b458f90b59033ee4dbe07-us13"

mailchimp = Mailchimp::API.new(mailchimpAPIKey)

db = {}
lists = mailchimp.lists.list
list  = lists['data']

for list in list
  listInfo = {
    'id': list['id'],
    'name': list['name']
  }
  members = []
  page = 0
  loop do
    foo = mailchimp.lists.members(listInfo[:id], 'subscribed', {limit: 100, start: page})['data']
    for member in foo
      memberInfo = {
        'email': member['email'],
        'firstName': member['merges']['FNAME'],
        'lastName': member['merges']['LNAME']
      }
      members << memberInfo
      # puts memberInfo
    end
    page += 1
    break if foo.count == 0
  end
  listInfo['count'] = members.count
  listInfo['members'] = members
  puts "#{listInfo[:name]} -> #{listInfo['count']} members"
  db[listInfo[:id]] = listInfo
end

File.open("_data/mailchimp.json","w") do |f|
  f.write(db.to_json)
end
