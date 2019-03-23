# Firefox new profile

> Quick way to create a firefox profile in a custom location


## Usage

```sh
$ bash firefox_new_profile.sh <profile_name> [firefox_dir]
```

### Add as bash alias

```sh
# make it executable

$ chmod +x /path/to/firefox_new_profile.sh

# ------------------------------------------------------------------------------

# add to .bash_aliases

$ cat >> "${HOME}/.bash_aliases" <<EOL

# custom alias - added on $(date '+%Y-%m-%d %H:%M:%S')
alias ffnew='/path/to/firefox_new_profile.sh'
EOL

# ------------------------------------------------------------------------------

# use it as follows

ffnew <profile_name> [firefox_dir]

```



## License

MIT © [webmasterish](https://webmasterish.com)
