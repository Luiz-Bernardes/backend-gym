namespace :dev do
  desc "Development environment setup"
  task setup: :environment do
    spinner('Dropping database ...', 'Done!') { %x(rails db:drop) }
    spinner('Creating database ...', 'Done!') { %x(rails db:create) }
    spinner('Migrating database ...', 'Done!') { %x(rails db:migrate) }
    spinner('Seeding database ...', 'Done!') { %x(rails db:seed) }
  end

  def spinner message, end_message
    spinner = TTY::Spinner.new("[:spinner] #{message}")
    spinner.auto_spin
    yield
    spinner.success("(#{end_message})")
  end

end
