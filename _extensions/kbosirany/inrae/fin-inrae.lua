-- Diapositive de fin du masque INRAE : un titre `{.fin-inrae}` reçoit le
-- fond vert, sans que le document ait à connaître le chemin de l'image.
local fond = quarto.utils.resolve_path("inrae-titre-vert.png")

function Header(el)
  if el.classes:includes("fin-inrae") then
    el.attributes["background-image"] = fond
    el.attributes["background-size"] = "cover"
    return el
  end
end
