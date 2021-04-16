# TcOpen framework 

In order to take full advanate of OOP design TcOpen application has few formal requirements regarding the structure of the actual program. There are several layers of abstraction that aim to decouple actual hardware from software components in order to allow to write the application at the time when structure and layout of harware configuration are unknown. 

Another topic that is TcOpen addressing in rather innovative way is task coordination in cyclically executed environment. TcoOpen framework provides a series of primives to coordinate and execute tasks in granular and organized fashion. 

The entry point of an application is context (TcoContext). Each TcOpen application must have at least one context in that encapsulates the program that uses TcOpen components.

