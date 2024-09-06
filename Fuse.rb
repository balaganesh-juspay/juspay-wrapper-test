require 'json'

tenantParams = {
    resource_url: "https://public.releases.juspay.in/hyper/bundles/in.juspay.merchants/%@client_id/ios/release/assets.zip",
    sandbox_resource_url: "https://sandbox.assets.juspay.in/hyper/bundles/in.juspay.merchants/%@client_id/ios/release/assets.zip",
    versioned_resource_url: "https://assets.juspay.in/hyper-sdk/in/juspay/merchants/hyper.assets.%@client_id/%@asset_version/hyper.assets.%@client_id-%@asset_version.zip",
    merchant_config_json: "MerchantConfig.json",
    tenant_id: "juspay"
}

system("ruby", "./Pods/HyperSDK/Fuse.rb", "true", "xcframework", JSON.generate(tenantParams))