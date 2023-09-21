player1 = Player.create!(
    name: "John", 
    email: "john@example.com", 
    password: "password", 
    password_confirmation: "password")
player2 = Player.create!(
    name: "Jane", 
    email: "jane@example.com", 
    password: "password", 
    password_confirmation: "password")
player3 = Player.create!(
    name: "Joe", 
    email: "joe@example.com", 
    password: "password", 
    password_confirmation: "password")
clay = Player.create!(
    name: "Clay", 
    email: "clay@example.com", 
    password: "password", 
    password_confirmation: "password",
    role: :admin)
