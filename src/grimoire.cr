require "libadwaita"
require "gettext"
require "log"

module Grimoire
  LOGGER = Log.for("Collision", ARGV[0]? == "--debug" ? Log::Severity::Debug : Log::Severity::Warn)

  begin
    Gettext.setlocale(Gettext::LC::ALL, "")
    Gettext.bindtextdomain(
      "com.github.polyjitter.Grimoire",
      {{
        env("GRIMOIRE_LOCALE_LOCATION").nil? ? "/usr/share/locale" : env("GRIMOIRE_LOCALE_LOCATION")
      }}
    )
    Gettext.textdomain("com.github.polyjitter.Grimoire")
  rescue ex
    LOGGER.debug { ex }
  end

  VERSION = {{read_file("./shard.yml").split("version: ")[1].split("\n")[0]}}

  Gio.register_resource("data/com.github.polyjitter.Grimoire.gresource.xml", "data")
end

require "./grimoire/views/*"

module Grimoire
  B_HL = Gtk::Builder.new_from_resource("resources/Grimoire/header_left.ui")
  B_HR = Gtk::Builder.new_from_resource("resources/Grimoire/header_right.ui")
  B_HT = Gtk::Builder.new_from_resource("resources/Grimoire/switcher.ui")

  WINDOW_BOX = Gtk::Box.new(Gtk::Orientation::Vertical, 0)
  HEADERBAR  = Adw::HeaderBar.new

  MENU_BUTTON  = Gtk::Button.cast(B_HR["menuBtn"])
  HEADER_TITLE = Adw::ViewSwitcherTitle.cast(B_HT["switcher_title"])
  BOTTOM_TABS  = Adw::ViewSwitcherBar.cast(B_HT["switcher_bar"])
  STACK        = Adw::ViewStack.cast(B_HT["stack"])

  APP = Adw::Application.new("dev.geopjr.Collision", Gio::ApplicationFlags::None)
end
