# frozen_string_literal: true


class User
  def :hello
    'hello from User'
  end
  def method_missing(name, args)
    "method name is #{name}, parameters: #{args}"
  end
end

user = User.new
puts user.hello
puts'_'* 30
puts user.method_missing('343',19)