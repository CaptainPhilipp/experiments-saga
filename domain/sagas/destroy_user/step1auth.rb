module Sagas
  class DestroyUser < Abstract::Saga
    class Step1Auth < Abstract::Saga::Step
      def call(dto)
        do_something

        Step2Office.call(dto)
      rescue
        Step1AuthRollback.call(dto)
      end
    end
  end
end
