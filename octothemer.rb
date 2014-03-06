class OctoThemer
		def self.theme(url)
			 abort("Seems like #{url} is not a git URL") unless url.ends_wth?(".git")
			 abort("Not a octopress dir") unless Dir.exists?('.theme')
			 repo = File.basename(url).split(".").first # I know it's a URL ;)
			 system 'git clone #{url} .theme/#{repo}' or raise "I'm Sorry can't clone"
			 system 'rake install[\'#{repo}\']' or raise "Could not install via rake"
			 system 'rake generate' or raise "Could not generate via rake"
			 puts 'Enjoy your new theme #{repo}'
		end
end
