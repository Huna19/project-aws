---
title: "Event 3"
date: 2024-01-01
weight: 3
chapter: false
pre: " <b> 4.3. </b> "
---

# Notes from "FCAJ Meetup (06/13/2026)"

### What the Event Set Out to Do

- Deliver an unfiltered, realistic picture of what Engineers (DevOps, Data Analytics) actually do at multinational corporations, cutting through common student misconceptions.
- Examine corporate culture, global working standards, and sustainable career roadmaps from entry-level through expert.
- Inspire attendees to leverage tech communities (AWS) as a career accelerator and a platform to spread knowledge.

### Who Spoke

- **Mr. Trong H. Truong** (DevOps Engineer @ Endava Vietnam): "What does a DevOps Engineer really do?"
- **Mr. Dat Pham** (Data Analytics Engineer) & **Mr. Cuong Nguyen** (Process Engineer): "Real stories and culture at multinational corporations"
- **Mr. Danh Hoang Hieu Nghi** (AI Engineer): "From First Cloud AI Journey to AWS Partner"
- **Dinh Trung Kien & Nguyen Minh Tho**: "A scalable URL shortening service on AWS"

### Session Highlights

Four highly practical sessions rounded out the day:

#### 1) Dinh Trung Kien & Nguyen Minh Tho — Scalable URL Shortening on AWS

- **Design Goal**: Not just a fragile MVP — a production-grade URL shortener built for scalability, security, and low latency.
- **Pitfalls of the Naive Approach**: A basic Frontend → Backend → Database stack suffers from SPOF, poor horizontal scaling, high read latency, and no edge protection.
- **AWS Architecture Used**:
  - **Edge Layer**: Amazon CloudFront + AWS WAF to block bad traffic and distribute static content from Amazon Amplify.
  - **App Layer**: Containerized backend on Amazon ECS (Fargate) with an Application Load Balancer routing traffic into Private Subnets.
- **Key Generation Service (KGS)**: A background service pre-generates short codes and pushes them into a Redis queue (`LPUSH`) — eliminating on-demand generation latency entirely.
- **Write Path**: The backend pops a ready-made code from Redis (`RPOP`), maps it to the original URL, and writes to DynamoDB. No generation delay.
- **Read Path (Cache-aside)**: ElastiCache for Redis is checked first. DynamoDB is only queried on a cache miss, dramatically reducing primary database load.

#### 2) Trong H. Truong — The Real DevOps Job Description

- **Myth vs. Reality**: Most people picture DevOps as CI/CD pipelines, Docker/K8s commands, or the midnight "server hero". The actual job is broader: on-call duties, incident handling, access management, cost analysis, and Ownership clarification.
- **What to study first**: Tools always evolve — chase Fundamentals instead: Linux, Networking, Git, Containers, and one programming language (Python/Golang).
- **Hard-won lessons**: Copy-pasting commands online doesn't mean understanding them. Always ask "Why" before "How". Communication is a core DevOps competency. Use AI to sharpen your skills — not to replace your thinking.

#### 3) Dat Pham & Cuong Nguyen — MNC Life, Unfiltered

- **Survival Skills**: Beyond technical skills, MNC work demands Critical Thinking, Communication, Problem Solving, and "Data Storytelling".
- **5-Level Career Ladder**: Follower (executes instructions) → Learner (proactive self-development) → Problem Solver (resolves issues end-to-end) → System Thinker (sees the big picture, optimizes long-term) → Super Star (strategic driver and leader).
- **No-Blame Post-Mortem Culture**: When something breaks, tech MNCs focus on finding the root cause to fix the system — not assigning blame to individuals.
- **"Right Work" Philosophy**: Three pillars — Being Human (inner self-management), Being Professional (serving through expertise), Being a Citizen (national responsibility, tech legacy).

#### 4) Danh Hoang Hieu Nghi — From Student to AWS Partner

- **8-Step Roadmap**: Student Curiosity → Right Environment (First Cloud AI Journey) → Hands-on Labs → Demonstrating Capability (Portfolio) → Becoming an AWS Partner → Giving Back to the Community.
- **Why Community Matters**: Getting a job is just the starting line. Active community engagement (AWS Student Builder Group, AWS Community Builder) unlocks a strong network plus real support: cert vouchers, AWS Credits, and exclusive swag.

### Core Takeaways

- **Clear signal**: Tools change constantly — solid Fundamentals and System Thinking are what carry engineers for the long haul.
- **MNC Entry Mindset**: Shift from "getting it done" to "getting it done right (to standard)", paired with a No-Blame spirit for continuous improvement.
- **Value of giving back**: Technical depth combined with community support builds one of the strongest career launchpads available.
- **System Design Thinking**: Internalized Separation of Concerns (decoupling Read/Write paths), Defense at the Edge (WAF/CloudFront), and Pre-computation over On-demand (calculate early, not at request time).

### How I'll Apply These Lessons

- **Study with intent**: Break the copy-paste habit. When using AI to generate scripts or configs, force myself to analyze and understand what every line actually does.
- **Upgrade project mindset**: Apply System Thinker thinking to internship projects rather than just executing. Make code performant, anticipate failure modes, and practice clear progress reporting.
- **Personal Branding**: Actively engage with the AWS Student Builder Group to grow a quality Portfolio and work toward community contribution over time.
- **Cache-aside in practice**: Integrate Redis into personal and academic projects to optimize response times for read-heavy APIs.
- **Decouple heavy workloads**: Move expensive tasks off the main execution path using background workers, pre-computing data so the main flow stays responsive.

#### Event Photos
<div style="display:flex;flex-wrap:wrap;gap:10px;align-items:flex-start">
  <img src="/images/4-EventParticipated/4.3-Event3/02fd3145e69867c63e892.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/50400dfdda205b7e02317.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/7223549d8340021e5b5110.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/8319bea7697ae824b16b8.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/92acc71710ca9194c8db1.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/af6eaed3790ef850a11f5.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725852503_c480e27d65a8d82026ded60f6de5b737.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725893603_65bef2a3fcd4f3079cac9e41366508e2.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725803084_7984502197d16c6294cc55c897dc18ea.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725825478_5dd299fe7816c631ca7a99063a7e12a4.jpg" style="width:220px;height:auto" />
</div>
