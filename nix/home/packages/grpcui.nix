{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  version = "0.2.0";
  name = "grpcui-${version}";

  src = fetchFromGitHub {
    owner = "fullstorydev";
    repo = "grpcui";
    rev = "v${version}";
    sha256 = "0h4xpyd6phj3svjzxh6nd98ym81x4a2v6jxcnqj4psjinwd4p3md";
  };
  
  modSha256 = "1hsq2gfhscl4wvld346xrp018sb1g3xvga3d8chlbgw93rmhhszb";

  meta = with lib; {
    description = "An interactive web UI for gRPC, along the lines of postman";
    homepage = https://github.com/fullstorydev/grpcui;
    license = licenses.mit;
    maintainers = with maintainers; [ pradyuman ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
