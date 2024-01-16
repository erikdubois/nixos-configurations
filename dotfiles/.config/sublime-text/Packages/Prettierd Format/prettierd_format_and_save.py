import subprocess
import sublime
import sublime_plugin
import os
import re

from .prettierd_formatter import format_with_prettierd
from .prettierd_extensions import valid_extensions

def get_settings():
    return sublime.load_settings("prettierd_format.sublime-settings")

class PrettierdFormatEventListener(sublime_plugin.EventListener):

    def on_pre_save(self, view):
        settings = get_settings()
        format_on_save = settings.get("format_on_save", True)

        if not format_on_save:
            return

        # If skip_formatting is set on the view, reset it and exit early.
        if view.settings().get("skip_formatting", False):
            view.settings().erase("skip_formatting")
            return

        file_path = view.file_name()
        if not file_path:
            return

        file_extension = file_path.split('.')[-1].lower()

        disabled_extensions_on_save = settings.get("disabled_extensions_on_save", [])
        disabled_directories_on_save = settings.get("disabled_directories_on_save", [])
        
        additional_extensions = settings.get("additional_extensions", [])

        if file_extension in disabled_extensions_on_save:
            return

        # Add the plugin directory to disabled directories
        plugin_dir = os.path.dirname(os.path.realpath(__file__))
        disabled_directories_on_save.append(plugin_dir)

        # Check if the file belongs to a disabled directory
        for directory_pattern in disabled_directories_on_save:
            # Convert wildcard pattern to regex pattern
            regex_pattern = re.escape(directory_pattern).replace("\\*", ".*")
            if re.search(regex_pattern, file_path):
                return

        # Check against all extensions
        all_extensions = valid_extensions + additional_extensions

        if file_extension in all_extensions:
            current_content = view.substr(sublime.Region(0, view.size()))
            formatted_code = format_with_prettierd(current_content, file_path)
            if formatted_code:
                view.run_command('replace_view_content', {'content': formatted_code})

class ReplaceViewContentCommand(sublime_plugin.TextCommand):
    def run(self, edit, content):
        self.view.replace(edit, sublime.Region(0, self.view.size()), content)
