---
layout: post
title: Rubric for Technology Decisions
date: 2025-02-05
lang: en
---


## Intro
There are various strategies for making business decisions. Sometimes they
aren't used if the decision doesn't seem important enough. The problem with
technology decisions is that it may not seem like an important decision until
much later on. These decisions can have a multi-million dollar impact on a
business, but often their rationale is hidden in secret (if any rationale is
used at all). They are a bet into the future. They can pay dividends or bring
productivity to an agonizing, business-crippling drip. 


> By _technology_, I'm referring to languages, frameworks, systems, and tooling
> that developers will use to do their job everyday. 

Technology decisions can be given the rigor and explicit nature of other
business decisions with a structured document. There are many such structures to
choose from, but I haven't seen a concise, easy to use rubric for assessing a
technology decision, so one is presented here. It is provided as a tool for
assessing the quality of a technology decision. Consider these ideas when you
are about to make a technology decision and hopefully it will stand the test of
time.

**Technology Decision Rubric:**

There are three facets to assess:
1. Domain of the Problem 
1. Experience of the team
1. Offerings of the community 

## Domain of the Problem 
Every project has a problem it is trying to solve. What is the domain of the
problem? That is a big question and can be hard to answer. Here are some
examples with what I would name the domain in parentheses.

1. I need users to fill out web forms for data entry. (Web forms)
1. I need to process a million events an hour and publish summary data.  (Event Streaming)
1. I need to analyse a medium-sized dataset using statistical calculations. (Statistics)
1. I need to display colorful graphs from an existing API. (UI Dashboard)
1. I need a microprocessor to process an input signal. (Embedded)

Use your best naming skills to define your problem domain.

With a well-defined problem domain, the team can be careful not to over-extend
into other problem domains that would be better solved by another project, or by
buying rather than by building. Focused buildng. This is the goal.

## Experience of the team
This is an obvious one, but sometimes it's overlooked, or underappreciated.
Developers are expected to mold to the project, not the project mold to them.
This makes sense because to much change is bad, but too little is also bad, and
this comfort with the status-quo is something that should be challenged - in a
structured way.

Provided they know _what_ to build (also not easy), an experienced team with
well-known tools can provide emmense value. This is the goal. 

## Offerings of the Community

What we are looking for here is up-to-date libraries with many contributors and,
ideally, they are old. Not new libraries; old boring libraries that have been
arround for ages and are commonly used. Libraries that are quick and easy to use
and understand because they have been refined by experience, collaboration, and
craftsmanship. Every library used is less code the team has to develop and
maintain, which lets them focus on business value. This is the goal.

## Using the rubric

When considering one or more options for a language or technology, assess each
of the facets, assigning a number to each, add them up, and compare their
scores.

Score ranges for each facet:
1. Domain of the problem
  - **3 Points** Most projects made with this tech are in this problem domain.
  - **2 Points** Some projects exist, but they are rare.
  - **1 Point**  No projects can be found with this technology in this domain.
2. Experience of the team
  - **3 Points** Most developers on the team have built and deployed something with this tech many times.
  - **2 Points** Some have used it, some have not.
  - **1 Point**  Zero developers have built and deployed working products with this tech.
3. Offerings of the community
  - **3 Points** There are copious amounts of  projects that integrate and support development using this tech.
  - **2 Points** There are a couple open source projects thatsupport or integrate with this tech.
  - **1 Point**  There are zero established, or only a few, small, early-in-development,  projects that support or integrate with this tech.

Total score results:
- 9   - a good technology decision
- 7-8 - risky! look for another option
- 3-6 - consider this a skunkworks project with zero expectations, and the
  project should probably not go to production 

## Other considerations
These haven't been included in the rubric to keep it simple, but these are
potential facets that could be added to your technology decision.

- Are there guides, blog posts, examples, and documentation that are readily
available and easy to use? 
- Is the techology itself easy to learn?

## Examples
    
### Problem 1:
**I need to control lights based on an audio signal.**

Proposed Tech: Rust; _score:_ 6 - skunkworks, research and learning

1. **Problem domain:** _score: 3_ (Embedded)
Seems to have a large user base using this tech with embedded projects and it is called out as a "distinct" domain supported on the website.

2. **Experience of the team:** _score: 1_
One person that has never used Rust
 
3. **Offerings of the community:** _score: 2_
Would be a 3 but many of the supporting libraries are newish, so some issues can be expected, though the quality of tooling and support does seem to be great and getting started is easy because of this.

### Problem 2: 

**I need a multi-step process for users to make choices and enter data based on certain criteria.**

Proposed Tech: Ruby on Rails; _score:_ 9 - good

1. **Problem domain** _score: 3_ (Web forms)
Most Rails projects are made in this domain.
2. **Experience of the team** _score: 3_
One developer has 10 years, and one developer will be hired, and Ruby is one of the more common languages.
3. **Offerings of the community** _score: 3_
Rails is a major ecosystem and old, many libraries are easy to use because they conform to Rails conventions

### Problem 3: 
**I need to store and query many different entities which are very interrelated, and I need and auditable record of changes.**

Proposed tech: Datomic _score: 7_ - Risky. Is there another option?

1. **Problem domain** _score: 3_ (Graph Database)
This database fits the needs perfectly, a graph database can handle many relations and it is immutable, meaning change tracking is built-in.
2. **Experience of the team** _score: 1_
No one on the team has used Dataomic, let alone a graph database. The learning curve would be high. 
3. **Offerings of the communtity** _score: 3_
There are a few libraries that support an alternative schema syntax and migrations. The main offerings come from a paid license, which is quite nice, and offer everything that would be needed to support the database.

## Conclusion
Here we see that this rubric has forced us to be explicit around our thinking
and has helped us segment the concerns about certain tech. Side-by-side
comparisons would be very interesting for someone to read 5 years into the
future. As the world around a project changes, these decisions can be
re-assessed. As your project, people, and problems change, there might be a
better fitting technology - and doing this rigorous thinking might save your
business.
