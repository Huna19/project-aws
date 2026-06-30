---
title: "Week 7 Worklog"
date: 2024-01-01
weight: 1
chapter: false
pre: " <b> 1.7. </b> "
---
### Week 7 Objectives:

* Self-study **Docker** theory: container structure, image management, volumes.
* Practice writing an optimized **Dockerfile** to package a personal backend application.
* Hands-on lab: pull image from **Docker Hub** to **EC2** and launch container.
* Research integrating **Cypress** into the **CI/CD** pipeline.

### Tasks to be carried out this week:
| Day | Task                                                                                                                                                                                                   | Start Date | Completion Date | Reference Material                        |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------- | --------------- | ----------------------------------------- |
| 2   | - Self-study basic **Docker** theory: container structure, comparison with VMs <br> - Learn how **Docker Engine** works <br> - Install Docker on local machine                                           | 06/01/2026 | 06/01/2026      |                                           |
| 3   | - Learn **Docker Image** management: build, tag, push/pull from Docker Hub <br> - Learn **Docker Volume**: how to mount data, persist data between containers                                            | 06/02/2026 | 06/02/2026      |                                           |
| 4   | - Practice writing an optimized **Dockerfile** for personal backend application <br> - Build and test container running locally                                                                          | 06/03/2026 | 06/03/2026      |                                           |
| 5   | - Hands-on lab: pull image from **Docker Hub** to **EC2** and launch container <br> - Compare deployment with PM2 (weeks 1–2) vs Docker container                                                        | 06/04/2026 | 06/04/2026      |                                           |
| 6   | - Research methods to integrate testing tool **Cypress** into **CI/CD** pipeline <br> - Ensure Cloud application quality through automated testing                                                        | 06/05/2026 | 06/05/2026      |                                           |


### Week 7 Achievements:

This week I moved into a new area: **Docker**. Previously, I always deployed backend to EC2 using **PM2** directly (weeks 1–2), now I learned how to package into containers — cleaner, easier to manage, and consistent between local and production.

The theory started from basics: container structure, Docker Engine, image management, volumes. Mid-week I wrote an optimized **Dockerfile** for my personal backend then built + tested locally. Then the hands-on lab: pulled image from **Docker Hub** to **EC2** and launched the container — compared to PM2, first-time setup takes longer but management afterwards is much easier.

At the end of the week, I researched integrating **Cypress** into the **CI/CD** pipeline to ensure Cloud application quality through automated testing. Haven't set up a complete pipeline yet but understood the overall flow: push code → build Docker → run Cypress tests → deploy.


