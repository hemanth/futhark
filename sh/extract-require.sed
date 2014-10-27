# Extract the deps from a nodejs file. use sed -Ef extract-required datafile
/\n/!s/require\((['"])[^'"]+\1\)/\n&\n/g; /^require\((['"])([^'"]+)\1\)/ { s//\2/; P }; D
