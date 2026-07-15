---
title: "Event 3"
date: 2024-01-01
weight: 3
chapter: false
pre: " <b> 4.3. </b> "
---

# Technical Report: Cloud-Native & DevOps Modernization Sharing Session (06/13/2026)

The FCAJ Meetup on June 13, 2026 brought 4 practical sessions covering real engineering work, corporate culture, and AWS system architecture — mostly from people actively working in the field.

---

## Speakers & Topics

| Speaker | Topic |
|---|---|
| Dinh Trung Kien & Nguyen Minh Tho | Scalable URL Shortening Service on AWS |
| Trong H. Truong (DevOps @ Endava) | What Does a DevOps Engineer Really Do? |
| Dat Pham & Cuong Nguyen | Real Stories & MNC Culture |
| Danh Hoang Hieu Nghi (AI Engineer) | From First Cloud AI Journey to AWS Partner |

---

## Session Breakdown

### Dinh Trung Kien & Nguyen Minh Tho — Production-Grade URL Shortener on AWS

This session tackled a classic System Design problem — not just getting it to work, but getting it right: scalable, secure, and low-latency.

**Problems with the naive approach:**
A direct Frontend → Backend → Database setup has too many weaknesses: Single Point of Failure, hard to scale, high read latency, no protection against attacks.

**The architecture they built:**
- **Edge layer**: CloudFront + WAF to block bad traffic, Amplify to serve static content
- **App layer**: ECS Fargate + ALB routing into Private Subnets

**The most interesting part — Key Generation Service:**
Instead of generating short codes on demand when a request arrives, a background service continuously pre-generates keys and pushes them into a Redis queue (`LPUSH`). When a request comes in, the backend just `RPOP`s a ready-made key — zero generation latency.

**Read path uses Cache-aside**: ElastiCache Redis is checked first, falling back to DynamoDB only on a cache miss — significantly reducing database load.

---

### Trong — What a DevOps Engineer Actually Does

Trong opened by listing what people usually think DevOps is: writing CI/CD pipelines, typing Docker/K8s commands, being the "hero who fixes the server at 2am." Then compared that to reality.

**What DevOps actually covers:**
- Managing infrastructure with **IaC** (Infrastructure as Code) — no more clicking, write code for your infrastructure
- Container and orchestration with **Docker / Kubernetes**
- Cloud operations — provisioning, cost management, scaling
- **System monitoring**: logs, metrics, alerts, on-call duties
- Incident handling, access management, and clarifying Ownership when something breaks

**What to study first?** Don't chase tools — tools constantly change. What matters: **Linux, Networking, Git, basic programming**, and system thinking.

**Hard-learned lessons:**
- Copying commands from StackOverflow without understanding them leads to problems
- Always ask **"Why"** before **"How"**
- **Communication skills** are a core DevOps competency, not optional
- Use AI to learn faster, not to stop thinking

---

### Dat & Cuong — Data Analytics & MNC Culture

**What a Data Analytics Engineer actually does:**
It's not just drawing pretty dashboards — the real work involves:
- Building reports and **dashboards** that track real business metrics (like GMV, conversion rates)
- Analyzing data to find **root causes** when numbers look off
- Proposing concrete solutions backed by data, not intuition
- **Data Storytelling**: knowing how to analyze is not enough — you need to tell the story so stakeholders understand and trust it

**5-level career ladder:**
Follower (executes) → Learner (proactive self-development) → Problem Solver (resolves end-to-end) → System Thinker (sees the big picture, optimizes long-term) → Super Star (strategic driver and leader)

Most newcomers enter as Followers. The jump to **Problem Solver** — handling issues completely without asking for each step — is the most important transition for being trusted with bigger responsibilities.

**MNC culture:**
- **No-Blame Post-Mortem**: when something breaks, don't look for someone to blame — look for the root cause in the system and fix it
- **Caring & Inclusive**: people-first culture — no one gets left behind when facing difficulties
- **"Right Work" philosophy**: 3 pillars — Being Human (inner self-management), Being Professional (serving through expertise), Being a Citizen (community and national responsibility)

---

### Danh — From First Cloud AI Journey to AWS Partner

Danh shared a personal journey laid out across **8 clear stages**, from curious student to AWS Partner and community contributor:

**Stages 1–3 — Building the foundation:**
- Start with **curiosity** — you don't need to be good, just start
- Find the **right environment** like First Cloud AI Journey for proper direction
- Learn from **communities and workshops** — the most practical knowledge source available

**Stages 4–6 — Building real experience:**
- Practice through **hands-on labs** — reading docs is just step one, doing is what makes it stick
- Apply knowledge to **real projects at school** — don't wait until you have a job to start building
- Build a **portfolio** that demonstrates your capability — what hiring managers actually want to see

**Stages 7–8 — Giving back:**
- Become an **AWS Partner** — unlocks collaboration opportunities and real-world projects
- Do the **"Share Back"** — help the next generation, the most meaningful stage of all

**Market trends:**
Danh also shared job market data from Vietnam (2016–2025), showing strong and growing demand for **AI/ML, Data, and Cloud engineers** — the 3 hottest areas that will continue to grow for years.

**Benefits of joining the AWS community:**
Not just networking — joining AWS Student Builder Group or AWS Community Builder also provides:
- **AWS Credits** to practice on real infrastructure
- **Exam vouchers** to certify at low or no cost
- **Swag points** and **badges** recognizing contributions
- Most importantly: meeting the right people at the right time

---

## What I'm Taking Back

Event 3 was different from the first two — less AI, more "professional reality check." Things that stuck:

- The **8-stage career roadmap** is very practical — I'm currently at stages 4–5, which means now is exactly the right time to focus on building portfolio
- **Problem Solver** is the level to aim for right now — no more asking for each step, resolve things end-to-end
- **Data Storytelling** is not a secondary skill — it determines whether your analysis actually gets heard
- **DevOps is about system thinking**, not knowing the most tools
- **Community is a long-term investment** — start participating now, not "when I'm better"

#### Event Photos

<div style="display:flex;flex-wrap:wrap;gap:12px;align-items:flex-start">
  <img src="/images/4-EventParticipated/4.3-Event3/02fd3145e69867c63e892.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/50400dfdda205b7e02317.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/7223549d8340021e5b5110.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/8319bea7697ae824b16b8.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/92acc71710ca9194c8db1.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/af6eaed3790ef850a11f5.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/dba02f1ef8c3799d20d26.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/ed911328c4f545ab1ce49.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725803084_7984502197d16c6294cc55c897dc18ea.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725807073_84fcd3d4313cc421e775a111f2eb946f.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725825478_5dd299fe7816c631ca7a99063a7e12a4.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725831126_11fc0329af32df5ae3a9a9df54015fa5.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725840272_557c064b17e7dec9f7e1ffe307fd9d44.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725852503_c480e27d65a8d82026ded60f6de5b737.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725858895_fa11f2e171ceb3cbad4d26b5d2009e91.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725873656_699c80fd49a8f98c5842b283eeb7f595.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725874996_9e7511356f7d8eec1fc7fe8fe9419f22.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725890856_d4b0b892b684f333ac8edb8f3b515c44.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
  <img src="/images/4-EventParticipated/4.3-Event3/z8012725893603_65bef2a3fcd4f3079cac9e41366508e2.jpg" style="width:calc(33% - 10px);min-width:200px;height:200px;object-fit:cover;border-radius:6px" />
</div>
