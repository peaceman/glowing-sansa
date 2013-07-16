namespace :import do
  desc "Import lodges from afuamvd json"
  task :from_afuamvd, [:file] => :environment do |task, args|
    ::File.open(args.file, 'r') do |f|
      data = ::JSON.load(f)
      data.each do |lodge_info|
        lodge = Lodge.find_or_initialize_by_name(lodge_info['post_title'])

        regex = /Matrikelnummer\s+(\d+)/
        match = regex.match(lodge_info['post_content'])
        unless match.nil?
          registration_number = match[1]
        else
          registration_number = ''
        end

        result = lodge.update(
            description: lodge_info['description'],
            street: [lodge_info['address'], lodge_info['address2']].join(' '),
            city: lodge_info['city'],
            country: lodge_info['country'],
            phone_number: lodge_info['phone'],
            site_url: lodge_info['url'],
            grand_lodge_id: 1,
            registration_number: registration_number,
            contact_mail: lodge_info['email'],
            published: true
        )

        unless result
          puts "Errors for #{lodge_info['post_title']}"
          puts lodge.errors.full_messages
        end

        sleep 1
      end
    end
  end

end
