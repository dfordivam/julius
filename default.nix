{
  stdenv,
  binutils,
  perl
}:

stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "julius";
  version = "4.4.2.1";

  meta = with stdenv.lib; {
    inherit version;
    description = "Toolkit for speech recognition";
    homepage = https://github.com/julius-speech/julius;
    license = licenses.asl20;
    maintainers = with stdenv.lib.maintainers; [ dfordivam ];
    platforms = platforms.x86_64;
  };

  src = ./.;

  nativeBuildInputs = [ perl ];

  configureFlags = [
      "--disable-openmp"
  ];

  #preConfigure = ''
  #  export CFLAGS="-g"
  #'';
}
