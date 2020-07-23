module Abstract
  class Saga
    class Step
      attr_reader :dto

      include Shoryuken::Worker

      class << self
        # ! возможно случайно вызвать в шаге, что приведёт к рекурсии
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

      # ? возможно этот метод можно сделать метамагией
      # ?   так как Сага этого Шага и так известна
      # @ abstract
      def dto_class
        raise NotImplementedError
      end
    end
  end
end
