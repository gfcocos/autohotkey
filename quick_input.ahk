;------------------------------------------------------------------------------
; Shortcuts that do not fall under misspellings or typos
; (otherwise in AutoCorrect.ahk)
;------------------------------------------------------------------------------

; c = case sensitive
; c1 = ignore the case that was typed, always use the same case for output
; * = immediate change (no need for space, period, or enter)
; ? = triggered even when the character typed immediately before it is alphanumeric
; r = raw output

; Thunderbird autocorrect uses |c → ©, MS Word uses (c) → ©
; I don't know where | prefix comes from, but I am also adopting it as an 
; "escape character" for literal symbols that might otherwise want to be 
; written out.  "pi" vs "π". for instance.  Could also use ~ or something.

; Alternately, HTML entity references like "asymp" that are not otherwise words can safely be used alone?
; en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references#Character_entity_references_in_HTML
; But it's easier to just use the pipe character, so I've largely abandoned this

;------------------------------------------------------------------------------
; Science/engineering
;------------------------------------------------------------------------------
; Resistances using Greek uppercase omega character, not 
; Unicode ohm sign (which only exists for backwards compatibility)
:c1*:kohm::kΩ ; kiloohm
:c1*:okhm::kΩ ; kiloohm
:c1*:mohm::MΩ ; megaohm
:c1*:gohm::GΩ ; gigaohm
:c1*:tohm::TΩ ; teraohm
:*:|ohm::Ω
; :*:ohm::Ω   ; not sure if want
; :*:ohms::Ω  

; micro- prefix using Unicode micro sign (µ), not mu character (μ)
:c*:uA::µA ; microamp
:c*:uF::µF ; microfarad
:c*:uH::µH ; microhenry  - needs to be case sensitive - "uh" is a word
:c*:uV::µV ; microvolt
:c*:uW::µW ; microwatt
:c*:uPa::µPa ; micropascal
:*:|um::µm
::microm::µm ; micrometer or micron
:*:|micron::µm
:*:|us::µs   ; microsecond
:*:usec::µs
:*c:uS::µS   ; microsiemens

; :c*:MWe::MWₑ ; Probably a bad idea

:c1:pf::pF ; picofarad
:c1:nf::nF ; nanofarad
; :c:mv::mV ; millivolt - conflicts with bash command
:c:nv::nV ; nanovolt
:*?:degC::°C ; degrees Celsius
:*?:degF::°F ; degrees Fahrenheit
:*?:|deg::° ; degree symbol
:*:rthz::√Hz ; square root of hertz
:r:thdn::THD+N ; total harmonic distortion and noise
::|diam::⌀ ; diameter symbol - alternately could be "Latin small letter o with stroke" (ø) if no font support
::m^2::m²  ; Maybe a bad idea
; ::1/4"::¼" ; Probably a bad idea 
; ::1/4"::¼″ ; technically should be a double prime

; add Unicode non-breaking spaces before units?  or is that too pedantic?

;------------------------------------------------------------------------------
; Math
;------------------------------------------------------------------------------
:?*:+-::±		; plus-or-minus sign
:?:|-::−		; true minus sign
:?:|minus::−	; true minus sign
:?:|x::×		; true times sign
:?:|times::×
::divby::÷  ; division sign or obelus
::./.::÷    ; any conflicts?
:?:|*::⋅		; "dot operator" (&sdot;), for multiplication, dot product

; sdot   ⋅ U+22C5 HTMLsymbol dot operator ('dot operator' is NOT the same character as U+00B7 'middle dot'.)

; Experimental:
:?:1x::1×
:?:2x::2×
:?:3x::3×
:?:4x::4×
:?:5x::5×
:?:6x::6×
:?:7x::7×
:?:8x::8×
:?:9x::9×

; "Unicode also includes a handful of vulgar fractions as compatibility characters, but discourages their use."
::|1/2::½
::|1/4::¼
::|3/4::¾


::|>=::≥   ; '>=' conflicts with usage in programming.  Alternatively, it could specify different rules for code windows.
::|<=::≤
::|!=::≠ ; not equal to
::|>>::≫ ; much greater than
::|<<::≪ ; much less than
::|!=::≠
::notequal::≠
::approx::≈ ; approximately equal to
::asymp::≈
::|~::≈
::|propto::∝ ; proportional to
::|=-::≡     ; mathematical identity
::|===::≡
::|propersubset::⊂    ;	SUBSET OF
::|propersuperset::⊃	;	SUPERSET OF
::|notsubset::⊄	;	NOT A SUBSET OF
::|subset::⊆	;	SUBSET OF OR EQUAL TO
::|superset::⊇	;	SUPERSET OF OR EQUAL TO 

; superscripts and subscripts from HTML entity names sup2 and sup3
; Examples: km² V₊ V₋ CuSO₄·5H₂O or ²³⁸U (hard to type, ugly, but actually used, according to Google)
; Alternate notation: x^2 → x², x_2 → x₂
; Of course, that would conflict with programming variable names like max_3
; There's also ⁼⁽⁾₌₍₎ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖʳˢᵗᵘᵛʷˣʸᶻᴬᴮᴰᴱᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾᴿᵀᵁⱽᵂₐₑₕᵢₖₗₘₙₒₚᵣₛₜᵤᵥₓᵅᵝᵞᵟᵋᶿᶥᶲᵠᵡᵦᵧᵨᵩᵪ
:?:sup0::⁰
:?:sup1::¹
:?:sup2::² ; common
:?:sup3::³ ; common
:?:sup4::⁴
:?:sup5::⁵
:?:sup6::⁶
:?:sup7::⁷
:?:sup8::⁸
:?:sup9::⁹
:?:sup+::⁺
:?:sup-::⁻
:?:supn::ⁿ
:?:supi::ⁱ

:?:sub0::₀
:?:sub1::₁
:?:sub2::₂
:?:sub3::₃
:?:sub4::₄
:?:sub5::₅
:?:sub6::₆
:?:sub7::₇
:?:sub8::₈
:?:sub9::₉
:?:sub+::₊
:?:sub-::₋

::|sqrt::√ ; square root
::radic::√
::|inf::∞

; Greek characters for math, etc.
:C:|Alpha::Α
:C:|Beta::Β
:C:|Gamma::Γ
:C:|Delta::Δ
:C:|Epsilon::Ε
:C:|Zeta::Ζ
:C:|Eta::Η
:C:|Theta::Θ
:C:|Iota::Ι
:C:|Kappa::Κ
:C:|Lambda::Λ
:C:|Mu::Μ
:C:|Nu::Ν
:C:|Xi::Ξ
:C:|Omicron::Ο
:C:|Pi::Π
:C:|Rho::Ρ
:C:|Sigma::Σ
:C:|Tau::Τ
:C:|Upsilon::Υ
:C:|Phi::Φ
:C:|Chi::Χ
:C:|Psi::Ψ
:C*:|Omega::Ω
:C:|alpha::α
:C:|beta::β
:C:|gamma::γ
:C:|delta::δ
:C:|epsilon::ε
:C:|zeta::ζ
:C:|eta::η
:C:|theta::θ
:C:|iota::ι
:C:|kappa::κ
:C:|lambda::λ
:C:|mu::μ
:C:|nu::ν
:C:|xi::ξ
:C:|omicron::ο
:C?:|pi::π
:C:|rho::ρ
:C:|sigmaf::ς
:C:|sigma::σ
:C:|tau::τ
:C:|upsilon::υ
:C:|phi::φ
:C:|chi::χ
:C:|psi::ψ
:C*:|omega::ω
:C*:|thetasym::ϑ
:C:|upsih::ϒ
:C:|piv::ϖ

;------------------------------------------------------------------------------
; Typography / symbols
;------------------------------------------------------------------------------
::|c::©   ; copyright symbol
::(c)::©
::|r::®   ; registered symbol
::(r)::®
::|s::§   ; section symbol
::(tm)::™ ; trademark symbol

:c:|o::• 	; bullet
::|bull::•
::|bullet::•
:c:|O::● ; black circle
::|()::○ ; white circle

; these don't work due to minus sign. needs to ignore dashes as closing characters for just these. also hard to remember since -- is usually em.
;::|--::–  	; en dash –
;::|---::— 	; em dash —
::|en::–
::|em::—
; ¦ ; broken bar
:?*:|cent::¢ ; cents symbol

; middot · U+00B7 HTMLlat1   middle dot (= Georgian comma = Greek middle dot)
:?:|.::·		; "middle dot" (&middot;), for interword separation, punctuation, ???
::|...::… ; Doesn't work due to above

; Arrows
:?*:-->::→
:?*:==>::⇒
:?*:<--::←
:?*:<==::⇐
:?*:<->::↔
:?*:<=>::⇔
::|^::↑
::|v::↓

; Special characters
;:r:|nbsp:: ; Doesn't work?

;------------------------------------------------------------------------------
; Emoticons
;------------------------------------------------------------------------------
::0_0::ಠ_ಠ ; look of disapproval
::|<3::♥
::(:))::☺
::|:)::☺
::(:()::☹
::|:(::☹
::|snowman::☃
::|skull::☠
::|music::♪♫
:r:|hug::(>^_^)> <(^.^<)
::|nerd::□_□

;------------------------------------------------------------------------------
; HTML shortcuts
;------------------------------------------------------------------------------
:*b0:|bq::{bs 3}<blockquote></blockquote>{left 13}
; :*:|bq::<blockquote>
:*:|/bq::</blockquote>
:*:|\bq::</blockquote>

:*b0:|qu::{bs 3}[QUOTE][/QUOTE]{left 8}
:*:|/qu::[/QUOTE]
:*:|\qu::[/QUOTE]

:*b0:<em>::</em>{left 5}