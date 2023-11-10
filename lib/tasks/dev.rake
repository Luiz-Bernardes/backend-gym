namespace :dev do
  desc "Development environment setup"
  task setup: :environment do
    if Rails.env.development?
      spinner('Dropping database ...') { %x(rails db:drop) }
      spinner('Creating database ...') { %x(rails db:create) }
      spinner('Migrating database ...') { %x(rails db:migrate) }
      spinner('Seeding database ...') { %x(rails db:seed) }
    else
      puts "Invalid, you are not in development environment!"
    end
  end

  def spinner message, end_message = 'Done!'
    spinner = TTY::Spinner.new("[:spinner] #{message}")
    spinner.auto_spin
    yield
    spinner.success("(#{end_message})")
  end
end
