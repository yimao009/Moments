source 'https://cdn.cocoapods.org/'

# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'
use_frameworks!

workspace './Moments.xcworkspace'
project './Moments/Moments.xcodeproj'

def dev_pods
    pod 'SwiftLint','=0.57.0', configurations: ['Debug']
    pod 'SwiftGen','=6.6.3', configurations: ['Debug']
end

def ui_pods
    pod 'SnapKit', '=5.7.1'
    pod 'Kingfisher', '=7.12.0'
end

def test_pods
    pod 'Quick', '=7.6.2'
    pod 'Nimble', '=13.6.2'
end

target 'Moments' do
    dev_pods
    ui_pods
end

target 'MomentsTests' do
    dev_pods
    ui_pods
end

target 'MomentsUITests' do
    dev_pods
    test_pods
end


