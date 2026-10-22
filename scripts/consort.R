# ===== CONSORT with "Data not entered" box =====
# install.packages(c("DiagrammeR","DiagrammeRsvg","rsvg"))

library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)

# ---- editable numbers/text ----
n_assessed   <- 180
n_excluded   <- 14
n_notmeet    <- 10
n_refused    <- 4
n_other      <- 0

n_random     <- 166
n_alloc_ctl  <- 83
n_alloc_int  <- 83
data_not_entered_alloc <- n_random - (n_alloc_ctl + n_alloc_int)  # (kept from your code; different meaning)

n_recv_ctl   <- 83 #Non Stent
n_recv_int   <- 83 # Stent group
n_notrecv_ctl <- 0
n_notrecv_int <- 0
n_func_ctl <-  #follow up not complete / Awaited
  n_func_int <-  #follow up not complete / Awaited
  n_ltfu_ctl   <- 0
n_ltfu_int   <- 0 #Loss to follow up
disc_ctl     <- 1  # Sum of both left protocol and deviation from protocol
disc_int     <- 1
n_anal_ctl   <- n_recv_ctl - n_func_ctl
n_anal_int   <- n_recv_int - n_func_int
n_excl_ctl   <- n_anal_ctl - n_ltfu_ctl - disc_ctl
n_excl_int   <- n_anal_int - n_ltfu_int - disc_int

# ---- NEW: compute "Data not entered" at enrollment stage ----
n_data_not_entered <- n_assessed - n_excluded - n_random
if (n_data_not_entered < 0) {
  warning("Computed n_data_not_entered < 0; check your inputs.")
}

# ---- labels ----
label_assess <- sprintf("Assessed for eligibility\\n(n = %d)", n_assessed)
label_excl   <- sprintf(
  "Excluded (n = %d)\\n\\nNot meeting inclusion criteria\\n(n = %d)\\nRefused to participate\\n(n = %d)\\nOther reasons (n = %d)",
  n_excluded, n_notmeet, n_refused, n_other
)
label_data_missing <- sprintf("Data not entered\\n(n = %d)", n_data_not_entered)

label_rand   <- sprintf("Randomized (n = %d)", n_random)

label_alloc1 <- sprintf(
  "Allocated to Group-A\\n(n = %d)\\n\\nReceived allocated intervention (n = %d)\\nDid not receive allocated intervention (n = %d)\\n(give reasons)",
  n_alloc_ctl, n_recv_ctl, n_notrecv_ctl
)
label_alloc2 <- sprintf(
  "Allocated to Group-B\\n(n = %d)\\n\\nReceived allocated intervention (n = %d)\\nDid not receive allocated intervention (n = %d)\\n(give reasons)",
  n_alloc_int, n_recv_int, n_notrecv_int
)

label_follow1 <- sprintf("Follow up not completed\\n(n = %d)\\n\\nLost to follow up\\n(n = %d)\\n\\nConverted to GA: %s",n_func_ctl ,n_ltfu_ctl, disc_ctl)
label_follow2 <- sprintf("Follow up not completed\\n(n = %d)\\n\\nLost to follow up\\n(n = %d)\\n\\nConverted to GA: %s",n_func_int , n_ltfu_int, disc_int)

label_an1 <- sprintf("Analyzed for PP (n = %d)",  n_excl_ctl)
label_an2 <- sprintf("Analyzed for PP (n = %d)", n_excl_int)

# ---- graph ----
g <- grViz(sprintf("
digraph consort {
  graph [rankdir = TB, nodesep = 0.6, ranksep = 0.7, labelloc = t]
  node  [shape = box, style = \"rounded\", fontname = Helvetica, fontsize = 12]
  edge  [arrowhead = normal]

  // main boxes
  assess   [label = \"%s\"]
  exclude  [label = \"%s\"]
  random   [label = \"%s\"]

  alloc1  [label = \"%s\"]
  alloc2  [label = \"%s\"]

  follow1 [label = \"%s\"]
  follow2 [label = \"%s\"]

  analyze1 [label = \"%s\"]
  analyze2 [label = \"%s\"]

  // left-side section labels
  node [shape = plaintext, style = \"\", fontsize = 12]
  enroll_lbl   [label = \"Enrollment\"]
  alloc_lbl    [label = \"Allocation\"]
  follow_lbl   [label = \"Follow up\"]
  analysis_lbl [label = \"Analysis\"]

  // same-rank rows
  {rank = same; enroll_lbl; assess; exclude}
  {rank = same; random}
  {rank = same; alloc_lbl; alloc1; alloc2}
  {rank = same; follow_lbl; follow1; follow2}
  {rank = same; analysis_lbl; analyze1; analyze2}

  // connectors
  assess  -> random
  assess  -> exclude

  random  -> alloc1
  random  -> alloc2

  alloc1  -> follow1
  alloc2  -> follow2

  follow1 -> analyze1
  follow2 -> analyze2

  // keep left labels aligned via invisible edges
  enroll_lbl   -> assess   [style = invis]
  alloc_lbl    -> alloc1   [style = invis]
  follow_lbl   -> follow1  [style = invis]
  analysis_lbl -> analyze1 [style = invis]
}
", label_assess, label_excl, label_rand,
label_alloc1, label_alloc2, label_follow1, label_follow2, label_an1, label_an2))

g  # render

# ---- Export (optional) ----
svg_txt <- export_svg(g)
rsvg_pdf(charToRaw(svg_txt),  file = "images/consort_diagram.pdf")
rsvg_png(charToRaw(svg_txt),  file = "images/consort_diagram.png", width = 2000, height = 2600)


rm(data_not_entered_alloc, disc_ctl, disc_int, label_alloc1, label_alloc2, label_an1, label_an2, label_assess, label_data_missing, label_excl, label_follow1, label_follow2, label_rand, n_alloc_ctl, n_alloc_int, n_excluded, n_func_ctl, n_func_int, n_ltfu_ctl, n_ltfu_int, n_other, n_random, n_recv_ctl, n_recv_int, n_refused, n_anal_ctl, n_anal_int, n_assessed, n_data_not_entered, n_excl_ctl, n_excl_int, n_notmeet, n_notrecv_ctl, n_notrecv_int,svg_txt)
