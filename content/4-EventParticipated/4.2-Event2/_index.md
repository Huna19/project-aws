---
title: "Event 2"
date: 2024-01-01
weight: 2
chapter: false
pre: " <b> 4.2. </b> "
---

# Learnings from "AWS Community Day (05/23/2026)"

### Core Focus of the Event

- Deliver deep technical updates on AWS innovations — especially AI/ML advancements, Multi-Agent architecture patterns, and infrastructure cost optimization.
- Facilitate networking opportunities to learn directly from engineers at major enterprises.
- Analyze real-world implementations: credit risk assessment systems, Second Brain architectures, and CloudFront deployment patterns.

### Speakers on Stage

- **Anh Tinh**: Build second brain
- **Hai Anh**: Friendly AI Assistant with Amazon Q
- **Thinh**: From Edge To Origin: CloudFront as Your Foundation
- **Team VIB**: 36 hrs with LotusHacks – Building UTMorpho from Idea to Reality
- **Dao Duc**: Deep dive talk: How LLM actually works
- **Cat Vy**: Enterprise-Grade Multi-Agent System: The Case of Startup Credit Scoring

### Technical Deep Dives

Six highly technical sessions filled the agenda:

#### 1) Context Architecture & Second Brain Design (Anh Tinh)

- **Why AI underperforms**: Poor responses usually stem from input lacking proper context, not weak models.
- **The "Kitchen Sink" Anti-Pattern**: Dumping entire documents into the chat window doesn't just reduce accuracy — it wastes tokens.
- **Context Framework Design**: To treat AI as a "Second Brain", structure inputs like delegating to a human: Goal + Relevant info + Constraints + Success criteria.
- **Memory Pipeline**: A complete system flows through: Store → Retrieve → Generate → Learn.

#### 2) Enterprise Virtual Assistants & Agentic AI (Hai Anh)

- **The Enterprise Data Problem**: Teams repeatedly execute manual, time-consuming tasks while hunting for fragmented information.
- **Amazon Quick Suite Capabilities**: Agentic AI consolidates the user experience, accelerating the Insight-to-Action cycle.
- **Integration Surface**: Direct connections to 40+ data connectors, internal databases, web search, and thousands of 3rd-party actions.
- **Responsible AI Enforcement**: Data safety through Governance, Access controls, and Guardrails that meet legal requirements.

#### 3) Edge Network Optimization via Amazon CloudFront (Thinh)

- **The "Bill Shock" Scenario**: Pay-as-you-go pricing creates financial risk during traffic spikes or attacks — bills can hit $100,000 unexpectedly.
- **Fixed-Price Package Solution**: AWS bundles CDN, WAF, Anti-DDoS, Route 53, and S3 into a fixed-cost offering for financial predictability.
- **Edge Compression Performance**: Automatic HTTP compression reduces download size by 82% and latency by 81%. HTTP/3 (QUIC/UDP) enables parallel multiplexing of static assets.
- **Origin Cloaking Strategy**: Origin Access Control (OAC) or Custom Headers completely hide origin servers from public internet exposure.

#### 4) 36-Hour Build Sprint at LotusHacks (Team VIB)

- **Rapid Prototype Development**: UTMorpho was designed and deployed in 36 hours using Claude Sonnet 4 in US-East-1.
- **Primary Technical Barrier**: The team hit "AI Overgeneration" issues and repeatedly reached Token Limits under deadline pressure.
- **Key Learning**: "Real Frustration Creates Real Ideas". In hackathons, Team Sync and stamina outweigh idea volume.

#### 5) LLM Nondeterminism at Scale (Dao Duc)

- **The Temperature = 0 Illusion**: Setting T=0 should theoretically produce identical outputs. In practice, accuracy varies by 15%, and best/worst run gaps reach 70% with identical prompts.
- **Technical Root Cause**: Parallel floating-point GPU operations lack associativity: (a+b)+c != a+(b+c). Additionally, Inference batching alters calculations for individual requests.
- **Mitigation Approach**: Build error-tolerant systems, implement Majority voting, and consider Temperature=0.1 to prevent infinite vocabulary loops.

#### 6) Enterprise Multi-Agent Architecture (Cat Vy)

- **Traditional Banking & Single Agent Limits**: Startups face rejection due to missing financial reports/collateral. A single AI Agent causes Context limits, diluted expertise, no Checks & Balances, and creates a Single Point of Failure.
- **Virtual Credit Committee Design**: A specialized agent ensemble: Manager, Financial Analyst, Market Analyst, Team Evaluator, Risk Assessor, and Compliance.
- **Operational Impact (ROI)**: Approval time dropped from 2-3 weeks to 2-4 hours. Decision costs fell from ~100M VND to under 5M VND, while approval rates doubled to 35-45%.
- **Deployment Stack**: Dockerized, pushed to Amazon ECR, integrated into Bedrock AgentCore Runtime, connected via AWS Lambda, exposed through API Gateway.

### Core Insights

- Recognized the paradigm shift from single-model AI to Multi-Agent architectures for solving complex, branching enterprise problems.
- Gained sharper awareness of Security & Compliance (Guardrails) importance when deploying AI to Production.
- Understood latency optimization through CloudFront and practical Amazon Q integration patterns for daily workflows.
- Grasped LLM nondeterminism fundamentals and fault-tolerant design principles when building AI-dependent systems.

### Planned Applications

- Investigate **Amazon Q** integration for debugging workflows and AWS documentation navigation to save time.
- Network Architecture: Prioritize **CloudFront** edge deployment combined with WAF and OAC to accelerate page loads, hide origin servers, and enforce security.
- Future AI feature designs will decompose logic into specialized "Agents" rather than cramming everything into a single prompt.
- Build a prompt-writing framework around the 4 elements: Goal, Relevant Info, Constraints, Success Criteria.

### Experience Reflection

This event delivered extremely high technical density. Where Event 1 leaned toward career guidance and basic prompt optimization, Event 2 jumped straight into system architecture and how large enterprises deploy AI securely and cost-effectively. Cat Vy's Multi-Agent credit scoring case study stood out for painting a clear Enterprise-grade AI picture with compelling ROI numbers. The "Bill Shock" problem and CloudFront solution also provided a highly practical lesson for upcoming projects.

#### Event Photos
<div style="display:flex;flex-wrap:wrap;gap:10px;align-items:flex-start">
  <img src="/images/4-EventParticipated/4.2-Event2/0af18e585985d8db819420.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/1c14f9bc2e61af3ff67019.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/1f91f03f27e2a6bcfff326.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/235701fad62757790e3627.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/3dfd2c55fb887ad6239912.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/53ed98464f9bcec5978a14.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/5b603dceea136b4d320223.jpg" style="width:220px;height:auto" />
  <img src="/images/4-EventParticipated/4.2-Event2/64fbaf53788ef9d0a09f21.jpg" style="width:220px;height:auto" />

</div>
