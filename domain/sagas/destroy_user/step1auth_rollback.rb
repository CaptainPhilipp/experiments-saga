module Sagas
  class DestroyUser < Abstract::Saga
    class Step1AuthRollback < Abstract::Saga::Step
      def call(dto)
        do_rollback

        finish_bad
      end
    end
  end
end
