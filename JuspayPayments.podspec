Pod::Spec.new do |s|
    s.name         = "JuspayPayments"
    s.version      = "0.0.5"
    s.summary      = "Hyper visualization and payment processing."
    s.description  = <<-DESC
                    Create payment experiences for user to improve conversion and success rate.
                    DESC

    s.homepage     = 'http://example.com/'
    s.license      = { :type => "LGPL", :file => "LICENSE" }
    s.author       = { "Juspay" => "your.email@example.com" }

    s.platform     = :ios, "12.0"
    
    s.source       = { :http => 'https://public.releases.juspay.in/hyper-sdk/ios/tenant-wrappers/0.0.1/JuspayPayments.zip' }

    s.source_files = '**/*.{h,m}'
    s.resources    = ['Fuse.rb']

    s.dependency 'HyperSDK', '2.2.1.8'
end