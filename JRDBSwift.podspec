Pod::Spec.new do |s|

    s.name                  = "JRDBSwift"
    s.version               = "1.2.0"
    s.summary               = "The light packing of fmdb for my self"

    s.homepage              = "https://github.com/scubers/JRDBSwift"
    s.license               = { :type => "MIT", :file => "LICENSE" }

    s.author                = { "jrwong" => "jr-wong@qq.com" }
    s.ios.deployment_target = "8.0"
    s.source                = { :git => "https://github.com/scubers/JRDBSwift.git", :tag => "#{s.version}" }


    s.source_files          = "JRDBSwift/classes/**/*.swift"

    s.dependency 'JRDB'

end
