# Notifiers

Payara Server's Notification service ships with a number of notifiers that are fully integrated to communicate with a variety of channels. As of {{ book.currentVersion }}, the available notifiers are as follows:

* Log Notifier: Default notifier that writes notification events to the server's log
* [Email Notifier](): Sends notifications as emails using a managed Java Mail session.
* [JMS Notifier](): Sends notifications as JMS messages using a managed message queue.
* [Event Bus](): Distributes notifications to the Hazelcast Event Bus.
* [HipChat Notifier](hipchat-notifier.md): Sends notifications events to a Hipchat room.
* [Slack Notifier](slack-notifier.md): Sends notification events to a Slack channel.
* [SNMP Notifier](snmp-notifier.md): Sends notification events as SNMP traps that can be captured by _network management systems_.
* [XMPP Notifier](xmpp-notifier.md) : Sends notification events using the XMPP protocol to remote servers to be pushed to a multi-user chat room.