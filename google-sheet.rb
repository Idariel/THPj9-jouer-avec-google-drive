require "google_drive"

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
# You can construct a session object by:
session = GoogleDrive::Session.from_config("config.json")
# This code will prompt the credential via command line for the first time and save it to config.json. For the second time and later, it uses the saved credential without prompt.

# Get the spreadsheet by its title
ws = spreadsheet = session.spreadsheet_by_title("Test Ruby Perso").worksheets.first
# spreadsheet = session.spreadsheet_by_title("Test Ruby Perso")
# ws = spreadsheet.worksheets.first ou .worksheets[0]

# First worksheet of
# ws = session.spreadsheet_by_key("ccc?1k06VahUI_BInhsw63cPVTUwuoYlq0B7s97dEurnbkPo").worksheets[0]

# Gets content of A2 cell.
p ws[2, 1]

# Changes content of cells.
# Changes are not sent to the server until you call ws.save().
ws[2, 1] = "Mairie"
ws[2, 2] = "Email"
ws.save


# Reloads the worksheet to get changes by other clients.
ws.reload
