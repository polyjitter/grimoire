require "libadwaita"

module Grimoire
  VERSION = "0.1.0"

  app = Adw::Application.new("com.github.polyjitter.Grimoire", Gio::ApplicationFlags::None)
  count = 0

  app.activate_signal.connect do
    window = Adw::ApplicationWindow.new(app)
    window.title = "Grimoire"
    window.set_default_size(600, 800)

    root = Gtk::Box.new(Gtk::Orientation::Vertical, 0)
    header = Adw::HeaderBar.new
    label = Gtk::Label.new

    box = Gtk::Box.new(Gtk::Orientation::Vertical, 0)

    box.halign = Gtk::Align::Center
    box.valign = Gtk::Align::Center
    box.hexpand = true
    box.vexpand = true

    box.append(label)
    # box.append(button)

    root.append(header)
    root.append(box)

    window.content = root
    window.present
  end

  exit(app.run(ARGV))
end
