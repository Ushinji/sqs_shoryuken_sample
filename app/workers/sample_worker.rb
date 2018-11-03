class CampaineWorker
  include Shoryuken::Worker

  shoryuken_options queue: 'sample', auto_delete: true, body_parser: :json

  def perform(sqs_msg, body)
    puts sqs_msg, body
  end
end
