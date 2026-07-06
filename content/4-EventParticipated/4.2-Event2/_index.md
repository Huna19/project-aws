---
title: "Event 2"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 4.2. </b> "
---

# Event Recap — AWS Community Day (05/23/2026)

AWS Community Day on May 23, 2026 packed 6 deep technical sessions into one day — spanning AI/ML, Multi-Agent systems, CloudFront architecture, and real hackathon war stories.

---

## Speakers & Topics

| Speaker | Topic |
|---|---|
| Anh Tinh | Build a Second Brain |
| Hai Anh | Friendly AI Assistant with Amazon Q |
| Thinh | From Edge To Origin: CloudFront as Your Foundation |
| Team VIB | 36 hrs with LotusHacks – Building UTMorpho from Idea to Reality |
| Dao Duc | Deep Dive: How LLM Actually Works |
| Cat Vy | Enterprise-Grade Multi-Agent System: Startup Credit Scoring |

---

## Session Breakdown

### Anh Tinh — Building a Second Brain with AI

Anh Tinh started with something everyone has experienced: ask AI a question, get a vague answer that isn't usable. The problem usually isn't a weak model — it's input that lacks context.

The session introduced a framework for structuring AI input like you're delegating to a person, built around 4 components:
- **Goal** — what you specifically want to achieve
- **Relevant info** — only what's actually needed, not everything
- **Constraints** — technical limits, requirements, or restrictions
- **Success criteria** — how to know whether the output is correct

Also covered was a memory architecture for AI systems: **Store → Retrieve → Generate → Learn** — how a complete AI system should operate rather than just being a one-way chatbot.

---

### Hai Anh — Enterprise AI Assistant with Amazon Q

Hai Anh addressed the operational pain points enterprises face: employees repeating manual tasks, information scattered across systems, too much time spent getting from data to a decision.

**Amazon Q** and the Agentic AI suite were introduced as a way to shorten that loop: direct connections to 40+ data sources, internal search, and the ability to take action rather than just answer questions. The standout detail was the **Guardrails** mechanism — controls that prevent AI from doing things it shouldn't, ensuring enterprise compliance.

---

### Thinh — CloudFront from Edge to Origin

This session tackled a very real problem startups run into: **Bill Shock** — an AWS bill that spikes unexpectedly due to traffic surges or DDoS attacks.

Thinh walked through how CloudFront is more than just a CDN — it's the first layer of defense:
- **WAF integration** blocks malicious requests before they reach the backend
- **Automatic compression** reduces payload size by 82% and latency by 81%
- **HTTP/3 (QUIC)** enables parallel loading of multiple files simultaneously
- **Origin Cloaking** via OAC/Custom Headers completely hides the origin server
- **Fixed-price bundles** including CDN + WAF + Anti-DDoS for predictable cost control

---

### Team VIB — 36 Hours at LotusHacks

Team VIB shared the story of building **UTMorpho** in 36 hours at LotusHacks, powered by Claude Sonnet 4 on US-East-1.

The most interesting part was the real friction they hit: AI kept generating far more content than needed (AI Overgeneration), and token limits got hit right when deadline pressure was highest. Their final lesson: **"Real Frustration Creates Real Ideas"** — actual pressure produces better ideas, and in a hackathon, team synchronization matters more than the volume of ideas.

---

### Dao Duc — How LLMs Actually Work

The most technical session of the day. Dao Duc dismantled a common assumption: **Temperature = 0 does not mean output is always the same**.

In practice: accuracy still fluctuates by up to 15%, and the gap between best and worst runs can reach 70% using identical prompts. The root cause is how GPUs process floating-point operations in parallel — the math isn't associative, so processing order affects results.

The practical takeaway: design systems that **tolerate variance**, use **Majority Voting**, and stop expecting perfectly consistent AI output.

---

### Cat Vy — Multi-Agent Credit Scoring for Startups

The most impressive case study of the day. Cat Vy presented a real problem: startups getting rejected by banks because they lack the financial reports or collateral that traditional systems require.

The solution was building a **Virtual Credit Committee** with 6 specialized agents: Manager, Financial Analyst, Market Analyst, Team Evaluator, Risk Assessor, and Compliance — each handling a distinct angle, then combining into a final decision.

The results were concrete:
- Approval time: from 2–3 weeks → 2–4 hours
- Cost per decision: from ~100M VND → under 5M VND
- Approval rate increased to 35–45%

Deployment stack: Docker → Amazon ECR → Bedrock AgentCore Runtime → AWS Lambda → API Gateway.

---

## What I'm Taking Back

Event 2 was significantly more technical than Event 1. Every session had something immediately applicable:

- **Context engineering**: from now on, prompts will be structured around Goal + Relevant info + Constraints + Success criteria
- **CloudFront**: adding to the hands-on practice list, especially WAF + OAC
- **Multi-Agent**: instead of one long prompt doing everything, think about splitting into smaller agents with clear responsibilities
- **LLM nondeterminism**: stop expecting 100% consistent AI output — design systems that can handle variance

#### Event Photos

<div style="display:flex;flex-wrap:wrap;gap:10px;align-items:flex-start">
  
  <img src="/images/4-EventParticipated/4.2-Event2/z7866450114341_f4f7bf1c450c1fbfc72d663d28be7689.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z7866450150269_87bf550e28462644de70351a8524597e.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8012727405347_74ddedcf5bd410288321f619818306df.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8012727414598_5b95973bda3c8d9c72fdbc89eb5bd78d.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8012727420692_398410f9e2c81cb6375187bde10a7a43.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8013051068612_255e1ebc81570508ceeada2dfe8697ab.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/z8013051079376_a0aad7626d002edfd3fd04d548015aa1.jpg" style="width:220px;height:auto" />
</div>
