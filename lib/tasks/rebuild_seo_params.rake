namespace :seo_friendly do

  desc 'Regenerate seo params for chosen model'
  task :regenerate, [:model_name] => :environment do |t, args|

    unless args[:model_name]
      abort('WARNING! Set model name parametr to execute this rake task')
    end

    model = args[:model_name].capitalize.constantize

    model.find_each do |instance|

      instance.update_seo_attributes
      puts "Update seo attributes for #{instance.class.name} with ID #{instance.id}"
    end

  end

end