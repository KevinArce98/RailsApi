class AuthenticateUser
    prepend SimpleCommand
  
    def initialize(username, password)
        #this is where parameters are taken when the command is called
      @username = username
      @password = password
    end
  
    def call
        #this is where the result gets returned
      JsonWebToken.encode(user_id: user.id, user_role: user.isAdmin, username: user.username) if user
    end
  
    private
  
    attr_accessor :username, :password
  
    def user
      user = User.find_by username: @username
      return user if user && user.authenticate(password)
  
      errors.add :user_authentication, 'invalid credentials'
      nil
    end
  end