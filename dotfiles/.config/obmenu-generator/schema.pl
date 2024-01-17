#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(xml data)},
    begin_cat: beginning of a category              {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                      {end_cat => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [
	{sep => "ArcoLinux"},
    #          COMMAND                 LABEL                ICON
    {item => ['alacritty',                                 'Terminal',          'terminal']},
    {item => ['exo-open --launch FileManager',                                      'File Manager',      'file-manager']},
    {item => ['exo-open --launch WebBrowser ',                                      'Web Browser',       'webbrowser-app']},
    {sep => undef},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['other',       'Other',       'applications-other']},
    {cat => ['settings',    'Settings',    'gnome-settings']},
    {cat => ['system',      'System',      'applications-system']},

    {sep => undef},

    {pipe => ['am-conky-pipemenu',  'Conky',        'conky']},

    {begin_cat => ['Preferences', 'theme']},

        {item => ['nitrogen',                               'Nitrogen',         'nitrogen']},
        {item => ['lxappearance',                           'Lxappearance',             'theme']},
        {item => ['system-config-printer',                  'Printing',                 'printer']},
        {item => ['xfce4-settings-manager',                 'Xfce4 Settings Manager',   'preferences-desktop']},
        {sep => undef},

        {pipe => ['am-compositor',      'Compositor',      'compton']},
        {begin_cat => ['Openbox', 'openbox']},
            {item => ['obconf',                                 'GUI Config Tool',               'theme']},
            {item => ['openbox --restart',                      'Restart Openbox',               'openbox']},
            {item => ['openbox --reconfigure',                  'Reconfigure Openbox',           'openbox']},
        {end_cat => undef},
        {sep => undef},

    	{pipe => ['am-kb-pipemenu',                'Display Keybinds',                  'cs-keyboard']},

    	{begin_cat => ['Obmenu-Generator', 'menu-editor']},
        	{item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-source']},
        	{item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-source']},
        	{sep  => undef},
        	{item => ['obmenu-generator -p',       'Generate a pipe menu',              'menu-editor']},
        	{item => ['obmenu-generator -s -c',    'Generate a static menu',            'menu-editor']},
       	 	{item => ['obmenu-generator -p -i',    'Generate a pipe menu with icons',   'menu-editor']},
        	{item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons', 'menu-editor']},
       	 	{sep  => undef},
        	{item => ['obmenu-generator -d',       'Refresh Icon Set',                  'gtk-refresh']},
     	{end_cat => undef},
     	{sep  => undef},
        {item => ['sh ~/.config/polybar/launch.sh',       'Reload Polybar',         'gtk-refresh']},

    {end_cat => undef},

    {sep => undef},
    {item => ['archlinux-logout',                      'Lock Screen',                       'lock']},
    {item => ['archlinux-logout',                      'Exit Openbox',                      'exit']},

]
