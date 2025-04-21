#let chapter-counter = counter("chapter")

// Main document setup function
#let tfg(body) = {
  // --- Default Styles ---
  // Default supplement for levels 3+
  show heading.where(level: n => n >= 3): set heading(supplement: [Section])
  show heading.where(level: 1): set heading(supplement: [Part], numbering: "I.")

  // Chapter style: Use only the second number (chapter) with format "1."
  show heading.where(level: 2): set heading(
    supplement: [Chapter],
    // Explicitly take (part, chap_num, ...) and format only using chap_num
    numbering: (part, chap_num, ..rest) => numbering("1.", chap_num),
  )

  // Section style (and lower): Use numbers from level 2 onwards.
  // Takes (part, chap, sec, ...), formats using (chap, sec, ...) with "1.1..."
  show heading.where(level: n => n >= 3): it => {
    set heading(
      numbering: (part, ..nums) => {
        // Create pattern like "1.1", "1.1.1" based on length of nums (chap, sec, ...)
        let pattern = range(nums.len()).map(i => "1").join(".")
        // Apply pattern to chapter, section, etc. (ignoring part)
        numbering(pattern, ..nums)
      },
    )
    it
  }

  // Alignment
  show heading: set align(left)
  show heading.where(level: 1): set align(right)
  show heading.where(level: 2): set align(center)

  // --- Counter Logic ---
  // (This part remains the same as the previous correct version)
  show heading: it => {
    if it.level == 1 {
      it
      context {
        let current_chapters = chapter-counter.get()
        counter(heading).update((one, ..rest) => (one, ..current_chapters))
      }
    } else if it.level == 2 {
      chapter-counter.step()
      it
    } else {
      it
    }
  }

  body
}

// Appendix setup function
#let appendix(body) = context {
  // --- Style Changes for Appendix ---
  // Appendix Chapter style: Use only the second number (appendix) with format "A."
  show heading.where(level: 2): set heading(
    supplement: [Appendix],
    // Explicitly take (part, app_num, ...) and format only using app_num
    numbering: (part, app_num, ..rest) => numbering("A.", app_num),
  )

  // Appendix Section style (and lower): Use numbers from level 2 onwards.
  // Takes (part, app, sec, ...), formats using (app, sec, ...) with "A.1..."
  show heading.where(level: n => n >= 3): it => {
    // Ensure sections in appendix are styled correctly (e.g., A.1, A.1.1)
    set heading(supplement: [Section]) // Keep supplement as Section
    set heading(
      numbering: (part, app_num, ..rest_nums) => {
        // Create pattern like "A.1", "A.1.1" based on length of rest_nums
        let pattern = "A" + range(rest_nums.len()).map(i => ".1").join("")
        // Apply pattern to appendix num, section, etc. (ignoring part)
        numbering(pattern, app_num, ..rest_nums)
      },
    )
    it
  }

  // --- Counter Reset Logic for Appendix ---
  // (This part remains the same as the previous correct version)
  chapter-counter.update(0)
  // Ensure we get the part number *before* resetting the counter if needed,
  // although getting it from the current state should be fine.
  let current_part = counter(heading).get().at(0)
  counter(heading).update((part, ..rest) => (current_part, 0))


  body
}

// Apply the main setup globally first
#show: tfg

// --- Document Content ---

= part 1 <part:1>
// Displays: Part I
== chap 1 <chap:1>
// Displays: Chapter 1
=== sect 1
// Displays: Section 1.1
== chap 2
// Displays: Chapter 2

= part 2
// Displays: Part II
== chap 3
// Displays: Chapter 3
== chap 4
// Displays: Chapter 4

= pre appendix part 3
// Displays: Part III
== chap 5
// Displays: Chapter 5
== chap 6
// Displays: Chapter 6
=== sect 6.1
// Displays: Section 6.1
==== subsect 6.1.1
// Displays: Section 6.1.1


// --- Switch to Appendix ---
#show: appendix

appendix from now on:

= post appendix part 4
// Displays: Part IV
== appendix a <appendix:A>
// Displays: Appendix A
=== appendix sect a.1
// Displays: Section A.1
== appendix b
// Displays: Appendix B

= part 5
// Displays: Part V
== appendix c
// Displays: Appendix C
=== appendix sect c.1
// Displays: Section C.1
==== appendix subsect c.1.1
// Displays: Section C.1.1
== appendix d
// Displays: Appendix D
