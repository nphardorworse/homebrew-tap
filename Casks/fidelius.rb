cask "fidelius" do
  version "1.0.4"
  sha256 "b4cb6d691a9a08721558a4609eaffa4d3d36eb992a1b39666fe321d34e90ee4b"

  url "https://downloads.blisslabs.dev/fidelius/Fidelius-#{version}.dmg"
  name "Fidelius"
  desc "Keychain secrets manager for developers and AI coding agents"
  homepage "https://fidelius.blisslabs.dev/"

  livecheck do
    url "https://downloads.blisslabs.dev/fidelius/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Fidelius.app"

  zap trash: [
    "~/Library/Application Support/Fidelius",
    "~/Library/Caches/dev.blisslabs.fidelius",
    "~/Library/HTTPStorages/dev.blisslabs.fidelius",
    "~/Library/Preferences/dev.blisslabs.fidelius.plist",
    "~/Library/Saved Application State/dev.blisslabs.fidelius.savedState",
    "~/Library/WebKit/dev.blisslabs.fidelius",
  ]

  caveats <<~EOS
    To use accio in a terminal, open Fidelius and choose Setup > Install accio Command.
    Your keys stay in the Keychain after uninstalling. So do the accio link in
    ~/.local/bin, the accio lines in your shell startup file, and the Fidelius
    section in your agents' instruction files.
  EOS
end
