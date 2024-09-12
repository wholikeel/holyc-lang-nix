{
  stdenv,
  fetchFromGitHub,
  ...
}:
stdenv.mkDerivation {
  name = "holyc-lang";
  
  src = fetchFromGitHub {
    owner = "Jamesbarford";
    repo = "holyc-lang";
    rev = "beta-v0.0.3";
    hash = "sha256-+3Vrg7zMgPO4PTiYJxhIUMnM+MKzBj8mTEoJD4JR7V0=";
  };

  installPhase = ''
    mkdir -p $out/bin
    gcc -o hcc ./src/*.o -lm
    cp ./hcc $out/bin/
  '';
}
