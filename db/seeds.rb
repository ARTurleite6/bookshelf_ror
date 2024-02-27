# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Book.find_or_create_by!(
  title: 'Kubernetes Up & Running',
  description: "
 In just five years, Kubernetes has radically changed the way developers and ops personnel build, deploy, and maintain
applications in the cloud. With this books's updated third edition, you'll learn how this popular container orchestrator
can help your company achieve new levels of velocity, agility, reliability, and efficiency--whether you're new to
distributed systems or
 have been deploying cloud native apps for some time. Brendan Burns, Joe Beda, Kelsey Hightower, and Lachlan Evenson--
who have worked on Kubernetes at Google and beyond--explain how this system fits into the life cycle of a distributed
application. Software developers, engineers, and architects will learn ways to use tools and APIs to automate scalable
distributed systems for online services, machine learning applications, or even a cluster of Raspberry Pi computers.
  gui shows you how to:
 Create a simple cluster to learn how Kubernetes works Dive into the details of deploying an application using
Kubernetes Learn
 specialized objects in Kubernetes, such as DaemonSets, jobs, ConfigMaps, and secrets Explore deployments that tie
together the lifecycle of a complete application Get practical examples of how to develop and deploy real-world
applications in Kubernetes
",
  cover_url: 'https://m.media-amazon.com/images/I/81fH7yJ8rsL._SL1500_.jpg'
)

Book.find_or_create_by!(
  title: 'Creating Software with Modern Diagramming Techniques: Build Better Software with Mermaid',
  description: "
  Diagrams communicate relationships more directly and clearly than words ever can. Using only text-based markup, create
meaningful and attractive diagrams to document your domain, visualize user flows, reveal system architecture at
any desired level, or refactor your code. With the tools and techniques this books will give you, you'll create a wide
variety of diagrams in minutes, share them with others, and revise and update them immediately on the basis of feedback.
 Adding diagrams to your professional vocabulary will enable you to work through your ideas quickly when working on your
 own code or discussing a proposal with colleagues.
Expand your professional vocabulary by learning to communicate with diagrams as easily and naturally as speaking or
writing.
This books will provide you with the skills and tools to turn ideas into clear, meaningful, and attractive diagrams in
mere minutes, using nothing more complicated than text-based markup. You'll learn what kinds of diagrams are suited to
each of a variety of use cases, from documenting your domain to understanding how complex code pieces together.
 Model your software's architecture, creating diagrams focused broadly or narrowly, depending on the audience.
Visualize application and user flows, design database schemas, and use diagrams iteratively to design and refactor your
application. You'll be able to use technical diagramming to improve your day-to-day workflow. You will better
understand the codebase you work in, communicate ideas more effectively and immediately with others, and more clearly
 document the architecture with C4 diagrams. Manually creating diagrams is cumbersome and time-consuming.
 You'll learn how to use text-based tools like Mermaid to rapidly turn ideas into diagrams. And You'll learn how to
keep your diagrams up to date and seamlessly integrated into your engineering workflow. You'll be better at visualizing
and communicating when you add diagrams to your standard vocabulary.
",
  cover_url: 'https://m.media-amazon.com/images/I/81Qu4QCh0PL._SL1500_.jpg'
)

Book.find_or_create_by!(
  title: 'The Linux Command Line: A Complete Introduction',
  description: "You've experienced the shiny, point-and-click surface of your Linux computer—now dive below and
explore its depths with the power of the command line. The Linux Command Line takes you from your very first terminal
keystrokes to writing full programs in Bash, the most popular Linux shell. Along the way you'll learn the timeless
skills handed down by generations of gray-bearded, mouse-shunning gurus: file navigation, environment configuration,
command chaining, pattern matching with regular expressions, and more. In addition to that practical knowledge, author
William Shotts reveals the philosophy behind these tools and the rich heritage that your desktop Linux machine has
inherited from Unix supercomputers of yore. As you make your way through the books's short, easily-digestible chapters,
you'll learn how to: Create and delete files, directories, and symlinks Administer your system, including networking,
package installation, and process management Use standard input and output, redirection, and pipelines Edit files with
 Vi, the world's most popular text editor Write shell scripts to automate common or boring tasks Slice and dice text
files with cut, paste, grep, patch, and sed Once you overcome your initial 'shell shock,' you'll find that the command
line is a natural and expressive way to communicate with your computer. Just don't be surprised if your mouse starts to
 gather dust.",
  cover_url: 'https://m.media-amazon.com/images/I/71PfXiJBq1L._SL1500_.jpg'
)

Book.find_or_create_by!(
  title: 'The Software Engineer\'s Guidebook: Navigating senior, tech lead, and staff engineer positions at tech
companies and startups (English Edition)',
  description: "
In my first few years as a developer I assumed that hard work was all I needed. Then I was passed over for a promotion
and my manager couldn’t give me feedback on what areas to improve, so I could get to the senior engineer level.
I was frustrated; even bitter: not as much about missing the promotion, but because of the lack of guidance.

By the time I became a manager, I was determined to support engineers reporting to me with the kind of feedback and
support I wish I would have gotten years earlier. And I did. While my team tripled over the next two years, people
became visibly better engineers, and this progression was clear from performance reviews and promotions.

This books is a summary of the advice I’ve given to software engineers over the years – and then some more.

This books follows the structure of a “typical” career path for a software engineer, from starting out as a fresh-faced
software developer, through being a role model senior/lead, all the way to the staff/principle/distinguished level. It
summarizes what I’ve learned as a developer and how I’ve approached coaching engineers at different stages of their
careers.

We cover “soft” skills which become increasingly important as your seniority increases, and the “hard” parts of the job,
 like software engineering concepts and approaches which help you grow professionally.

The names of levels and their expectations can – and do! – vary across companies. The higher “tier” a business is, the
 more tends to be expected of engineers, compared to lower tier places. For example, the “senior engineer” level has
notoriously high expectations at Google (L5 level) and Meta (E5 level,) compared to lower-tier companies. If you work
at a higher-tier business, it may be useful to read the chapters about higher levels, and not only the level you’re
currently interested in.

The books is composed of six standalone parts, each made up of several chapters:

    Part 1: Developer Career Fundamentals
    Part 2: The Competent Software Developer
    Part 3: The Well-Rounded Senior Engineer
    Part 4: The Pragmatic Tech Lead
    Part 5: Role Model Staff and Principal Engineers
    Part 6: Conclusion

Parts 1 and 6 apply to all engineering levels, from entry-level software developer, to principal-and-above engineer.
Parts 2, 3, 4, and 5 cover increasingly senior engineering levels and group together topics in chapters, such as
“Software Engineering,” “Collaboration,” “Getting Things Done,” etc.

Naming and levels vary, but the principles of what makes a great engineer who is impactful at the individual, team, and
 organizational levels, are remarkably constant. No matter where you are in your career, I hope this books provides a
fresh perspective and new ideas on how to grow as an engineer.

Praise for the books

“From performance reviews to P95 latency, from team dynamics to testing, Gergely demystifies all aspects of a software
career. This books is well named: it really does feel like the missing guidebook for the whole industry.”

– Tanya Reilly, senior principal engineer and author of The Staff Engineer's Path

'Spanning a huge range of topics from technical to social in a concise manner, this belongs on the desk of any software
engineer looking to grow their impact and their career. You'll reach for it again and again for sage advice in any
situation.'

– James Stanier, Director of Engineering at Shopify, author of TheEngineeringManager.com
",
  cover_url: 'https://m.media-amazon.com/images/I/61vZlI3gBtL._SL1500_.jpg'
)

Book.find_or_create_by!(
  title: 'Hooked: How to Build Habit-Forming Products',
  description: "
'A must-read for everyone who cares about driving customer engagement' Eric Ries, author of The Lean Startup

'The most high bandwidth, high octane, and valuable presentation I have ever seen on this subject' Rory Sutherland,
vice chairman, Ogilvy & Mather

Nir Eyal reveals how successful companies create products people can't put down - and how you can too

Why do some products capture our attention while others flop? What makes us engage with certain things out of sheer
habit? Is there an underlying pattern to how technologies hook us?

Nir Eyal answers these questions (and many more) with the Hook Model - a four-step process that, when embedded into
products, subtly encourages customer behaviour. Through consecutive 'hook cycles,' these products bring people back
again and again without depending on costly advertising or aggressive messaging.

Hooked is based on Eyal's years of research, consulting, and practical experience. He wrote the books he wished had
been available to him as a start-up founder - not abstract theory, but a how-to guide for building better products.
 Hooked is written for product managers, designers, marketers, start-up founders, and anyone who seeks to understand
how products influence our behaviour.

Eyal provides readers with practical insights to create user habits that stick; actionable steps for building products
people love; and riveting examples from the iPhone to Twitter, Pinterest and the Bible App.
",
  cover_url: 'https://m.media-amazon.com/images/I/81L8JOVXJtL._SL1500_.jpg'
)
