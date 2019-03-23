#!/usr/bin/env bash

# ==============================================================================
# USAGE AND NOTES - START
# ==============================================================================
#
# - Info:
#		- author : Webmasterish
#		- created: 2019-03-23
#
# ------------------------------------------------------------------------------
#
# - Command:
# 		bash firefox_new_profile.sh <profile_name> [firefox_dir]
#
# ==============================================================================
# USAGE AND NOTES - END
# ==============================================================================

set -e

# ------------------------------------------------------------------------------

# profile name required

profile_name="${1}"

if [ -z "${profile_name}" ]; then

	echo "firefox profile name required"

	exit 1

fi

# ------------------------------------------------------------------------------

# set directories

firefox_dir="${2:-/media/data/firefox}"
backups_dir="${firefox_dir}/backups"
profile_dir="${firefox_dir}/profiles/${profile_name}"

# ------------------------------------------------------------------------------

# create profile

echo
echo "Creating: '${profile_name}' profile"

mkdir -p "${profile_dir}" && \
firefox -CreateProfile "${profile_name} ${profile_dir}"

# ------------------------------------------------------------------------------

# auto backup bookmarks on close/exit

bookmarks_file="${backups_dir}/bookmarks/latest/${profile_name}_bookmarks.html"
user_file="${profile_dir}/user.js"

echo
echo "Creating: '${user_file}'"

if [ -f "${user_file}" ]; then

	echo "Already exists: '${user_file}'"

else

cat >"${user_file}" <<EOL
// custom settings


// auto export bookmarks on close - added on $(date '+%Y-%m-%d %H:%M:%S')
user_pref("browser.bookmarks.autoExportHTML", true);
user_pref("browser.bookmarks.file", "${bookmarks_file}");
EOL

	echo "Success: created '${user_file}'"

fi

# ------------------------------------------------------------------------------

# display how to run it - can be used as a desktop shortcut/launcher command

echo
echo "Command to run it: firefox -P ${profile_name} -no-remote"
echo

# ------------------------------------------------------------------------------

# @consider creating a desktop shortcut/launcher
