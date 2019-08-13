class Category < ActiveHash::Base
  include ActiveHash::Associations
  has_many :ranks

  self.data = [
    { id: 1, name: 'すべて', url: 'https://zozo.jp/ranking/all-sales.html'},
    { id: 2, name: 'メンズ', url: 'https://zozo.jp/ranking/all-sales-men.html'},
    { id: 3, name: 'レディース', url: 'https://zozo.jp/ranking/all-sales-women.html'},
    { id: 4, name: 'キッズ', url: 'https://zozo.jp/ranking/all-sales-kids.html'}
  ]
end
