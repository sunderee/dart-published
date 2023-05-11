# Published Dart/Flutter Packages

This repository brings together all of the Dart/Flutter packages I have
published on `pub.dev`. For more information, check directories of respective
packages.

## Tips

Create a Bash script called `bumpy.sh` at the project root:

```bash
PUBY_EXECUTABLE="/path/to/puby/executable";
ANALYSIS_GEN_EXECUTABLE="/path/to/analysis-gen/executable";

for dir in */; do
    cd "$dir" || exit;
    if grep -q "flutter:" pubspec.yaml; then
        "$ANALYSIS_GEN_EXECUTABLE" --path="$(pwd)" --rule-set=flutter;
        "$PUBY_EXECUTABLE" --path="$(pwd)/pubspec.yaml" --sdk=beta --flutter --write
        flutter clean && flutter pub get;
    else
        "$ANALYSIS_GEN_EXECUTABLE" --path="$(pwd)" --rule-set=recommended;
        "$PUBY_EXECUTABLE" --path="$(pwd)/pubspec.yaml" --sdk=beta --write
        dart pub get;
    fi

    cd ..;
done
```

You'll need to configure the following tools:

1. [`puby`](https://github.com/sunderee/puby)
2. [`analysis-options-generator`](https://github.com/sunderee/analysis-options-generator)
