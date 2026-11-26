# Homebrew cask for LiteNotch. LiteNotch's release workflow
# (tangnatta/LiteNotch, .github/workflows/release.yml) rewrites `version` and `sha256` for every
# tagged release, so edit the rest by hand and leave those two to CI.
cask "litenotch" do
  version "0.2.5"
  sha256 "b64c97b96568d8f58ce344df0af86fa442e63bc7f62ed45e6c21a168c0de12c8"

  url "https://github.com/tangnatta/LiteNotch/releases/download/v#{version}/LiteNotch-#{version}-arm64.zip"
  name "LiteNotch"
  desc "Lightweight notch utility for focus, media, clipboard and Claude Code"
  homepage "https://github.com/tangnatta/LiteNotch"

  # Every Mac with a notch is Apple silicon.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "LiteNotch.app"
  binary "#{appdir}/LiteNotch.app/Contents/Helpers/litenotch"

  # The app is ad-hoc signed, not notarized: without this, Gatekeeper refuses
  # to open a downloaded copy. Homebrew 7.0.16 deprecated the `postflight`
  # block for declarative steps; older Homebrew only knows the block, so both
  # are here until the steps form is old enough to rely on.
  if respond_to?(:postflight_steps)
    postflight_steps do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/LiteNotch.app"]
    end
  else
    postflight do
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{appdir}/LiteNotch.app"]
    end
  end

  uninstall quit: "dev.litenotch.app"

  zap trash: "~/Library/Application Support/LiteNotch"

  caveats <<~EOS
    LiteNotch is not notarized yet. The cask removes the quarantine flag so it
    can open; if you prefer, build it from source instead (see the README).

    To show Claude Code approvals in the notch:
      litenotch hooks install
  EOS
end
