module Sagas
  class DestroyUser < Abstract::Saga
    class Step3Identify < Abstract::Saga::Step
      def call(dto)
        do_something

        finish_ok
      rescue
        Step2OfficeRollback.call(dto) # * текущий шаг транзакционный и откат не нужен
      end
    end
  end
end
