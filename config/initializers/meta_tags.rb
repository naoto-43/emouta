MetaTags.configure do |config|
  config.title_limit        = 70
  config.description_limit  = 160
  config.keywords_limit     = 255
  config.keywords_separator = ', '
end

Rails.application.config.meta_tags = {
  title:  'emouta - 「この曲のここが好き」を共有しよう！',
  site: 'emouta',
  reverse: true,
  charset: 'utf-8',
  description: 'emoutaは掲示板と楽曲紹介の機能を持ったwebサービスです。好きな歌詞を共有したり、新たな楽曲を開拓してみませんか？',
  keywords: 'emouta',
  og: {
    site_name: "emouta",
    title: 'emouta - 「この曲のここが好き」を共有しよう！',
    description: 'emoutaで好きな歌詞を共有したり、新たな楽曲を開拓してみませんか？',
    type: 'website',
    url: 'https://www.emouta.com/',
    image: 'https://www.emouta.com/app/assets/images/投稿アイコン２.png'
  }
}
