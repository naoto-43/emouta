module ApplicationHelper
  def default_meta_tags
  site: 'emouta',
  title:  'emouta - 「この曲のここが好き」を共有しよう！',
  reverse: true,
  charset: 'utf-8',
  description: 'emoutaは掲示板と楽曲紹介の機能を持ったwebサービスです。好きな歌詞を共有したり、新たな楽曲を開拓してみませんか？',
  keywords: 'emouta',
  og: {
    site_name: :site,
    title: :title,
    description: :description,  
    type: 'website',
    url: 'https://www.emouta.com/',
    image: ActionController::Base.helpers.asset_url("投稿アイコン２.png", host: 'https://www.emouta.com')
  }
end
