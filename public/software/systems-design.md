# Systems Design

## What to look for in a cloud hosting solution

- If IPs are blacklisted, i.e. by the company you work for
- Encryption of sensitive data

## SSDs vs HDDs

- The traditional spinning hard drive is the basic non-volatile storage on a computer. That is, information on it doesn't "go away" when you turn off the system, unlike data stored in RAM. ([source](https://www.pcmag.com/news/ssd-vs-hdd-whats-the-difference#:~:text=the%20traditional%20spinning%20hard%20drive%20is%20the%20basic%20non-volatile%20storage%20on%20a%20computer.%20that%20is%2C%20information%20on%20it%20doesn't%20%22go%20away%22%20when%20you%20turn%20off%20the%20system%2C%20unlike%20data%20stored%20in%20ram.))
- A hard drive is essentially a metal platter with a magnetic coating that stores your data ([source](https://www.pcmag.com/news/ssd-vs-hdd-whats-the-difference#:~:text=a%20hard%20drive%20is%20essentially%20a%20metal%20platter%20with%20a%20magnetic%20coating%20that%20stores%20your%20data))
- A read/write head on an arm accesses the data while the platters are spinning. ([source](https://www.pcmag.com/news/ssd-vs-hdd-whats-the-difference#:~:text=a%20read%2Fwrite%20head%20on%20an%20arm%20accesses%20the%20data%20while%20the%20platters%20are%20spinning.))
- An SSD performs the same basic function as a hard drive, but data is instead stored on interconnected flash-memory chips that retain the data even when there's no power flowing through them. ([source](https://www.pcmag.com/news/ssd-vs-hdd-whats-the-difference#:~:text=an%20ssd%20performs%20the%20same%20basic%20function%20as%20a%20hard%20drive%2C%20but%20data%20is%20instead%20stored%20on%20interconnected%20flash-memory%20chips%20that%20retain%20the%20data%20even%20when%20there's%20no%20power%20flowing%20through%20them.))
- SSDs are more expensive than hard drives in terms of dollar per gigabyte. ([source](https://www.pcmag.com/news/ssd-vs-hdd-whats-the-difference#:~:text=ssds%20are%20more%20expensive%20than%20hard%20drives%20in%20terms%20of%20dollar%20per%20gigabyte.))
- Consumer SSDs are rarely found in capacities greater than 2TB, and those are expensive. ([source](https://www.pcmag.com/news/ssd-vs-hdd-whats-the-difference#:~:text=consumer%20ssds%20are%20rarely%20found%20in%20capacities%20greater%20than%202tb%2C%20and%20those%20are%20expensive.))
- SSD vs. HDD Speed This is where SSDs shine. An SSD-equipped PC will boot in far less than a minute, often in just seconds. ([source](https://www.pcmag.com/news/ssd-vs-hdd-whats-the-difference#:~:text=it.-,SSD%20vs.%20HDD,often%20in%20just%20seconds.,-A))
- Because hard drives rely on spinning platters, there is a limit to how small they can be manufactured. ([source](https://www.pcmag.com/news/ssd-vs-hdd-whats-the-difference#:~:text=because%20hard%20drives%20rely%20on%20spinning%20platters%2C%20there%20is%20a%20limit%20to%20how%20small%20they%20can%20be%20manufactured.))
- SSDs have no such limitation, so they can continue to shrink as time goes on. ([source](https://www.pcmag.com/news/ssd-vs-hdd-whats-the-difference#:~:text=ssds%20have%20no%20such%20limitation%2C%20so%20they%20can%20continue%20to%20shrink%20as%20time%20goes%20on.%20))
- The overall takeaway? Hard drives win on price and capacity. SSDs work best if speed, ruggedness, form factor, noise, or fragmentation (technically, a subset of speed) are important factors to you. If it weren't for the price and capacity issues, SSDs would be the hands-down winner. ([source](<https://www.pcmag.com/news/ssd-vs-hdd-whats-the-difference#:~:text=the%20overall%20takeaway%3F%20hard%20drives%20win%20on%20price%20and%20capacity.%20ssds%20work%20best%20if%20speed%2C%20ruggedness%2C%20form%20factor%2C%20noise%2C%20or%20fragmentation%20(technically%2C%20a%20subset%20of%20speed)%20are%20important%20factors%20to%20you.%20if%20it%20weren't%20for%20the%20price%20and%20capacity%20issues%2C%20ssds%20would%20be%20the%20hands-down%20winner.>))

## DNS

- Typically cached, with a TTL of a few hours or a day
  - So that you don't need to do a DNS lookup for the same site over and over, unnecessarily

## Load balancing

- The load balancer can have a public IP address, and route to the individual servers, which can have private IP addresses
- Round robin
  - Downside: one user could be using one server very heavily, and now the load might be uneven. Especially since round robin will keep sending users to that server, even though it's under a heavy load.
- Need to be careful about session data, if you're using it -- don't want session data on multiple servers, that could potentially be mismatched

## Scaling

- Vertical scaling has an upper limit -- you can't just keep scaling up an individual machine
- Horizontal scaling has the added benefit of adding redundancy, for better availability
- But, it's simpler to vertically scale
- Scalability is simply measured by the number of requests an application can handle successfully. Once the application can no longer handle any more simultaneous requests, it has reached its scalability limit. ([source](https://touchstonesecurity.com/horizontal-vs-vertical-scaling-what-you-need-to-know/#:~:text=scalability%20is%20simply%20measured%20by%20the%20number%20of%20requests%20an%20application%20can%20handle%20successfully.%20once%20the%20application%20can%20no%20longer%20handle%20any%20more%20simultaneous%20requests%2C%20it%20has%20reached%20its%20scalability%20limit.))
- You can scale these resources through a combination of adjustments to network bandwidth, CPU and physical memory requirements, and hard disk adjustments. ([source](https://touchstonesecurity.com/horizontal-vs-vertical-scaling-what-you-need-to-know/#:~:text=you%20can%20scale%20these%20resources%20through%20a%20combination%20of%20adjustments%20to%20network%20bandwidth%2C%20cpu%20and%20physical%20memory%20requirements%2C%20and%20hard%20disk%20adjustments.))
- Vertical scaling allows data to live on a single node, and scaling spreads the load through CPU and RAM resources for your machines. ([source](https://touchstonesecurity.com/horizontal-vs-vertical-scaling-what-you-need-to-know/#:~:text=vertical%20scaling%20allows%20data%20to%20live%20on%20a%20single%20node%2C%20and%20scaling%20spreads%20the%20load%20through%20cpu%20and%20ram%20resources%20for%20your%20machines.))
- Small- and mid-sized companies most often use vertical scaling for their applications because it allows businesses to scale relatively quickly compared to using horizontal scaling. ([source](https://touchstonesecurity.com/horizontal-vs-vertical-scaling-what-you-need-to-know/#:~:text=small-%20and%20mid-sized%20companies%20most%20often%20use%20vertical%20scaling%20for%20their%20applications%20because%20it%20allows%20businesses%20to%20scale%20relatively%20quickly%20compared%20to%20using%20horizontal%20scaling.))
- One drawback of vertical scaling is that it poses a higher risk for downtime and outages than horizontal scaling. ([source](https://touchstonesecurity.com/horizontal-vs-vertical-scaling-what-you-need-to-know/#:~:text=one%20drawback%20of%20vertical%20scaling%20is%20that%20it%20poses%20a%20higher%20risk%20for%20downtime%20and%20outages%20than%20horizontal%20scaling.))
- Correctly provisioning your resources is the best way to ensure that upgrading was worth it and that your business will not experience the negative effects of vertical scaling. ([source](https://touchstonesecurity.com/horizontal-vs-vertical-scaling-what-you-need-to-know/#:~:text=correctly%20provisioning%20your%20resources%20is%20the%20best%20way%20to%20ensure%20that%20upgrading%20was%20worth%20it%20and%20that%20your%20business%20will%20not%20experience%20the%20negative%20effects%20of%20vertical%20scaling.))
- Horizontal scaling means adding more machines to the resource pool, rather than simply adding resources by scaling vertically. ([source](https://touchstonesecurity.com/horizontal-vs-vertical-scaling-what-you-need-to-know/#:~:text=horizontal%20scaling%20means%20adding%20more%20machines%20to%20the%20resource%20pool%2C%20rather%20than%20simply%20adding%20resources%20by%20scaling%20vertically.))
- Horizontal scaling is favored by DevOps experts because it is done dynamically automatically — scaling based on the load for optimal performance. ([source](https://touchstonesecurity.com/horizontal-vs-vertical-scaling-what-you-need-to-know/#:~:text=horizontal%20scaling%20is%20favored%20by%20devops%20experts%20because%20it%20is%20done%20dynamically%20automatically%20%E2%80%94%20scaling%20based%20on%20the%20load%20for%20optimal%20performance.))
- Both vertical and horizontal scaling can be performed automatically, also known as auto-scaling, as the actual process of scaling is not particularly difficult. ([source](https://touchstonesecurity.com/horizontal-vs-vertical-scaling-what-you-need-to-know/#:~:text=both%20vertical%20and%20horizontal%20scaling%20can%20be%20performed%20automatically%2C%20also%20known%20as%20auto-scaling%2C%20as%20the%20actual%20process%20of%20scaling%20is%20not%20particularly%20difficult.))

## Caching

- Take advantage of the locality of reference principle: recently requested data is likely to be requested again. ([source](https://medium.com/must-know-computer-science/system-design-caching-acbd1b02ca01#:~:text=take%20advantage%20of%20the%20locality%20of%20reference%20principle%3A%20recently%20requested%20data%20is%20likely%20to%20be%20requested%20again.))
- Exist at all levels in architecture, but often found at the level nearest to the front end. ([source](https://medium.com/must-know-computer-science/system-design-caching-acbd1b02ca01#:~:text=exist%20at%20all%20levels%20in%20architecture%2C%20but%20often%20found%20at%20the%20level%20nearest%20to%20the%20front%20end.))
- Caching consists of 1. precalculating results (e.g. the number of visits from each referring domain for the previous day) 2. pre-generating expensive indexes (e.g. suggested stories based on a user’s click history) 3. storing copies of frequently accessed data in a faster backend (e.g. Memcache instead of PostgreSQL. ([source](https://medium.com/must-know-computer-science/system-design-caching-acbd1b02ca01#:~:text=Caching%20consists,of%20PostgreSQL.))

### Layers of caching

- 2.1 Client-side. Use case: Accelerate retrieval of web content from websites (browser or device) Tech: HTTP Cache Headers, Browsers ([source](https://medium.com/must-know-computer-science/system-design-caching-acbd1b02ca01#:~:text=2.1,Browsers))
- 2.2 DNS Use case: Domain to IP Resolution Tech: DNS Servers Solutions: Amazon Route 53 ([source](https://medium.com/must-know-computer-science/system-design-caching-acbd1b02ca01#:~:text=2.2,Route%2053))
- 2.3 Web Server Use case: Accelerate retrieval of web content from web/app servers. Manage Web Sessions (server-side) Tech: HTTP Cache Headers, CDNs, Reverse Proxies, Web Accelerators, Key/Value Stores Solutions: Amazon CloudFront, ElastiCache for Redis, ElastiCache for Memcached, Partner Solutions ([source](https://medium.com/must-know-computer-science/system-design-caching-acbd1b02ca01#:~:text=2.3,Partner%20Solutions))
- 2.4 Application Use case: Accelerate application performance and data access Tech: Key/Value data stores, Local caches Solutions: Redis, Memcached ([source](https://medium.com/must-know-computer-science/system-design-caching-acbd1b02ca01#:~:text=Solutions-,2.4%20Application,Redis%2C%20Memcached,-Note))
  - If horizontally scaled, the nodes are going to have different caches. Which has implications WRT cache misses
  - They also might be redundantly cached, since they could be cached on different servers
  - Solutions for these ^: Global caches, distributed caches
  - If the node doesn't have something in the cache, it'll go to e.g. the database directly
- 2.5 Database Use case: Reduce latency associated with database query requests Tech: Database buffers, Key/Value data stores Solutions: The database usually includes some level of caching in a default configuration, optimized for a generic use case. ([source](https://medium.com/must-know-computer-science/system-design-caching-acbd1b02ca01#:~:text=2.5,use%20case.))
- 2.6 Content Distribution Network (CDN) CDN Use case: Take the burden of serving static media off of your application servers and provide a geographic distribution. ([source](https://medium.com/must-know-computer-science/system-design-caching-acbd1b02ca01#:~:text=2.6,geographic%20distribution.))

## Notes

- A systems design interview is as much about communication with the interviewer ([source](https://blog.pragmaticengineer.com/system-design-interview-an-insiders-guide-review/#:~:text=a%20systems%20design%20interview%20is%20as%20much%20about%20communication%20with%20the%20interviewer))
- One thing you should avoid is "just memorizing" the approaches of the problems. ([source](https://blog.pragmaticengineer.com/system-design-interview-an-insiders-guide-review/#:~:text=one%20thing%20you%20should%20avoid%20is%20%22just%20memorizing%22%20the%20approaches%20of%20the%20problems.))

## Links

- [High Scalability -](http://highscalability.com/blog/category/example)
- [Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems: Kleppmann, Martin: 9781449373320: Amazon.com: Books](https://www.amazon.com/Designing-Data-Intensive-Applications-Reliable-Maintainable/dp/1449373321?tag=gregdoesit-20&geniuslink=true)
- [System Design Interview - An Insider's Guide](https://courses.systeminterview.com/courses/system-design-interview-an-insider-s-guide?ref=c89a35)
- [donnemartin/system-design-primer: Learn how to design large-scale systems. Prep for the system design interview. Includes Anki flashcards.](https://github.com/donnemartin/system-design-primer)
