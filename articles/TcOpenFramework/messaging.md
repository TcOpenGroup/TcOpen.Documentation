# Messaging

Messaging system provides a simple mechanism for posting various information (state, diagnostics, etc.) to the higher-level application (e.g. HMI/SCADA).

Each [TcoObject](~\api\TcoCore\PlcDocu.TcoCore.TcoObject.html) contains a messenger that allows reporting information about that object to a higher-level application.

## Usage

In order to post a message, you access `Messenger` of the object (TcoObject).

~~~iecst
IF(applo13.LunarModule.OxigenTankLowLimit) THEN
    apolo13.LunarModule.Messenger.Warning('Huston, we have a problem');
END_IF;    


IF(appolo13.LunarModule.OxigenTankEmpty) THEN
    apolo13.LunarModule.Messenger.Catastrophic('Huston we are not going to make it to the Moon.');
END_IF;   

IF(appolo13.OceanSplash) THEN
    apolo13.Messenger.Info('Huston this is Eagle.');
END_IF; 
~~~

## Prioritisation

Each object has a single instance of a message holder. This instance is located in `TcoObject.Messenger._mime`. When there are more messages posted in the same cycle, the messenger will prioritize the one with the highest severity.

More messages in the same cycle will reflect in the counter `PerCycleCount`, which will be greater than `1`.

## Message structure

| Item          | Description                                              |
|---------------|----------------------------------------------------------|
| TimeStamp     | Time-stamp of the last occurrence of the message.        |
| Text          | Arbitrary message text.                                  |
| Identity      | Identity of the object that posted this message          |
|               | (for future expansion and buffering).                    |
| Category      | Message category indicating the severity of the message. |
| Cycle         | Context cycle in which the message was posted.           |
| PerCycleCount | Counter of messages posted in the same context cycle     |


## Message categories

### Trace (Verbose)

Use when you need to track detailed information about the internal states of the program for detailed visibility. This is the lowest level of category that can be used in production for detailed observation of the PLC program.

### Debug (Debug)

Debug category message to be used for debugging purposes only. Use when you need to report debug information for you as a programmer.

### Info (Information)

Use this category when you want to report a notification that may be of interest to the user, but does not adveresly affect a process.

### Notification (Information)

Use when you want to deliver information to the user that user needs to be notified, some non essential activity is required.

### Warning (Warning)

Use this category when you want to report to the user information about a possible problem that may adversely affect a process.
Information in this category aims to help the user to identify a problem; the cause of such problem does not necessarily stop the process.

### Error (Error)

Use this category when there is a failure that cannot be immediately recovered and an intervention is needed. This is typically a situation when a device fails to deliver the expected result. Do not use this category to report information about the failed process like measurement or detection.

### Programming error (Error)

Use this category to inform about a possible programming error, defect in settings, or missing information at a level of programming or system or process settings.

### Critical  (Fatal)

Use this category when a critical error occurred, which is not recoverable by software (reset/restore), and a detailed inspection is required (TotalStop, Safety, etc.).

### Catastrophic (Fatal)

Use this category when there is a situation when the device cannot continue operations due to irrecoverable failure.

## How to access the message

When you try to read the messages from a non-inxton application, you will need to evaluate that the message is valid. The validity of the message can be determined by comparing the equality of `TcoObject._mime.Cycle` with `Context._startCycleCount`. When these two values equal, the message is valid. The equality evaluation should occur in the higher-level application, not in the PLC.

[TcoLogger integration](logger.md#tcomessenger-and-tcologger)