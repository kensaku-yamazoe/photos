require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  #開発とテストはローカルに保存
  if Rails.env.development? || Rails.env.test?
    config.storage = :file

  #本番はS3に保存する
  elsif Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',     #AWSのアクセスキーとシークレットキーを環境変数で定義するということ
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id], #鍵の本体はcredentails.ymlの中
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key], #鍵の本体はcredentails.ymlの中
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'photos-kensaku'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/photos-kensaku'
  end
end