FROM texlive/texlive AS development

RUN apt update
RUN apt install inkscape -y

WORKDIR /docs

COPY docs .

ENTRYPOINT [ "pdflatex", "--shell-escape", "main.tex", "&&", "biber", "main", "&&", "pdflatex", "--shell-escape", "main.tex" ]
