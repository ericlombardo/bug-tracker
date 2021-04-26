# create users
# User.create(name: "bill", email: "bill@gmail.com", role: "dev", password: "asdfasdf")

# create programs
# Program.create(name: "MailMe", status: "Active", description: "Program to help people connect through email who might not have met otherwise", opened_date: Date.current)

# create bugs
# Bug.create(category: "security", priority: "critical", status: "pending", overview: "passwords being shown to users not logged in", description: "Users are allowed to see a master list of the users with passwords included", created: Date.current, notes: "Had this issue before, was not fixed properly", next_steps: "Try to reset change the session[:user_id] upon login to restrict the access given to the user", update_for_client: "Working through updates needed. Important to change your password for the time being.")