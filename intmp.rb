def in_tmp
  path = File.expand_path "#{Dir.tmpdir}/#{Time.now.to_i}#{rand(1000)}/"
  FileUtils.mkdir_p( path )
  yield( path )
ensure
  # This ensures temp dir removal.
  FileUtils.rm_rf( path ) if File.exists?( path )
end

#The above method can be used as :

in_tmp do |tmpdir|
  puts "In tmp dir: #{tmpdir}"
end
