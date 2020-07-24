module Abstract
  class Saga
    class Step
      attr_reader :dto

      include Shoryuken::Worker

      def self.call(dto)
        AwsSns::Sender.call(topic_key: topic_key, message: JSON[dto.to_h])
      end

      # * метод для `Shoryuken::Worker`
      def perform(_sqs_message, body)
        data = JSON[body]
        dto  = dto_class.wrap(data)
        call(dto)
      end

      # ! лучше сделать метамагией, так как Сага этого Шага известна из неймспейса
      # @ abstract
      def dto_class
        raise NotImplementedError
      end

      # ! лучше сделать метамагией, так как ключ можно сделать из имени класса
      def topic_key
        raise NotImplementedError
      end
    end
  end
end
