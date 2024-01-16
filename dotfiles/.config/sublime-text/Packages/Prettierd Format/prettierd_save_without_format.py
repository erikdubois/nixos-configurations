import sublime
import sublime_plugin

class PrettierdSaveWithoutFormatCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        self.view.settings().set("skip_formatting", True)
        self.view.run_command("save")