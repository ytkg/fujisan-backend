namespace :rank do
  task :fetch => :environment do
    result_date = Date.today
    Category.all.each do |category|
      html = Nokogiri::HTML.parse(open(category.url).read)
      items = html.css('#rankingItem .rankBox')[0..9].each_with_object([]) do |item, arr|
        item_set   = item.css('.rankItemset')
        item_name  = item_set.css('dl dt').text
        brand_name = item_set.css('.brandName').text

        photo_link = item.css('.photoLink')
        url        = photo_link.attribute('href').value
        image_url  = photo_link.css('img').attribute('src').value
        price      = item_set.css('.price').text
        arr.push(
          { 
            item_name:  item_name,
            brand_name: brand_name,
            url:        'https://zozo.jp' + url,
            image_url:  image_url,
            price:      price
          }
        )
      end
      rank = category.ranks.find_or_initialize_by(result_date: result_date)
      rank.items = items
      rank.save
    end
  end
end
