# More documentation about how to customize your build
# can be found here:
# https://docs.fastlane.tools
fastlane_version "1.109.0"

# This value helps us track success metrics for Fastfiles
# we automatically generate. Feel free to remove this line
# once you get things running smoothly!
generated_fastfile_id "80d7527e-b143-4405-9e88-630aeb7805ef"

default_platform :ios

# Fastfile actions accept additional configuration, but
# don't worry, fastlane will prompt you for required
# info which you can add here later
lane :beta do
  increment_build_number

  # build your iOS app
  gym(
    # scheme: “Nymeria”
  )

  # upload to Testflight
  pilot(skip_waiting_for_build_processing: true)
end
