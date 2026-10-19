\version "2.24.4"
\language "english"
\paper
{
  #(define fonts
    (set-global-fonts
      #:music "lilyjazz"
      #:roman "lilyjazz"
      #:sans "lilyjazz"
      #:factor (/ staff-height pt 20)
  ))
  page-count = #1
  top-margin = 10
  system-system-spacing = #'((basic-distance . 26))
}
\layout
{
  \context
  {
    \Score
    \omit BarNumber
    rehearsalMarkFormatter = #format-mark-box-alphabet
  }
  indent = 0.0
}
\header
{
  title = "Stardust"
  composer = "Hoagy Charmichael"
  arranger = #f
  tagline = #f
}
chord_sequence = \chords
{
  \set chordChanges = ##t
  \set noChordSymbol = ""
  % A Section
  r2 c:7.5+
  f1:6 f:6 f:m6 f:m6
  c2:maj7 d:min7 e:min7 a:7 d2.:min7 cs4:dim7 d1:min7
  g2:7 g:dim7 g1:7 c:maj7 a:min7
  d:9 d:9
  g2:7 g:7sus4 g:dim7 c:7.5+
  
   % B Section
  f1:6 f:6 f:m6 f:m6
  c2:maj7 d:min7 e:min7 a:7 d2.:min7 cs4:dim7 d1:min7
  f:6 f:min6 c e2:min7 ef:9
  d1:min7 g1:7 c:maj7 c:maj7
}
melody = \relative
{
  % A Section
  \mark \default
  \key c \major
  r2 r8 b' c cs \bar "||"
  d4 c a f
  d f a e'
  e1
  d8 c af f d4. d'8 \break
  c4 g8 c8~ c2
  b8 e b g e2
  r8 a c a f g e f
  d2~ d8 e4 d8 \break
  
  g4 g8 g~ g2
  r8 d4 e8 g d ds g
  e a4.~ a2~
  a2. e'4 \break
  e8 d c a e2
  b'8 d, df c~ c a'4 d,8
  g4 g a8 d d, a'
  g2. c4 \bar "||" \break
  % B Section
  \mark \default
  d4 c a f
  d f a e'
  e1
  d8 c af f d4. d'8 \break
  c4 g8 c8~ c2
  b8 e b g e2
  r8 a c a f g e f
  d2~ d8 e4 d8 \break
  
  g4 fs8 f~ f2~
  f2. c8 d
  e4 g c e
  b2. c4 \break
  d8 c a f a2~
  a8 g a f g e f d
  c1
  r1 \bar "|."
}
\score
{
  \transpose c c {
  <<
    \new ChordNames
        {
           \chord_sequence
        }
    \new Staff
        {
          \melody
        }
  >>
  }
  \layout {}
}