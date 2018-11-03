require 'yaml'

namespace :shoryuken do
  task :initialize_queue => :environment do
    # Memo:fake_sqs用に起動時にQueueを作成する役割
    Shoryuken.configure_client do |config|
      yaml = YAML.load_file("config/shoryuken.yml")
      yaml['queues'].each do |queue|
        config.sqs_client.create_queue(queue_name: queue)
      end
    end
  end
end
