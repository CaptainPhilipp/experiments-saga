module Abstract
  class Saga
    class Step
      attr_reader :dto

      include Shoryuken::Worker

      class << self
        def call(dto)
          AwsSns::Sender.call(topic_key: topic_key, message: JSON[dto.to_h])
        end
      end

      # * from `Shoryuken::Worker`
      def perform(_sqs_message, body)
        data = JSON[body]
        dto  = dto_class.wrap(data)
        call(dto)
      end
    end
  end
end
