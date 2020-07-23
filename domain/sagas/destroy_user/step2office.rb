module Sagas
  class DestroyUser < Abstract::Saga
    class Step2Office < Abstract::Saga::Stepe
      def call(dto)
        do_something

        Step3Identify.call(dto)
      rescue
        Step2OfficeRollback.call(dto)
      end
    end
  end
end
