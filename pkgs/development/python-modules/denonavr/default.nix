{ lib, buildPythonPackage, fetchFromGitHub, isPy27, requests, netifaces
, pytestCheckHook, testtools, requests-mock }:

buildPythonPackage rec {
  pname = "denonavr";
  version = "0.9.9";
  disabled = isPy27;

  src = fetchFromGitHub {
    owner = "scarface-4711";
    repo = "denonavr";
    rev = version;
    sha256 = "08zh8rdadmxcgr707if6g5k5j2xz21s6jrn4kxh1c7xqpgdfggd9";
  };

  propagatedBuildInputs = [
    requests
    netifaces
  ];

  checkInputs = [
    pytestCheckHook
    testtools
    requests-mock
  ];

  meta = with lib; {
    homepage = "https://github.com/scarface-4711/denonavr";
    description = "Automation Library for Denon AVR receivers.";
    license = licenses.mit;
    maintainers = with maintainers; [ colemickens ];
  };
}
