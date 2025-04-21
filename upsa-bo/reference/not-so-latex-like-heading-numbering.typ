#let chapter-counter = counter("chapter")

// Main document setup function
#let tfg(body) = {
  // --- Default Styles ---
  set heading(supplement: [Section]) // Default supplement for levels 3+
  show heading.where(level: 1): set heading(supplement: [Part], numbering: "I.")
  // Default chapter style (will be overridden in appendix)
  show heading.where(level: 2): set heading(supplement: [Chapter], numbering: "1.")
  // Hide Part number from Chapter/Section numbering display (levels 2+)
  show heading.where(level: n => n >= 2): it => {
    set heading(numbering: (part, ..nums) => numbering("1.", ..nums))
    it
  }
  // Alignment
  show heading: set align(left)
  show heading.where(level: 1): set align(right)
  show heading.where(level: 2): set align(center)

  // --- Counter Logic ---
  // This combined show rule handles counter updates for levels 1 and 2
  show heading: it => {
    if it.level == 1 {
      // Prevent chapter counter reset when a Part heading appears
      it // Show the heading first
      // Use context to apply counter update *after* this heading is processed,
      // ensuring the state is correct *before* the next heading.
      context {
        let current_chapters = chapter-counter.get() // Get current manual chapter count state
        // Update the built-in heading counter: keep level 1 (part),
        // set level 2 (chapter) based on the manual counter's state.
        counter(heading).update((one, ..rest) => (one, ..current_chapters))
      }
    } else if it.level == 2 {
      // Increment the continuous chapter counter *before* the chapter heading is processed
      chapter-counter.step()
      it // Show the chapter heading (it will use the updated built-in counter state)
    } else {
      // Default behavior for other levels (sections, etc.)
      it
    }
  }

  body // Execute the document body with these rules
}

// Appendix setup function
#let appendix(body) = context {
  // --- Style Changes for Appendix ---
  // Change Chapter supplement and numbering format for appendix chapters
  show heading.where(level: 2): set heading(supplement: [Appendix], numbering: "A.")

  // --- Counter Reset Logic for Appendix ---
  // Reset the manual continuous chapter counter.
  // The next chapter-counter.step() in the main show rule will make it 1 (displayed as A).
  chapter-counter.update(0)

  // Also reset the built-in heading counter's chapter level *immediately*.
  // This ensures the first appendix chapter starts correctly at A (1).
  // Get the current part number from the global heading counter state.
  let current_part = counter(heading).get().at(0)
  // Update the global heading counter: keep the current part number, but reset the chapter number to 0.
  counter(heading).update((part, ..rest) => (current_part, 0))

  body // Execute the appendix body with these rules
}

// Apply the main setup globally first
#show: tfg

// --- Document Content ---

= part 1 <part:1>
// Built-in counter: (1)
// Manual chapter counter: [0]
== chap 1 <chap:1>
// Manual chapter counter steps to [1]
// Built-in counter steps to (1, 1)
// Displays: Chapter 1
=== sect 1
// Built-in counter steps to (1, 1, 1)
// Displays: Section 1.1
== chap 2
// Manual chapter counter steps to [2]
// Built-in counter steps to (1, 2)
// Displays: Chapter 2

= part 2
// Built-in counter steps to (2)
// Main show rule (L1) runs: context updates built-in counter to (2, ..chapter-counter.get()) -> (2, 2)
// Manual chapter counter: [2]
// Displays: Part II
== chap 3
// Manual chapter counter steps to [3]
// Built-in counter steps to (2, 3)
// Displays: Chapter 3
== chap 4
// Manual chapter counter steps to [4]
// Built-in counter steps to (2, 4)
// Displays: Chapter 4

= pre appendix part 3
// Built-in counter steps to (3)
// Main show rule (L1) runs: context updates built-in counter to (3, ..chapter-counter.get()) -> (3, 4)
// Manual chapter counter: [4]
// Displays: Part III
== chap 5
// Manual chapter counter steps to [5]
// Built-in counter steps to (3, 5)
// Displays: Chapter 5
== chap 6
// Manual chapter counter steps to [6]
// Built-in counter steps to (3, 6)
// Displays: Chapter 6


// --- Switch to Appendix ---
// Apply appendix settings within this scope using #show
#show: appendix

// This text doesn't affect counters
appendix from now on:

= post appendix part 4
// Built-in counter steps to (4)
// Appendix context reset manual counter to [0] and built-in to (current_part, 0) -> (3, 0)
// Main show rule (L1) runs: context updates built-in counter to (4, ..chapter-counter.get()) -> (4, 0)
// Manual chapter counter: [0]
// Displays: Part IV
== appendix a <appendix:A>
// Appendix show rule (L2) sets supplement/numbering to Appendix/A.
// Main show rule (L2) runs: chapter-counter steps to [1]
// Built-in counter steps to (4, 1)
// Displays: Appendix A
== appendix b
// Appendix show rule (L2) sets supplement/numbering to Appendix/A.
// Main show rule (L2) runs: chapter-counter steps to [2]
// Built-in counter steps to (4, 2)
// Displays: Appendix B

= part 5
// Built-in counter steps to (5)
// Main show rule (L1) runs: context updates built-in counter to (5, ..chapter-counter.get()) -> (5, 2)
// Manual chapter counter: [2]
// Displays: Part V
== appendix c
// Appendix show rule (L2) sets supplement/numbering to Appendix/A.
// Main show rule (L2) runs: chapter-counter steps to [3]
// Built-in counter steps to (5, 3)
// Displays: Appendix C
== appendix d
// Appendix show rule (L2) sets supplement/numbering to Appendix/A.
// Main show rule (L2) runs: chapter-counter steps to [4]
// Built-in counter steps to (5, 4)
// Displays: Appendix D
