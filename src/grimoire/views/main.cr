module Grimoire
  @@main_window_id = 0_u32

  def activate(app : Adw::Application)
    window = Adw::ApplicationWindow.new(app)
    window.name = "mainWindow"
    window.title = Gettext.gettext("Grimoire")
    window.set_default_size(600, 800)
    window.width_request = 360
    window.height_request = 360
    @@main_window_id = window.id

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

  APP.startup_signal.connect(->startup(Adw::Application))
  APP.activate_signal.connect(->activate(Adw::Application))
  exit(app.run(ARGV))
end
