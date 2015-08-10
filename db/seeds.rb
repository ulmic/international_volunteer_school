[:about, :docs].each do |slug|
  page = Page.find_by_slug slug
  page = Page.new(title: 'Подробнее о школе', slug: slug, body: slug.to_s) unless page
  if page.save
    puts 'Done'
  else
    puts "Error! #{page.errors.messages}"
  end
end
