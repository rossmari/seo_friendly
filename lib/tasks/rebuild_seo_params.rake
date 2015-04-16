namespace :seo_friendly do

  desc 'Regenerate seo params for chosen model'
  task :regenerate, [:model_name] => :environment do |t, args|

    unless args[:model_name]
      abort('WARNING! Set model name to execute this rake task')
    end

    model = args[:model_name].capitalize.constantize

    model.find_each do |instance|

      instance.update_seo_attributes
      puts "Update seo attributes for #{args[:model_name]} with ID #{instance.id}"
    end

  end

  desc 'Regenerate seo params for chosen model instance'
  task :regenerate_instance, [:model_name, :id] => :environment do |t, args|

    unless args[:model_name] || args[:id]
      abort('WARNING! Set model name and instance id to execute this rake task')
    end

    model = args[:model_name].capitalize.constantize

    instance = model.find(args[:id])
    if instance
      instance.update_seo_attributes
      puts "Update seo attributes for #{args[:model_name]} with ID #{instance.id}"
    else
      abort("Error. Can't find #{args[:model_name]} with id #{args[:id]}")

    end

  end

end