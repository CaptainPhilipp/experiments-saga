module Sagas
  class DestroyUser < Abstract::Saga
    class Step3Identify < Abstract::Saga::Step
      def call(dto)
        transaction do
          do_something

          finish_ok
        end
      rescue
        Step2OfficeRollback.call(dto) # * текущий шаг - транзакционный, потому откат не нужен
      end
    end
  end
end
