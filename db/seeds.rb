page = Page.find_by_slug :about
page = Page.new(title: 'Подробнее о школе', slug: :about, body: 'about') unless page
if page.save
  puts 'Done'
else
  puts "Error! #{page.errors.messages}"
end
