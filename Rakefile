
desc "Remove everything!"
task :clean do
  rm_rf "docs"
end

desc "Unpack the website zip file"
task :unpack_website do
  mkdir_p "website"
  puts "Unpacking website.zip..."
  sh("unzip -qo tmp/website.zip -d docs")
  puts "Unpacking complete."
end

desc "Set up extra files for the website"
task :setup_extra_files do
  extra_files_dir = "extra-files"
  docs_dir = "docs"

  if File.directory?(extra_files_dir)
    cp_r(Dir.glob("#{extra_files_dir}/*"), docs_dir)
    puts "Extra files copied from #{extra_files_dir} to #{docs_dir}."
  else
    puts "Directory #{extra_files_dir} does not exist. Skipping extra files setup."
  end
end

task all: [:clean, :unpack_website, :setup_extra_files]
