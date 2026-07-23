#let format-date(date, language) = if type(date) != datetime {
  date
} else if language == "de" {
  let months = (
    "Januar",
    "Februar",
    "März",
    "April",
    "Mai",
    "Juni",
    "Juli",
    "August",
    "September",
    "Oktober",
    "November",
    "Dezember",
  )
  let translated-month(dt) = months.at(dt.month() - 1)
  [#date.day(). #translated-month(date) #date.year()]
} else {
  date.display("[month repr:long] [day padding:none], [year]")
}

#let text-roboto(body) = {
  set text(font: "Roboto")
  body
}

#let text-xcharter(body) = {
  set text(font: "XCharter")
  body
}
