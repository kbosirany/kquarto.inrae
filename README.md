# kquarto.inrae

Charte graphique INRAE sous forme d'extension Quarto, pour remplacer les
templates `inrae` et `inrae-presentation` du package [`kquarto.r`](https://github.com/kbosirany/kquarto.r).

**État : les cinq formats se rendent** avec Quarto 1.11.9 (livre HTML, Typst
et LaTeX ; diapositives reveal.js et Beamer). Les PDF ont été contrôlés à
l'œil ; les diapositives reveal.js seulement dans leur HTML (fonds de titre
et de fin présents), pas dans un navigateur.

## Contenu

- `_extensions/kbosirany/inrae/` : la charte, en un seul exemplaire (couleurs, polices,
  logos, masque des diapositives). Elle fournit cinq formats :
  `inrae-html`, `inrae-typst`, `inrae-pdf`, `inrae-revealjs`, `inrae-beamer`.
- `exemples/livre/` : un livre HTML + PDF Typst.
- `exemples/diapos/` : une présentation reveal.js.

Dans les deux exemples, `_extensions` est un lien symbolique vers celui de la
racine, pour les rendre sur place.

## Essayer

```bash
quarto render exemples/livre
quarto render exemples/diapos/diapos.qmd
```

## Usage visé, une fois le dépôt publié

```bash
# ajouter la charte à un projet existant
quarto add kbosirany/kquarto.inrae

# la mettre à jour quand la charte change
quarto update extension kbosirany/inrae
```

Ou partir d'un modèle, dans un dossier vide :

```bash
quarto use template kbosirany/kquarto.inrae/exemples/livre
quarto use template kbosirany/kquarto.inrae/exemples/diapos
```

L'extension est installée dans `_extensions/kbosirany/inrae/` : c'est le
chemin du logo et du favicon dans le `_quarto.yml` du livre.

Puis, dans le document ou le `_quarto.yml` : `format: inrae-html` (ou un des
quatre autres).

## Ce que cela remplace dans kquarto.r

| kquarto.r | Avec l'extension |
|---|---|
| `create_book(template = "inrae")` | `quarto use template kbosirany/kquarto.inrae/exemples/livre` |
| `create_presentation(template = "inrae-presentation")` | un `.qmd` avec `format: inrae-revealjs` |
| `create_book(formats = "typst")`, `add_pdf_download()` | une ligne `inrae-typst: default` dans `_quarto.yml` |
| `create_template_*()`, `list_templates_*()`, `remove_template_*()`, `template_dir()`, `shared:` | `quarto add` / `quarto update` |
| copie du SCSS, des logos et du `.tex` dans chaque livre | rien n'est copié : tout reste dans `_extensions/kbosirany/inrae/` |

## Constaté au rendu

- Le format personnalisé fonctionne dans un projet `book`.
- Les chemins de `_extension.yml` (thèmes, en-têtes, fond de la diapositive
  de titre) sont résolus depuis le dossier de l'extension.
- `fin-inrae.lua` pose bien le fond vert sur `{.fin-inrae}`.
- `inrae-pdf` et `inrae-beamer` laissent une copie de `logo-inrae.png` à côté
  du document (`format-resources`) : à mettre dans le `.gitignore`.
- Rendre un seul format d'un livre (`--to inrae-pdf`) vide `_book/` : rendre
  tous les formats d'un coup, sans `--to`.
- Typst prévient que Avenir Next Pro, Calibri et Raleway manquent sur cette
  machine et utilise Liberation Sans, comme le template actuel.

## Reste à vérifier

1. `_brand.yml` reste un fichier du projet (8 lignes). Le fournir depuis
   l'extension n'a pas été essayé.
2. L'aspect des diapositives reveal.js dans un navigateur.
