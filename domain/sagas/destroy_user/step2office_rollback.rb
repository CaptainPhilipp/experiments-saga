module Sagas
  class DestroyUser < Abstract::Saga
    class Step2OfficeRollback < Abstract::Saga::Step
      def call(dto)
        do_rollback

        Step1AuthRollback.call(dto)
      end
    end
  end
end
