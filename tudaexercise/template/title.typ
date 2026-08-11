#import "common/format.typ": format-date
#import "common/lang.typ": lang as l, get-locale

<<<<<<< HEAD:templates/tudaexercise/template/title.typ
/// Creates the subline content. If `info-layout` is a dict, the subline gets filled following
/// the order specified by the keys in the `info-layout` dict. If a key is present in the
/// `info` but not in `info-layout`, it does not show up in the subline.
///
/// - exercise-type (string): The type of exercise specified
/// - info (dict): The info dict containing all relevant data for the subline
/// - info-layout (dict, boolean): A dict specifying the layout of the subline. If `false`
///   the value of `#info.custom-subline` gets returned as content
/// - dict (dict): A language dict to translate standard/pre-defined strings.
/// -> Returns content filling the subline of the title
#let resolve-info-layout(exercise-type, info, info-layout) = {
  if info-layout == none {
    if "custom-subline" in info {
      return [#info.custom-subline]
    }
    return none
  }
  let title_keys = ("title", "subtitle", "author")
  let default_keys_exercise = ("term", "date", "sheet")
  let default_keys_submission = ("group", "tutor", "lecturer")
  let default_keys = if exercise-type == "exercise" {
    default_keys_exercise
  } else {
    default_keys_exercise + default_keys_submission
  }

  // filter out standard title keys
  for key in title_keys {
    _ = info.remove(key)
  }

  // Check if info actually contains any items
  if info.len() == 0 {
    return none
  }

  /// Checks if `filter-key` is present in `info-dict` and appends it to `target-list`
  /// if that is the case. Also format the value of key `date` to match the locale.
  let sort-info-to-list(target-list, info-dict, filter-key) = {
    for (info-key, info-value) in info-dict.pairs() {
      if info-key in default_keys {
        if info-key == filter-key {
          if info-key == "date" {
            target-list.push([#format-date(info-value, get-locale())])
          } else {
            target-list.push([#l(info-key) #info-value])
          }
        }
      } // This case makes sure the default submission keys don't get mistaken for custom keys
      // I.e. we don't want submission keys ("group", "tutor", "lecturer") showing up, if
      // exercise-type isn't "submission"!
      else if info-key not in default_keys_submission {
        if info-key == filter-key {
          target-list.push([#info-value])
        }
      }
    }
    return target-list
  }


  let left-items = ()
  let right-items = ()
  assert(
    exercise-type in ("exercise", "submission"),
    message: "Exercise template only supports types 'exercise' and 'submission'",
  )
  // Handle layouting, right first then default the rest to left
  if "right" in info-layout {
    for layout-key in info-layout.at("right") {
      right-items = sort-info-to-list(right-items, info, layout-key)
    }
  }
  if "left" in info-layout {
    for layout-key in info-layout.at("left") {
      left-items = sort-info-to-list(left-items, info, layout-key)
    }
  }

  grid(
    columns: (1fr, 1fr),
    align: (alignment.left, alignment.right),
    left-items.join(linebreak()), right-items.join(linebreak()),
  )
=======
#let title-info-keys = ("title", "header_title", "subtitle", "author")

#let resolve-info-layout(info-layout, info, dict) = if type(info-layout) == content {
  info-layout
} else if type(info-layout) == function {
  info-layout(info, dict)
} else {
  panic("info-layout has unsupported type. Expected content, function or none. Got " + type(info-layout))
>>>>>>> 4f0203d7e0f3968bd1dc4cfc7c733e515188f106:tudaexercise/template/title.typ
}

#let tuda-make-title(
  inner_page_margin_top,
  title_rule,
  accent_color,
  on_accent_color,
  text_color,
  colorback,
  logo_element,
  sublogo_element,
  logo_height,
  info,
  info-layout,
<<<<<<< HEAD:templates/tudaexercise/template/title.typ
  exercise-type
=======
  dict,
>>>>>>> 4f0203d7e0f3968bd1dc4cfc7c733e515188f106:tudaexercise/template/title.typ
) = {
  let text_on_accent_color = if colorback {
    on_accent_color
  } else {
    text_color
  }

  let text_inset = if colorback {
    (x: 3mm)
  } else {
    (:)
  }

  let stroke_color = if colorback {
    black
  } else {
    text_color
  }

  let stroke = (paint: stroke_color, thickness: title_rule / 2)

  v(-inner_page_margin_top + 0.2mm) // would else draw over header

  set text(fill: text_on_accent_color)

<<<<<<< HEAD:templates/tudaexercise/template/title.typ
  box(
=======
  block(
>>>>>>> 4f0203d7e0f3968bd1dc4cfc7c733e515188f106:tudaexercise/template/title.typ
    fill: if colorback { accent_color },
    width: 100%,
    outset: 0pt,
    {
      // line creates a paragraph spacing
      set par(spacing: 4pt)
      v(logo_height / 2)
      grid(
        columns: (1fr, auto),
<<<<<<< HEAD:templates/tudaexercise/template/title.typ
        box(inset: (y: 3mm), {
=======
        align: (auto, right),
        pad(y: 3mm, {
>>>>>>> 4f0203d7e0f3968bd1dc4cfc7c733e515188f106:tudaexercise/template/title.typ
          set text(font: "Roboto", weight: "bold", size: 12pt)
          grid(
            row-gutter: 1em,
            inset: text_inset,
<<<<<<< HEAD:templates/tudaexercise/template/title.typ
            if "title" in info {
              text(info.title, size: 20pt)
            },
            if "subtitle" in info {
              info.subtitle
            },
            if "author" in info {
              if type(info.author) == array {
                for author in info.author {
                  if type(author) == array {
                    [#author.at(0)
                      #text(weight: "regular", size: 0.8em)[(Mat.: #author.at(1))]]
                    linebreak()
                  } else {
                    author
                    linebreak()
=======
            ..(
              if "title" in info {
                text(info.title, size: 20pt)
              },
              if "subtitle" in info {
                info.subtitle
              },
              if "author" in info {
                if type(info.author) == array {
                  for author in info.author {
                    if type(author) == array {
                      [#author.at(0)
                        #text(weight: "regular", size: 0.8em)[(Mat.: #author.at(1))]]
                      linebreak()
                    } else {
                      author
                      linebreak()
                    }
>>>>>>> 4f0203d7e0f3968bd1dc4cfc7c733e515188f106:tudaexercise/template/title.typ
                  }
                } else {
                  info.author
                }
<<<<<<< HEAD:templates/tudaexercise/template/title.typ
              } else {
                info.author
              }
            },
=======
              },
            ).filter(x => x != none)
>>>>>>> 4f0203d7e0f3968bd1dc4cfc7c733e515188f106:tudaexercise/template/title.typ
          )

          v(.5em)
        }),
        {
          if logo_element != none {
            move(
              dx: 6mm,
              {
                set image(height: logo_height)
                logo_element
              },
            )
          }
<<<<<<< HEAD:templates/tudaexercise/template/title.typ
=======
          if sublogo_element != none {
            // 2/3 is from the tudapub example
            set image(height: logo_height * 2 / 3)
            sublogo_element
          }
>>>>>>> 4f0203d7e0f3968bd1dc4cfc7c733e515188f106:tudaexercise/template/title.typ
        },
      )
      v(6pt)
      line(length: 100%, stroke: stroke)
<<<<<<< HEAD:templates/tudaexercise/template/title.typ
      let subline-content = resolve-info-layout(exercise-type, info, info-layout)
      if subline-content != none {
        block(
          inset: text_inset,
          subline-content,
=======
      if info-layout != none and info.keys().any(x => not x in title-info-keys) {
        block(
          inset: text_inset,
          resolve-info-layout(info-layout, info, dict),
>>>>>>> 4f0203d7e0f3968bd1dc4cfc7c733e515188f106:tudaexercise/template/title.typ
        )
        line(length: 100%, stroke: stroke)
      }
    },
  )
}
