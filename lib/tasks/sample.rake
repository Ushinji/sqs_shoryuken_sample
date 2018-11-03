namespace :sample do
  task :enqeue => :environment do
    Shoryuken.configure_client do |config|
      sqs_client = config.sqs_client
      queue_url = sqs_client.get_queue_url(queue_name: 'sample')['queue_url']
      sqs_client.send_message(queue_url: queue_url, message_body: { "hoge": "fuge" }.to_json)
    end
  end
end
