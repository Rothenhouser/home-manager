{ lib }:

rec {
  # Produces a Fish shell global variable export statement.
  export = n: v: ''set -gx ${n} "${toString v}"'';

  # Given an attribute set containing shell variable names and their
  # assignment, this function produces a string containing an export
  # statement for each set entry.
  exportAll = vars: lib.concatStringsSep "\n" (lib.mapAttrsToList export vars);
}
