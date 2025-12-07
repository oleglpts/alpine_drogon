# alpine_drogon

- A base image for building applications based on the Drogon framework
(see https://drogon.org/)
- Drogon framework local installation for development
- Some Drogon logger specific patch
- Build: \
    `$ docker login && docker build --build-arg alpine_version={apline_version} --build-arg drogon_version={drogon_version}` \\\
             `--build-arg trantor_version={trantor_version} -f Dockerfile --provenance "mode=max" --sbom=true --no-cache` \\\
             `--push -t slacktomcat/alpine_drogon:{apline_version}-{drogon_version}-{trantor_version}-{revision} .`
- Install cosign v2.6.1 for signing and check signature
- Cleaning image: \
  `$ cosign clean slacktomcat/alpine_drogon@{index_digest}`
- Image signing: \
  `$ docker login && cosign sign --key ~/.cosign/cosign.key slacktomcat/alpine_drogon@{index_digest}`
- Verify signature: \
  `$ cosign verify --key ~/.cosign/cosign.pub slacktomcat/alpine_drogon@{index_digest} | jq`
- Create BOM attestation for docker < 29.0:
  `$ syft slacktomcat/alpine_drogon@{index_digest} -o spdx-json > ./att.json`
  `$ docker login && cosign attest --type spdxjson --predicate ./att.json --key ~/.cosign/cosign.key` \\\
         `slacktomcat/alpine_drogon@index_digest`
- Create Provenance attestation for docker < 29.0: \
  `$ cosign attest --key ~/.cosign/cosign.key --type slsaprovenance --predicate provenance.json` \\\
         `slacktomcat/alpine_drogon@{index_digest}`
- Checking image tree: \
  `$ cosign tree slacktomcat/alpine_drogon@{index_digest}`
- Verify attestations signatures: \
  `$ cosign download attestation slacktomcat/alpine_drogon@{index_digest}  |  jq -r .payload | base64 -d  | jq .predicate` \
  `$ cosign verify-attestation --key ~/.cosign/cosign.pub --type spdxjson slacktomcat/alpine_drogon@{index_digest}  |`  \\\
         `jq -r .payload |  base64 -d | jq .predicate` \
  `cosign verify-attestation --key ~/.cosign/cosign.pub --type slsaprovenance slacktomcat/alpine_drogon@{index_digest}  | jq`
- See https://edu.chainguard.dev/open-source/sigstore/cosign/how-to-sign-an-sbom-with-cosign/
