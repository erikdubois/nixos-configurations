import sublime
import sublime_plugin

from .prettierd_formatter import format_with_prettierd
from .prettierd_extensions import valid_extensions

def get_settings():
    return sublime.load_settings("prettierd_format.sublime-settings")

class PrettierdFormatCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        file_path = self.view.file_name()
        if not file_path:
            return

        # Get file extension
        file_extension = file_path.split('.')[-1].lower()

        # Fetch additional extensions from settings
        settings = get_settings()
        additional_extensions = settings.get("additional_extensions", [])
        all_extensions = valid_extensions + additional_extensions

        if file_extension not in all_extensions:
            return       

        # If everything is okay, format the file
        print("Formatting file:", file_path)

        current_content = self.view.substr(sublime.Region(0, self.view.size()))
        file_path = self.view.file_name()
        formatted_code = format_with_prettierd(current_content, file_path)
        
        # print("Formatted Code:", formatted_code)

        if formatted_code:
            self.view.run_command('replace_view_content', {'content': formatted_code})

class ReplaceViewContentCommand(sublime_plugin.TextCommand):
    def run(self, edit, content):
        self.view.replace(edit, sublime.Region(0, self.view.size()), content)
