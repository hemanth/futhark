def make_gemfile
  [:each_default,:each_normal].flat_map { |sym|  
    Gem::Specification.to_enum(sym).map{|spec| 
    "gem \"#{spec.name}\", :version => \"#{spec.version}\""
    } 
  }
end

