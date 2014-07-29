fs   = require 'fs'
path = require 'path'

SORTING_FOLDER = path.join __dirname, 'sorting'

keyOnName = (acc, fileName) ->
  acc[fileName.split('.')[0]] = require(path.join(SORTING_FOLDER, fileName)).sort
  acc

isFolder = (name) -> fs.statSync(path.join(__dirname, name)).isDirectory()

sorters = fs.readdirSync(SORTING_FOLDER).reduce keyOnName, {}

module.exports = sorters
