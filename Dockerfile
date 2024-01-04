FROM ocaml/opam:debian-11-ocaml-4.12 AS builder

RUN pwd
COPY dune-project lethal_company.opam ./
RUN opam install . --deps-only

COPY bin bin
COPY lib lib
RUN opam exec -- dune build bin/lc.exe
RUN mv _build/default/bin/lc.exe lc


FROM debian:11-slim AS runner

COPY --from=builder  lc lc
ENTRYPOINT [ "./lc" ]
