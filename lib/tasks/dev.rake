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

  task test: :environment do
    if Rails.env.development?
      spinner_pulse('Testing models ...') { puts %x(rspec spec/models/) }
      spinner_pulse('Testing controllers ...') { puts %x(rspec spec/controllers/ ) }
      spinner_pulse('Testing requests ...') { puts %x(rspec spec/requests/) }
      spinner_pulse('Cleaning logs ...') { puts %x(rails dev:clean_logs) }
    else
      puts "Invalid, you are not in development environment!"
    end
  end

  task clean_logs: :environment do
    if Rails.env.development?
      User.all.map(&:id).each do |user_id|
        file_path = "app/logs/activities_user_#{user_id}.txt"
        begin
          File.open(file_path, 'r') do |file|
            File.delete(file)
          end
        rescue Errno::ENOENT
        end
      end
    else
      puts "Invalid, you are not in development environment!"
    end
  end

  def spinner message, end_message = 'Done!'
    spinner = TTY::Spinner.new("[:spinner] #{message}")
    spinner.auto_spin # Automatic animation with default interval
    yield
    spinner.success("(#{end_message})")
  end

  def spinner_pulse message, end_message = 'Done!'
    puts "\n"
    spinner = TTY::Spinner.new("[:spinner] #{message}", format: :pulse_2)
    spinner.auto_spin # Automatic animation with default interval
    yield
    spinner.stop("(#{end_message})") # Stop animation
    puts "\n"
  end
end
