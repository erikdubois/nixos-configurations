import subprocess
import sublime

def format_with_prettierd(content, file_path):
    cmd = ["prettierd", "--stdin-filepath", file_path]
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    formatted_code, error = process.communicate(input=content.encode('utf-8'))

    if process.returncode == 0:
        return formatted_code.decode('utf-8')
    else:
        print("Error returned by prettierd: {}".format(error.decode('utf-8')))
        sublime.error_message("Error formatting the file with prettierd.")
        return None
