# BucksBitties
# AUTHENTICATE
# Html Source Files
# XML Source Files
# ACTION-SERVERLESS
# DOCS.HACKERONE.COM
# EOSIO-EXPLORER
# Build and Release Folders
# Other files and folders
# Executables
*.swf
*.air
*.ipa
*.apk

# Project files, i.e. `.project`, `.actionScriptProperties` and `.flexProperties`

# should NOT be excluded as they contain compiler settings and other important

# information for Eclipse / Flash Builder.
FROM node:10-slim
LABEL version="1.0.0"
LABEL repository="https://github.com/aaronpanch/action-serverless"
LABEL homepage="https://github.com/aaronpanch/action-serverless"
LABEL maintainer="Aaron Panchal <aaron.panchal@gmail.com>"
LABEL "com.github.actions.name"="GitHub Action for Serverless Framework"
LABEL "com.github.actions.description"="Wraps the Serverless CLI"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="gray-dark"

# Install serverless globally

MIT License

Copyright (c) 2019 Aaron Panchal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

# GitHub Action for Serverless
This Action wraps the [Serverless Framework](https://serverless.com/framework/docs/getting-started/) CLI to enable common commands. See their documentation for usage and provider selection.

## Usage
You'll first have to have a Serverless project as outlined in Serverless's [Getting Started](https://serverless.com/framework/docs/getting-started/).  Suppose your provider of choice were Amazon AWS. A workflow could look as follows to install dependencies, and deploy to a Lambda function.

_Note:_ We're first using the NPM Action to install project dependencies, then running `serverless deploy` via the action.

```workflow
workflow "Deploy via Serverless" {
  on = "push"
  resolves = ["deploy"]
}

action "install" {
  uses = "actions/npm@master"
  args = "install"
}

action "deploy" {
  needs = ["install"]
  uses = "aaronpanch/action-serverless@master"
  args = "deploy"
  secrets = [
    "AWS_ACCESS_KEY_ID",
    "AWS_SECRET_ACCESS_KEY",
  ]
}
```

### Secrets
Depending on the Serverless provider chosen, you'll need to supply appropriate credentials.  The above example illustrates a typical AWS scenario, but Serverless supports other cloud providers.

Typically, with any cloud provider, their particular authentication environment params are **Required**.

### Environment Variables
- `SERVICE_ROOT` - **Optional**.  To specify a particular subdirectory of your project that contains the Serverless service (the directory with the `serverless.yml` file) you can specify a `SERVICE_ROOT`.  This action will `cd` into that directory then execute commands.  The default root is `.` (project root).

#### Example
To navigate and deploy two services (in this example "Users" and "Admins") in different subdirectories:

```hcl
action "Deploy Users Service" {
  uses = "aaronpanch/action-serverless@master"
  args = "deploy"
  env = {
    SERVICE_ROOT = "users_service"
  }
  secrets = [
    "AWS_ACCESS_KEY_ID",
    "AWS_SECRET_ACCESS_KEY",
  ]
}

action "Deploy Admin Service" {
  uses = "aaronpanch/action-serverless@master"
  args = "deploy"
  env = {
    SERVICE_ROOT = "admin_service"
  }
  secrets = [
    "AWS_ACCESS_KEY_ID",
    "AWS_SECRET_ACCESS_KEY",
  ]
}
```

#!/bin/sh
set -e

ROOT=${SERVICE_ROOT:-.}

cd $ROOT
serverless $*

docs/changelog/2020/images/jan_2020_bounty_visibility.png

---
title: "January 2020"
path: "/changelog/2020/january"
date: "2020-01"
---

### Control Visibility of Bounty Earnings
Hackers can now control whether they want their earnings to be visible on Hacktivity and their profile. Go to your profile's **Settings > Account Preferences** to manage your bounty visibility.  
[bounty visibility settings on account preferences](./images/jan_2020_bounty_visibility.png)

### Linking Phabricator Tickets
Programs using the Phabricator integration can now link their Phabricator tickets to their reports on HackerOne.  

---
title: "HackerOne Platform Accessibility Conformance Report Revised Section 508 Edition"
path: "/accessibility/vpat.html"
id: "accessibility/vpat"
bookIndexFor: "accessibility"
---

**VPAT® Version 2.3 (Revised) – April 2019**

**Name of Product/Version:** HackerOne Bug Bounty & Vulnerability Disclosure Platform ("HackerOne Platform")

**Product Description:** The HackerOne Platform is a platform for an improved security coordination process. Security teams use HackerOne to implement their vulnerability disclosure policy and host bug bounty programs. The platform will communicate the procedures of how to discover and report security vulnerabilities in accordance with industry best practices.

**Last Updated:** September 26, 2019

**Evaluation Methods Used:** Accessibility testing consisted of but was not limited to: automated testing, extensive manual testing, general product knowledge, etc.

**Applicable Standards/Guidelines:** See below.

This report covers the degree of conformance for the following accessibility standard/guidelines:

Standard/Guideline | Included in Report
------------------ | ------------------
[Web Content Accessibility Guidelines 2.0](http://www.w3.org/TR/2008/REC-WCAG20-20081211) | Level A (Yes)<br>Level AA (Yes)<br>Level AAA (No)
[Revised Section 508 standards published January 18, 2017 and corrected January 22, 2018](https://www.access-board.gov/guidelines-and-standards/communications-and-it/about-the-ict-refresh/final-rule/text-of-the-standards-and-guidelines) | (Yes)

## Terms
The terms used in the Conformance Level information are defined as follows:
* **Supports:** The functionality of the product has at least one method that meets the criterion without known defects or meets with equivalent facilitation.
* **Partially Supports:** Some functionality of the product does not meet the criterion.
* **Does Not Support:** The majority of product functionality does not meet the criterion.
* **Not Applicable:** The criterion is not relevant to the product.
* **Not Evaluated:** The product has not been evaluated against the criterion. This can be used only in WCAG 2.0 Level AAA.

## WCAG 2.0 Report
Tables 1 and 2 also document conformance with:
* Chapter 5 – 501.1 Scope, 504.2 Content Creation or Editing
* Chapter 6 – 602.3 Electronic Support Documentation

Note: When reporting on conformance with the WCAG 2.0 Success Criteria, they are scoped for full pages, complete processes, and accessibility-supported ways of using technology as documented in the [WCAG 2.0 Conformance Requirements](https://www.w3.org/TR/WCAG20/#conformance-reqs).

### Table 1: Success Criteria, Level A

Criteria | Conformance Level | Remarks and Explanations
-------- | ----------------- | ------------------------
[1.1.1 Non-text Content](http://www.w3.org/TR/WCAG20/#text-equiv-all) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li><li>504.2 (Authoring Tool)</li><li>602.3 (Support Docs) | Web: Supports | Web: The HackerOne Platform has no known accessibility issues. Non-text content provides discernible/accessible labels and name markup.
[1.2.1 Audio-only and Video-only (Prerecorded)](http://www.w3.org/TR/WCAG20/#media-equiv-av-only-alt) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li><li>504.2 (Authoring Tool)</li><li>602.3 (Support Docs)</li> | Web: Not Applicable | Web: There is no content to which success criterion applies. Audio and video media are not used.
[1.2.2 Captions (Prerecorded)](http://www.w3.org/TR/WCAG20/#media-equiv-captions) (Level A) <br>Also applies to:<br>Revised Section 508 <ul><li>501 (Web)(Software)</li><li>504.2 (Authoring Tool)</li><li>602.3 (Support Docs)</li> | Web: Not Applicable | Web: The HackerOne Platform has no prerecorded audio content in synchronized media, except when the media is a media alternative for text and is clearly labeled as such.
[1.2.3 Audio Description or Media Alternative (Prerecorded)](http://www.w3.org/TR/WCAG20/#media-equiv-audio-desc) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: There is no content to which success criterion applies. Audio and video media are not used.
[1.3.1 Info and Relationships](http://www.w3.org/TR/WCAG20/#content-structure-separation-programmatic) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Semantic mark-up (e.g. landmarks, headings, labels) are provided.
[1.3.2 Meaningful Sequence](http://www.w3.org/TR/WCAG20/#content-structure-separation-sequence) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Pages follow a logical reading sequence.
[1.3.3 Sensory Characteristics](http://www.w3.org/TR/WCAG20/#content-structure-separation-understanding) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Descriptive mark-up (e.g. button text, tool-tips, alt tags) are provided.
[1.4.1 Use of Color](http://www.w3.org/TR/WCAG20/#visual-audio-contrast-without-color) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: The HackerOne Platform does not use color anywhere as the sole indicator of functionality.
[1.4.2 Audio Control](http://www.w3.org/TR/WCAG20/#visual-audio-contrast-dis-audio) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: There is no content to which success criterion applies. Audio media is not used.
[2.1.1 Keyboard](http://www.w3.org/TR/WCAG20/#keyboard-operation-keyboard-operable) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Partially Supports | Web: Most forms support keyboard shortcuts though some functionality requires a pointer.
[2.1.2 No Keyboard Trap](http://www.w3.org/TR/WCAG20/#keyboard-operation-trapping) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. User focus can be moved away from any component using keyboard tab keys.
[2.2.1 Timing Adjustable](http://www.w3.org/TR/WCAG20/#time-limits-required-behaviors) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Partially supports | Web: There are some newer features within the pentest component that require a user to submit content within a time limit. This is not adjustable by the user.
[2.2.2 Pause, Stop, Hide](http://www.w3.org/TR/WCAG20/#time-limits-pause) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Pages do not have any moving, blinking, scrolling, or auto-updating information.
[2.3.1 Three Flashes or Below Threshold](http://www.w3.org/TR/WCAG20/#seizure-does-not-violate) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Pages do not include any flashing elements. Thank goodness we're out of the 90s!
[2.4.1 Bypass Blocks](http://www.w3.org/TR/WCAG20/#navigation-mechanisms-skip) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software) – Does not apply to non-web software</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs) – Does not apply to non-web docs</li> | Web: Supports | Web: The HackerOne Platform does not have any repetitive content where a skip or bypass functionality would be necessary.
[2.4.2 Page Titled](http://www.w3.org/TR/WCAG20/#navigation-mechanisms-title) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Pages are labeled with descriptive titles.
[2.4.3 Focus Order](http://www.w3.org/TR/WCAG20/#navigation-mechanisms-focus-order) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Page elements follow a logical focus order.
[2.4.4 Link Purpose (In Context)](http://www.w3.org/TR/WCAG20/#navigation-mechanisms-refs) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li>| Web: Supports | Web: No known accessibility issues. Page links are labeled with descriptive text.
[3.1.1 Language of Page](http://www.w3.org/TR/WCAG20/#meaning-doc-lang-id) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Page markup indicates English for default language.
[3.2.1 On Focus](http://www.w3.org/TR/WCAG20/#consistent-behavior-receive-focus) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Context does not change on page element focus.
[3.2.2 On Input](http://www.w3.org/TR/WCAG20/#consistent-behavior-unpredictable-change) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Page context does not change on user input.
[3.3.1 Error Identification](http://www.w3.org/TR/WCAG20/#minimize-error-identified) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. When applicable, form pages provide error condition messaging text.
[3.3.2 Labels or Instructions](http://www.w3.org/TR/WCAG20/#minimize-error-cues) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. When applicable, web form pages provide self-describing labels and/or instructional text.
[4.1.1 Parsing](http://www.w3.org/TR/WCAG20/#ensure-compat-parses) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Elements are nested according to their specifications, elements do not contain duplicate attributes, and any IDs are unique, except where the specifications allow these features.
[4.1.2 Name, Role, Value](http://www.w3.org/TR/WCAG20/#ensure-compat-rsv) (Level A) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)<li> | Web: Partially Supports | Web: Name and value attributes on elements in most cases is discernible; role is sometimes absent.

### Table 2: Success Criteria, Level AA

Criteria | Conformance Level | Remarks and Explanations
-------- | ----------------- | ------------------------
[1.2.4 Captions (Live)](http://www.w3.org/TR/WCAG20/#media-equiv-real-time-captions) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Not Applicable | Web: There is no content to which success criterion applies. Live audio content is not used.
[1.2.5 Audio Description (Prerecorded)](http://www.w3.org/TR/WCAG20/#media-equiv-audio-desc-only) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Not Applicable | Web: There is no content to which success criterion applies. Prerecorded video content is not used.
[1.4.3 Contrast (Minimum)](http://www.w3.org/TR/WCAG20/#visual-audio-contrast-contrast) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Contrast minimums are supported.
[1.4.4 Resize Text](http://www.w3.org/TR/WCAG20/#visual-audio-contrast-scale) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Partially Supports | Web: No known accessibility issues. 200% zoom factor is supported and on most pages looks proper.
[1.4.5 Images of Text](http://www.w3.org/TR/WCAG20/#visual-audio-contrast-text-presentation) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues.
[2.4.5 Multiple Ways](http://www.w3.org/TR/WCAG20/#navigation-mechanisms-mult-loc) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software) – Does not apply to non-web software</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs) – Does not apply to non-web docs</li> | Web: Partially Supports | Web: In most cases there is more than one route to any given page.
[2.4.6 Headings and Labels](http://www.w3.org/TR/WCAG20/#navigation-mechanisms-descriptive) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Descriptive heading and label markup is provided.
[2.4.7 Focus Visible](http://www.w3.org/TR/WCAG20/#navigation-mechanisms-focus-visible) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Focus indicator is natively provided via major browser software vendors.
[3.1.2 Language of Parts](http://www.w3.org/TR/WCAG20/#meaning-other-lang-id) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. Page markup indicates English for default language.
[3.2.3 Consistent Navigation](http://www.w3.org/TR/WCAG20/#consistent-behavior-consistent-locations) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software) – Does not apply to non-web software</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs) – Does not apply to non-web docs</li> | Web: Supports | Web: No known accessibility issues. Consistent page-to-page navigation is provided via our top nav.
[3.2.4 Consistent Identification](http://www.w3.org/TR/WCAG20/#consistent-behavior-consistent-functionality) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software) – Does not apply to non-web software</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs) – Does not apply to non-web docs</li> | Web: Supports | Web: No known accessibility issues. Consistent identification applied to components across pages.
[3.3.3 Error Suggestion](http://www.w3.org/TR/WCAG20/#minimize-error-suggestions) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: No known accessibility issues. When applicable, form pages provide error suggestion text.
[3.3.4 Error Prevention (Legal, Financial, Data)](http://www.w3.org/TR/WCAG20/#minimize-error-reversible) (Level AA) <br>Also applies to: <br>Revised Section 508 <ul><li>501 (Web)(Software)</li> <li>504.2 (Authoring Tool)</li> <li>602.3 (Support Docs)</li> | Web: Supports | Web: These actions are either checked or confirmed.

### Table 3: Success Criteria, Level AAA
Notes: Section removed as Section 508 Does not apply

## Revised Section 508 Report
Notes:

### Chapter 3: [Functional Performance Criteria](https://www.access-board.gov/guidelines-and-standards/communications-and-it/about-the-ict-refresh/final-rule/text-of-the-standards-and-guidelines#302-functional-performance-criteria) (FPC)
Notes:

Criteria | Conformance Level | Remarks and Explanations
-------- | ----------------- | ------------------------
302.1 Without Vision | Supports | Accessible mark-up utilized for screen readers.
302.2 With Limited Vision | Supports | Accessible mark-up utilized for screen readers.
302.3 Without Perception of Color | Supports | No input depends on perception of color.
302.4 Without Hearing | Supports | No dependency on sound.
302.5 With Limited Hearing | Supports | No dependency on sound.
302.6 Without Speech | Supports | No dependency on sound.
302.7 With Limited Manipulation | Supports | No place to input speech.
302.8 With Limited Reach and Strength | Supports | Screen reader support, mouse, and keyboard only operation are provided.
302.9 With Limited Language, Cognitive, and Learning Abilities | Supports | Simple design, ease of use in mind.

### Chapter 4: [Hardware](https://www.access-board.gov/guidelines-and-standards/communications-and-it/about-the-ict-refresh/final-rule/text-of-the-standards-and-guidelines#401-general)
Notes: Section removed.  Not applicable.  The HackerOne Platform is a web-only application.

### Chapter 5: [Software](https://www.access-board.gov/guidelines-and-standards/communications-and-it/about-the-ict-refresh/final-rule/text-of-the-standards-and-guidelines#501-general)
Notes: Section removed.  Not applicable.  The HackerOne Platform is a web-only application.

### Chapter 6: [Support Documentation and Services](https://www.access-board.gov/guidelines-and-standards/communications-and-it/about-the-ict-refresh/final-rule/text-of-the-standards-and-guidelines#601-general)
Notes: Section removed.  Not applicable.  The HackerOne Platform is a web-only application.

---
title: "Asset"
path: "/glossary/asset"
---

Attack surfaces that hackers can hack on. There are different [types](/programs/asset-types.html) such as: CIDR, Domain, Source code, Executable, Hardware/loT, iOS: .ipa.

A collection of assets creates a scope.

---
title: "Bounty Table"
path: "/glossary/bounty-table"
---

A [bounty table](/programs/bounty-tables.html) illustrates how much an organization is willing to pay for various bugs, helps set expectations for hackers, and gives the bug bounty team a guideline to ensure fair and consistent reward amounts.

---
title: "Bounty"
path: "/glossary/bounty"
---

A financial reward offered in exchange for a valid vulnerability report.

---
title: "Bug Bounty Program"
path: "/glossary/bug-bounty-program"
---

A bug bounty offers monetary incentives for vulnerabilities and invites submissions from hackers.

---
title: "Common Response"
path: "/glossary/common-response"
---

A saved response or template that can be applied repeatedly to reports. 

---
title: "CVSS"
path: "/glossary/cvss"
---

Common Vulnerability Scoring System ([CVSS](/programs/severity.html)) is the framework HackerOne utilizes to assign a severity rating to a vulnerability.

---
title: "CWE"
path: "/glossary/cwe"
---

Common Weakness Enumeration ([CWE](/hackers/weakness.html)) is the framework HackerOne utilizes to assign a weakness to a vulnerability.

---
title: "Directory"
path: "/glossary/directory"
---

The HackerOne [directory](/hackers/directory.html) is a community-curated resource for contacting an organization regarding a security vulnerability.

---
title: "Hacker"
path: "/glossary/hacker"
---

Someone who’s able to find vulnerabilities in information-related systems. One who enjoys the intellectual challenge of creatively overcoming limitations (Jargon File 4.4.7).

---
title: "Hacktivity"
path: "/glossary/hacktivity"
---

[Hacktivity](/hackers/hacktivity.html) is the public community feed that showcases hacker activity on HackerOne. 

---
title: "Impact"
path: "/glossary/impact"
---

Average [reputation](/hackers/reputation.html) gained per bounty.

---
title: "Integration"
path: "/glossary/integration"
---

External applications being connected and functioning in HackerOne.

---
title: "ISO 29147"
path: "/glossary/iso-29147"
---

An international standard describing vulnerability coordination.

---
title: "ISO 30111"
path: "/glossary/iso-30111"
---

An international standard describing vulnerability handling processes.

---
title: "Report"
path: "/glossary/report"
---

A submission from a hacker that describes a potential security vulnerability.

---
title: "Reputation"
path: "/glossary/reputation"
---

Reputation measures how likely a hacker’s finding is to be immediately relevant and actionable. 

---
title: "Scope"
path: "/glossary/scope"
---

A collection of assets that hackers are to hack on. It’s the structured data that represents the attack surface that’s included or explicitly excluded in an organization’s vulnerability disclosure or bug bounty program. 

---
title: "Signal"
path: "/glossary/signal"
---

Average [reputation](/hackers/reputation.html) gained per report.

---
title: "Vulnerability Disclosure"
path: "/glossary/vulnerability-disclosure"
---

The process by which an organization receives and disseminates information about vulnerabilities in their products or online services. 

ISO 29147 definition: Process through which vendors and vulnerability finders may work cooperatively in finding solutions that reduce the risks associated with a vulnerability. It encompasses actions such as reporting, coordinating, and publishing information about a vulnerability and its resolution. 

---
title: "Vulnerability"
path: "/glossary/vulnerability"
---

Weakness of software, hardware, or online service that can be exploited.

Basic example:
Upload the artifact application.zip and deploy your environment.

script:
  - pipe: atlassian/aws-elasticbeanstalk-deploy:0.6.0
    variables:
      AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID
      AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY
      AWS_DEFAULT_REGION: 'us-east-1'
      APPLICATION_NAME: 'my-app-name'
      ENVIRONMENT_NAME: 'production'
      ZIP_FILE: 'application.zip'
Advanced example:
Upload the artifact application.zip and create a version deploy-$BITBUCKET_BUILD_NUMBER-multiple in Elastic Beanstalk.

- pipe: atlassian/aws-elasticbeanstalk-deploy:0.6.0
  variables:
    AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY
    AWS_DEFAULT_REGION: $AWS_DEFAULT_REGION
    APPLICATION_NAME: 'application-test'
    COMMAND: 'upload-only'
    ZIP_FILE: 'application.zip'
    S3_BUCKET: 'application-test-bucket'
    VERSION_LABEL: 'deploy-$BITBUCKET_BUILD_NUMBER-multiple'
Deploy your version deploy-$BITBUCKET_BUILD_NUMBER-multiple into the environment production and wait until the deployment is completed to see the status.

- pipe: atlassian/aws-elasticbeanstalk-deploy:0.6.0
  variables:
    AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY
    AWS_DEFAULT_REGION: $AWS_DEFAULT_REGION
    APPLICATION_NAME: 'application-test'
    COMMAND: 'deploy-only'
    VERSION_LABEL: 'deploy-$BITBUCKET_BUILD_NUMBER-multiple'
    ENVIRONMENT_NAME: 'production'
    WAIT: 'true'
Deploy multicontainer Docker environment as an AWS Elastic Beanstalk application to AWS Cloud and wait until the deployment is completed to see the status. You can find the complete source code for the sample multicontainer app by following this link example-aws-elasticbeanstalk-deploy-docker-multicontainer repository.

- step:
    name: Build docker-multicontainer-v2 App
    script:
    - zip -r docker-multicontainer-v2.zip cron.yaml Dockerrun.aws.json .ebextensions php-app proxy
    artifacts:
    - docker-multicontainer-v2.zip
- step:
    name: Deploy to AWS EBS
    caches:
      - pip
    script:
    - pipe: atlassian/aws-elasticbeanstalk-deploy:0.6.0
      variables:
        AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID
        AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY
        AWS_DEFAULT_REGION: 'us-east-1'
        APPLICATION_NAME: 'test-ebs-multi-docker'
        ENVIRONMENT_NAME: 'TestEbsMultiDocker-env'
        ZIP_FILE: 'docker-multicontainer-v2.zip'
        WAIT: 'true'
		
		         Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.

      "Licensor" shall mean the copyright owner or entity authorized by
      the copyright owner that is granting the License.

      "Legal Entity" shall mean the union of the acting entity and all
      other entities that control, are controlled by, or are under common
      control with that entity. For the purposes of this definition,
      "control" means (i) the power, direct or indirect, to cause the
      direction or management of such entity, whether by contract or
      otherwise, or (ii) ownership of fifty percent (50%) or more of the
      outstanding shares, or (iii) beneficial ownership of such entity.

      "You" (or "Your") shall mean an individual or Legal Entity
      exercising permissions granted by this License.

      "Source" form shall mean the preferred form for making modifications,
      including but not limited to software source code, documentation
      source, and configuration files.

      "Object" form shall mean any form resulting from mechanical
      transformation or translation of a Source form, including but
      not limited to compiled object code, generated documentation,
      and conversions to other media types.

      "Work" shall mean the work of authorship, whether in Source or
      Object form, made available under the License, as indicated by a
      copyright notice that is included in or attached to the work
      (an example is provided in the Appendix below).

      "Derivative Works" shall mean any work, whether in Source or Object
      form, that is based on (or derived from) the Work and for which the
      editorial revisions, annotations, elaborations, or other modifications
      represent, as a whole, an original work of authorship. For the purposes
      of this License, Derivative Works shall not include works that remain
      separable from, or merely link (or bind by name) to the interfaces of,
      the Work and Derivative Works thereof.

      "Contribution" shall mean any work of authorship, including
      the original version of the Work and any modifications or additions
      to that Work or Derivative Works thereof, that is intentionally
      submitted to Licensor for inclusion in the Work by the copyright owner
      or by an individual or Legal Entity authorized to submit on behalf of
      the copyright owner. For the purposes of this definition, "submitted"
      means any form of electronic, verbal, or written communication sent
      to the Licensor or its representatives, including but not limited to
      communication on electronic mailing lists, source code control systems,
      and issue tracking systems that are managed by, or on behalf of, the
      Licensor for the purpose of discussing and improving the Work, but
      excluding communication that is conspicuously marked or otherwise
      designated in writing by the copyright owner as "Not a Contribution."

      "Contributor" shall mean Licensor and any individual or Legal Entity
      on behalf of whom a Contribution has been received by Licensor and
      subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      copyright license to reproduce, prepare Derivative Works of,
      publicly display, publicly perform, sublicense, and distribute the
      Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      (except as stated in this section) patent license to make, have made,
      use, offer to sell, sell, import, and otherwise transfer the Work,
      where such license applies only to those patent claims licensable
      by such Contributor that are necessarily infringed by their
      Contribution(s) alone or by combination of their Contribution(s)
      with the Work to which such Contribution(s) was submitted. If You
      institute patent litigation against any entity (including a
      cross-claim or counterclaim in a lawsuit) alleging that the Work
      or a Contribution incorporated within the Work constitutes direct
      or contributory patent infringement, then any patent licenses
      granted to You under this License for that Work shall terminate
      as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
      Work or Derivative Works thereof in any medium, with or without
      modifications, and in Source or Object form, provided that You
      meet the following conditions:

      (a) You must give any other recipients of the Work or
          Derivative Works a copy of this License; and

      (b) You must cause any modified files to carry prominent notices
          stating that You changed the files; and

      (c) You must retain, in the Source form of any Derivative Works
          that You distribute, all copyright, patent, trademark, and
          attribution notices from the Source form of the Work,
          excluding those notices that do not pertain to any part of
          the Derivative Works; and

      (d) If the Work includes a "NOTICE" text file as part of its
          distribution, then any Derivative Works that You distribute must
          include a readable copy of the attribution notices contained
          within such NOTICE file, excluding those notices that do not
          pertain to any part of the Derivative Works, in at least one
          of the following places: within a NOTICE text file distributed
          as part of the Derivative Works; within the Source form or
          documentation, if provided along with the Derivative Works; or,
          within a display generated by the Derivative Works, if and
          wherever such third-party notices normally appear. The contents
          of the NOTICE file are for informational purposes only and
          do not modify the License. You may add Your own attribution
          notices within Derivative Works that You distribute, alongside
          or as an addendum to the NOTICE text from the Work, provided
          that such additional attribution notices cannot be construed
          as modifying the License.

      You may add Your own copyright statement to Your modifications and
      may provide additional or different license terms and conditions
      for use, reproduction, or distribution of Your modifications, or
      for any such Derivative Works as a whole, provided Your use,
      reproduction, and distribution of the Work otherwise complies with
      the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
      any Contribution intentionally submitted for inclusion in the Work
      by You to the Licensor shall be under the terms and conditions of
      this License, without any additional terms or conditions.
      Notwithstanding the above, nothing herein shall supersede or modify
      the terms of any separate license agreement you may have executed
      with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
      names, trademarks, service marks, or product names of the Licensor,
      except as required for reasonable and customary use in describing the
      origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
      whether in tort (including negligence), contract, or otherwise,
      unless required by applicable law (such as deliberate and grossly
      negligent acts) or agreed to in writing, shall any Contributor be
      liable to You for damages, including any direct, indirect, special,
      incidental, or consequential damages of any character arising as a
      result of this License or out of the use or inability to use the
      Work (including but not limited to damages for loss of goodwill,
      work stoppage, computer failure or malfunction, or any and all
      other commercial damages or losses), even if such Contributor
      has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
      the Work or Derivative Works thereof, You may choose to offer,
      and charge a fee for, acceptance of support, warranty, indemnity,
      or other liability obligations and/or rights consistent with this
      License. However, in accepting such obligations, You may act only
      on Your own behalf and on Your sole responsibility, not on behalf
      of any other Contributor, and only if You agree to indemnify,
      defend, and hold each Contributor harmless for any liability
      incurred by, or claims asserted against, such Contributor by reason
      of your accepting any such warranty or additional liability.

   END OF TERMS AND CONDITIONS

   APPENDIX: How to apply the Apache License to your work.

      To apply the Apache License to your work, attach the following
      boilerplate notice, with the fields enclosed by brackets "[]"
      replaced with your own identifying information. (Don't include
      the brackets!)  The text should be enclosed in the appropriate
      comment syntax for the file format. We also recommend that a
      file or class name and description of purpose be included on the
      same "printed page" as the copyright notice for easier
      identification within third-party archives.

   Copyright [yyyy] [name of copyright owner]

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
   
An IAM user is configured with sufficient permissions to perform a deployment to your application and upload artifacts to the S3 bucket.
You have configured the Elastic Beanstalk application and environment.
An S3 bucket has been set up to which deployment artifacts will be copied. Use name ${APPLICATION_NAME}-elasticbeanstalk-deployment to automatically use it.

# bucksbitties

Support
If you'd like help with this pipe, or you have an issue or feature request, let us know on Community.

If you're reporting an issue, please include:

the version of the pipe
relevant logs and error messages
steps to reproduce

Basic usage
Variable	Usage
AWS_ACCESS_KEY_ID (*)	AWS access key.
AWS_SECRET_ACCESS_KEY (*)	AWS secret key.
AWS_DEFAULT_REGION (*)	The AWS region code (us-east-1, us-west-2, etc.) of the region containing the AWS resource(s). For more information, see Regions and Endpoints in the Amazon Web Services General Reference.
APPLICATION_NAME (*)	The name of the Elastic Beanstalk application.
ENVIRONMENT_NAME (*)	Environment name.
ZIP_FILE (*)	The application source bundle to deploy (zip, jar, war).
S3_BUCKET	Bucket name used by Elastic Beanstalk to store artifacts. Default: ${APPLICATION_NAME}-elasticbeanstalk-deployment.
VERSION_LABEL	Version label for the new application revision. Default: ${APPLICATION_NAME}-${BITBUCKET_BUILD_NUMBER}-${BITBUCKET_COMMIT:0:8}.
DESCRIPTION	Description for the new application revision. Default: a URL pointing to the pipeline result page.
WAIT	Wait for deployment to complete. Default: false.
WAIT_INTERVAL	Time to wait between polling for deployment to complete (in seconds). Default: 10.
COMMAND	Command to be executed during the deployment. Valid options are all, upload-only, deploy-only. Default: all.
DEBUG	Turn on extra debug information. Default: false.
(*) = required variable.	
Advanced usage
If COMMAND is set to upload-only

Variable	Usage
AWS_ACCESS_KEY_ID (*)	AWS access key.
AWS_SECRET_ACCESS_KEY (*)	AWS secret key.
AWS_DEFAULT_REGION (*)	The AWS region code (us-east-1, us-west-2, etc.) of the region containing the AWS resource(s). For more information, see Regions and Endpoints in the Amazon Web Services General Reference.
APPLICATION_NAME (*)	The name of the Elastic Beanstalk application.
COMMAND (*)	Command to be used. Use upload-only here.
ZIP_FILE (*)	The application source bundle to deploy (zip, jar, war).
S3_BUCKET	Bucket name used by Elastic Beanstalk to store artifacts. Default: ${APPLICATION_NAME}-elasticbeanstalk-deployment}.
VERSION_LABEL	Version label for the new application revision. Default: ${ENVIRONMENT_NAME}_${BITBUCKET_COMMIT:0:8}_YYYY-mm-dd_HHMMSS).
DESCRIPTION	Description for the new application revision. Default: "".
DEBUG	Turn on extra debug information. Default: false.
If COMMAND is set to deploy-only

Variable	Usage
AWS_ACCESS_KEY_ID (*)	AWS access key.
AWS_SECRET_ACCESS_KEY (*)	AWS secret key.
AWS_DEFAULT_REGION (*)	The AWS region code (us-east-1, us-west-2, etc.) of the region containing the AWS resource(s). For more information, see Regions and Endpoints in the Amazon Web Services General Reference.
APPLICATION_NAME (*)	The name of the Elastic Beanstalk application.
COMMAND (*)	Command to be used. Use deploy-only here.
ENVIRONMENT_NAME (*)	Environment name.
VERSION_LABEL	Version label for the new application revision. Default: ${ENVIRONMENT_NAME}_${BITBUCKET_COMMIT:0:8}_YYYY-mm-dd_HHMMSS).
WAIT	Wait for deployment to complete. Default: false.
WAIT_INTERVAL	Time to wait between polling for deployment to complete (in seconds). Default: 10.
DEBUG	Turn on extra debug information. Default: false.

git clone https://buckobit@bitbucket.org/atlassian/aws-elasticbeanstalk-deploy.git

- pipe: atlassian/aws-elasticbeanstalk-deploy:0.6.0
  variables:
    AWS_ACCESS_KEY_ID: '<string>'
    AWS_SECRET_ACCESS_KEY: '<string>'
    AWS_DEFAULT_REGION: '<string>'
    APPLICATION_NAME: '<string>'
    ENVIRONMENT_NAME: '<string>'
    ZIP_FILE: '<string>'
    # S3_BUCKET: '<string>' # Optional.
    # VERSION_LABEL: '<string>' # Optional.
    # DESCRIPTION: '<string>' # Optional.
    # WAIT: '<boolean>' # Optional.
    # WAIT_INTERVAL: '<integer>' # Optional.
    # COMMAND: '<string>' # Optional.
    # DEBUG: '<boolean>' # Optional.
	
	This pipe deploys a new version of an application to an Elastic Beanstalk environment associated with the application.

With Elastic Beanstalk, you can quickly deploy and manage applications in the AWS Cloud without worrying about the infrastructure that runs those applications. Elastic Beanstalk reduces management complexity without restricting choice or control. You simply upload your application, and Elastic Beanstalk automatically handles the details of capacity provisioning, load balancing, scaling, and application health monitoring.

For advanced use cases and best practices, we recommend build once and deploy many approach. So, if you have multiple environments we recommend using the COMMAND variable to separate your CI/CD workflow into different operations / pipes:

COMMAND: 'upload-only': It will upload the artifact and release a version in Elastic Beanstalk.
COMMAND: 'deploy-only': It will deploy the specified version to the desired environment(s)

<script src="https://apis.google.com/js/platform.js"></script>

<div class="g-ytsubscribe" data-channel="GoogleDevelopers" data-layout="full" data-theme="dark" data-count="default"></div>

<script async src="https://cdn.jsdelivr.net/npm/perfops-rom"></script>
