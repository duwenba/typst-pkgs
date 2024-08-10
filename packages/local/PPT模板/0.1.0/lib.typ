#import "@preview/touying:0.4.2": *

#set text(lang: "zh")

// Themes: default, simple, metropolis, dewdrop, university, aqua
#let s = themes.aqua.register(aspect-ratio: "16-9")
#let s = (s.methods.info)(
  self: s,
  title: [系泊系统设计],
  subtitle: [Subtitle],
  author: [杜文霸],
  date: datetime.today(),
  institution: [Institution],
)
#let (init, slides, touying-outline, alert, speaker-note) = utils.methods(s)
#show: init

#show strong: alert

#let (slide, empty-slide, title-slide, focus-slide) = utils.slides(s)
#show: slides


