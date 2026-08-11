#let get-locale() = {
  context {
    return str(text.lang)
  }
}

/// Checks if the locale str passed is supported by this project. I.e. if strings in the
/// specified language are available.
///
/// - locale (str):
/// -> Panics, if the supplied locale str is not supported by the translations in
/// `translations.toml`
#let check-locale(locale) = {
  let dict = toml("../translations.toml")
  assert(
    locale in dict.languages,
    message: "Unknown language: '"
      + locale
      + "'. Only languages '"
      + dict.languages.join("', '", last: "' and '")
      + "'"
      + " are supported",
  )
}

/// Retrieve translation strings froWm .toml file by .
///
/// - key (str): key identifiying the string
/// -> String in the locale of the document
#let lang(key) = {
  assert(key != none, message: "No key specified")
  let dict = toml("../translations.toml")
  context {
    return dict.translations.at(key).at(text.lang)
  }
}
