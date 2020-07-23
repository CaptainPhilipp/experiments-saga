Sagas::DestroyUser.call(user: user, new_email: new_email)

# * то же самое что и:
# saga_data = Sagas::DestroyUser.new(user: user, new_email: new_email)
# saga_data.call

# # * или:
# dto = Sagas::DestroyUser.new(user: user, new_email: new_email)
# Sagas::DestroyUser::Step1Auth.call(dto)

# # * или сделать иной вариант (Saga имеет call _только_ на уровне класса):
# dto = Sagas::DestroyUser.new(user: user, new_email: new_email)
# Sagas::DestroyUser.call(dto)
