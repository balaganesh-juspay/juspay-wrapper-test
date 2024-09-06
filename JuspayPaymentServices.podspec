Pod::Spec.new do |s|
    s.name         = "JuspayPaymentServices"
    s.version      = "0.0.1"
    s.summary      = "Hyper visualization and payment processing."
    s.description  = <<-DESC
                    Create payment experiences for user to improve conversion and success rate.
                    DESC

    s.homepage     = 'http://example.com/'
    s.license      = { :type => "LGPL", :file => "LICENSE" }
    s.author       = { "Juspay" => "your.email@example.com" }

    s.platform     = :ios, "12.0"
    
    s.source       = { :git => "https://github.com/balaganesh-juspay/juspay-wrapper-test.git"}

    s.source_files = '**/*.{h,m}'
    # s.resources    = ['Fuse.rb']

    s.dependency 'HyperSDK', '2.2.1.7'
end