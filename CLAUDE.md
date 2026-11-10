# kquarto.inrae — contexte du projet

Ce fichier est lu automatiquement par Claude Code à l'ouverture du dépôt. Il
résume ce que le code et l'historique git ne disent pas. Le tenir à jour
quand une décision change.

## But

Charte graphique INRAE en extension Quarto : cinq formats (`inrae-html`,
`inrae-typst`, `inrae-pdf`, `inrae-revealjs`, `inrae-beamer`) et deux
modèles de départ (`exemples/livre`, `exemples/diapos`).

Elle a vocation à remplacer les templates `inrae` et `inrae-presentation`
du package R `kbosirany/kquarto.r`, d'où viennent les fichiers de charte
(SCSS, `.tex`, `.typ`, images). Voir le `CLAUDE.md` de ce dépôt pour
l'analyse qui a mené à cette extension.

## Décisions

- **L'extension est rangée dans `_extensions/kbosirany/inrae/`**, là où
  `quarto add` et `quarto use template` l'installent depuis GitHub. Les
  chemins du logo et du favicon sont ainsi les mêmes dans ce dépôt et dans
  un projet qui l'utilise. Ne pas la remonter dans `_extensions/inrae/`.
- **Dans `exemples/*`, `_extensions` est un lien symbolique** vers celui de
  la racine : une seule copie de la charte, et les exemples se rendent sur
  place.
- **Fichiers à plat dans l'extension** (pas de sous-dossier `images/`) : les
  `.tex` incluent le logo par son seul nom, copié à côté du document par
  `format-resources`.
- **`_brand.yml` reste dans le modèle de livre**, pas dans l'extension : le
  fournir depuis l'extension n'a pas été essayé.
- **Le fond de la diapositive de fin** est posé par le filtre
  `fin-inrae.lua` sur `{.fin-inrae}`, pour que le document n'ait pas à
  connaître le chemin de l'image.

## État

- Rendus vérifiés avec Quarto 1.11.9 pour les cinq formats, et installation
  depuis GitHub (`quarto add`, `quarto use template` sur les deux exemples).
- Pas vérifié : l'aspect des diapositives reveal.js dans un navigateur.
- Licence AGPL version 3 (`LICENSE`), choisie le 2026-11-10, pour le code
  et les exemples. Les logos et visuels INRAE en sont exclus (section
  « Licence » du README) : ils ne sont pas à relicencier.

## Vérifier un changement

```bash
quarto render exemples/livre
quarto render exemples/diapos/diapos.qmd
quarto render exemples/diapos/diapos.qmd --to inrae-beamer
```

Rendre un seul format d'un livre avec `--to` vide `_book/`.
