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
  \override Lyrics.LyricText.font-size = #-4
}
\header
{
  title = "Ain't Misbehavin"
  composer = "C: Fats Waller & Harry Brooks"
  arranger = "L: Andy Razaf"
  tagline = #f
}
chord_sequence = \chords
{
   \set chordChanges = ##t
   % A Section
   c2:6 a:7
   d:m7 g:7
   c:6 e:7.5+
   f:6 f:m6
   c:6 a:7
   d:m7 g:7
   e:7 a:7
   d:9 g:7
   c:6 f:6 c:6 e:7
   % B Section
   a1:m7 f:7 d:7 a:7
   g2:6 e:7 a:m7 d:7 g:7 a:7 d:9 g:7 \bar "||" \break
   % A Section
   c2:6 a:7
   d:m7 g:7
   c:6 e:7.5+
   f:6 f:m6
   c:6 a:7
   d:m7 g:7
   c:maj7 a:m7
   d:m7 g:7
}
melody = \relative
{
  \key c \major
  \repeat volta 2
  {
    % A Section
    \mark \default
    \bar ".|:"
    \key c \major
    r8 c' d c g' g4.
    r8 d e d a'2
    r8 g a g c c4 b8~
    b4 d8 c a e ef4 \break
    r8 c d c g' g4 c,8
    d e d a'~a a4 e8~
    \alternative
    {
      \volta 1
      {
        e1
        r1       
      }
      \volta 2
      {
        c1
        r1 \bar "||" \break       
      }
    }
  }
    % B Section
    \mark \default
    r4 c'8 a c a4.
    r4 c8 a c a4.
    r4 c8 a c a4.
    r4 cs8 a cs a4. \break
    r4 d d d
    d c b a
    g2 a2
    e2 d2 \break
    % A Section
    \mark 1
    r8 c d c g' g4.
    r8 d e d a'2
    r8 g a g c c4 b8~
    b4 d8 c a e ef4 \break
    r8 c d c g' g4 c,8
    d e d a'~a a4 e8~
    e1
    r1 \bar "|." 
}
\addlyrics {
  \set stanza = #""
  No one to talk with all by my self
  No one to walk with I'm hap py on the shelf
  Ain't mis be hav in' I'm sa vin' my love for you
  you

  Jack ie Hor ner in a cor ner
  Don't go no where what do I care
  Your kis ses are worth wait in' for
  (be lieve me)

  I don't stay out late, don't care to go
  I'm home a bout eight me and my ra di o
  Ain't mis be hav in' I'm sav ing my love for you
}
\addlyrics {
  \set stanza = #""
  I know it's cer tain the one I love
  I'm through with flir tin' you that I'm thin kin' of
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