# prefixを付ける設定
Shoryuken.active_job_queue_name_prefixing = true

if ENV['RAILS_ENV'] == 'production'
  Shoryuken.configure_client do |config|
    config.sqs_client = Aws::SQS::Client.new(region: 'ap-northeast-1')
  end

  Shoryuken.configure_server do |config|
    config.sqs_client = Aws::SQS::Client.new(region: 'ap-northeast-1')
  end

else
  Shoryuken.configure_client do |config|
    config.sqs_client = Aws::SQS::Client.new(
      region: 'ap-northeast-1',
      secret_access_key: 'secret access key',
      access_key_id: 'access key id',
      endpoint: ENV["AWS_SQS_ENDPOINT"] || 'http://localhost:9494',
      verify_checksums: false
    )
  end

  Shoryuken.configure_server do |config|
    config.sqs_client = Aws::SQS::Client.new(
      region: 'ap-northeast-1',
      secret_access_key: 'secret access key',
      access_key_id: 'access key id',
      endpoint: ENV["AWS_SQS_ENDPOINT"] || 'http://localhost:9494',
      verify_checksums: false
    )
  end
end
