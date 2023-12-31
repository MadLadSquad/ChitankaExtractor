# ChitankaExtractor
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)
[![trello](https://img.shields.io/badge/Trello-UDE-blue])](https://trello.com/b/HmfuRY2K/untitleddesktop)
[![Discord](https://img.shields.io/discord/717037253292982315.svg?label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/4wgH8ZE)

Small scripts to extract text from an archive of the [chitanka.info](https://chitanka.info) website.

## About this project
The chitanka website offers archives of their whole royalty-free bulgarian book library. This data can be useful for many applications, such as LLMs.
We needed this data in our specific format, so we made this project to automatically convert the books, which come in `.epub` format, to `.html` files.

Additinally, scripts for setting the name of the file to not be a number and further converting the `.html` files to plaintext files, where each paragraph is on
a new line.

## Usage
### Getting the data
You can download an archive of the chitanka website from [this link](https://chitanka.info/resources/archives), as a torrent. When downloading an archive, download the
`epub` version with numbers. For those who don't speak bulgarian, click the link saying `EPUB с номера`.

These torrents have a good number of seeders, but are only located in Bulgaria, so it may take significantly longer for one to download the data from a place outside of 
Europe, North Africa and the Middle East.

### Unzipping the archive
Clone this repository, enter it and unzip the archive in this folder, so that the folders containing the `epub` files are in the same directory as the scripts. To convert
the `epub` files to `html`, run `./to-html.sh` script. The script requires `pandoc` and `parallel` to be installed.

### Renaming
To rename the files with the HTML metadata, run `./rename-with-data.sh`.

### Converting to plain text
To convert to plain text format, run `./to-plain-text.sh`. This script, strips all tags, except for `<p>` and replaces headings with new lines.
