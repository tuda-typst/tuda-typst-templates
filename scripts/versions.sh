not_tudabeamer_2023_version=$(sed -n 's/version = "\(.*\)"/\1/p' templates/not-tudabeamer-2023/typst.toml)
athena_tu_darmstadt_exercise_version=$(sed -n 's/version = "\(.*\)"/\1/p' templates/tudaexercise/typst.toml)
athena_tu_darmstadt_thesis_version=$(sed -n 's/version = "\(.*\)"/\1/p' ./templates/tudapub/typst.toml)
