Sagas::DestroyUser.call(user: user, new_email: new_email)

# * то же самое что и:
# dto = Sagas::DestroyUser.new(user: user, new_email: new_email)
# Sagas::DestroyUser::Step1Auth.call(dto)
