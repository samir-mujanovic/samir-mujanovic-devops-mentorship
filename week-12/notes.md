## TASK-10: Serverless and Application Services

- ### What is serverless? : 
    - Serverless is a new paradigm in which the developers don’t have to manage servers anymore
    - Initially Serverless == FaaS (Function as a Service)
    - Serverless does not mean there are no servers, it means you just don’t manage / provision / see them

<br>

- ### What is AWS Lambda? :
    - AWS Lambda is a compute service that lets you run code without provisioning or managing servers
    - Lambda runs your code on a high-availability compute infrastructure and performs all of the administration of the compute resources, including server and operating system maintenance, capacity provisioning and automatic scaling, code monitoring and logging
    - With Lambda, you can run code for virtually any type of application or backend service - all with zero administration
    - Just upload your code and Lambda takes care of everything required to run and scale your code with high availability
    - You can set up your code to automatically trigger from other AWS services or call it directly from any web or mobile app
    - You can write Lambda functions in your favorite language (Node.js, Python, Java, Go, Ruby, C#, PowerShell, etc.) and use both serverless and container tools, such as AWS SAM or Docker CLI, to build, test, and deploy your functions

<br>

- ### What is AWS EventBrige? :
    - Amazon EventBridge is a serverless event bus that makes it easy to connect applications together using data from your own applications, integrated Software-as-a-Service (SaaS) applications, and AWS services
    - EventBridge delivers a stream of real-time data from event sources, such as Zendesk, Datadog, or Pagerduty, and routes that data to targets like AWS Lambda
    - You can set up routing rules to determine where to send your data to build application architectures that react in real time to all of your data sources
    - EventBridge makes it easy to build event-driven applications because it takes care of event ingestion and delivery, security, authorization, and error handling for you
    - EventBridge scales to handle your apps’ requirements and use cases, even as they grow to operate at trillions of events per day

<br>

- ### [DEMO] Automated EC2 Control using Lambda and Events:
    Code which I used for this demo:

    Lambda instace stop function:
        This function stop EC2 instances which are defined in environment variable EC2_INSTANCES
    ```python
    import boto3
    import os
    import json

    region = 'eu-central-1'
    ec2 = boto3.client('ec2', region_name=region)

    def lambda_handler(event, context):
        instances=os.environ['EC2_INSTANCES'].split(",")
        ec2.stop_instances(InstanceIds=instances)
        print('stopped instances: ' + str(instances))
    ```
    Lambda instace start function:
    This function start EC2 instances which are defined in environment variable EC2_INSTANCES
    ```python
    import boto3
    import os
    import json

    region = 'eu-central-1'
    ec2 = boto3.client('ec2', region_name=region)

    def lambda_handler(event, context):
        instances=os.environ['EC2_INSTANCES'].split(",")
        ec2.start_instances(InstanceIds=instances)
        print('started instances: ' + str(instances))
    ```
    Lambda protected instance function:
    This function protected EC2 instances, when instance is stopped, it will be started again

    ```python
    import boto3
    import os
    import json

    region = 'us-east-1'
    ec2 = boto3.client('ec2', region_name=region)

    def lambda_handler(event, context):
        print("Received event: " + json.dumps(event))
        instances=[ event['detail']['instance-id'] ]
        ec2.start_instances(InstanceIds=instances)
        print ('Protected instance stopped - starting up instance: '+str(instances))
    ```

<br>

- ### Simple Norification Service(SNS):
    - Amazon Simple Notification Service (Amazon SNS) is a fully managed messaging service for both application-to-application (A2A) and application-to-person (A2P) communication
    - A2A communication can be used for distributed systems, microservices, and serverless applications
    - A2P communication can be used for marketing campaigns, order confirmations, and other notifications
    - Amazon SNS provides topics for high-throughput, push-based, many-to-many messaging
    - Using Amazon SNS topics, your publisher systems can fan out messages to a large number of subscriber endpoints for parallel processing, including Amazon SQS queues, AWS Lambda functions, and HTTP/S webhooks
    - Additionally, SNS can be used to fan out notifications to end users using mobile push, SMS, and email
    - Amazon SNS works closely with AWS CloudTrail to provide you with message-level API activity logging to see details of message-related API calls
    - Amazon SNS is available in all commercial AWS Regions and AWS GovCloud (US) Regions

<br>

- ### Step functions:
    - AWS Step Functions is a serverless function orchestrator that makes it easy to sequence AWS Lambda functions and multiple AWS services into business-critical applications
    - You can use Step Functions to build applications from individual components, each of which performs a discrete function, or task, allowing you to scale and change applications quickly
    - Step Functions provides a graphical console to arrange and visualize the components of your application as a series of steps
    - This makes it simple to build and run multi-step applications
    - Step Functions automatically triggers and tracks each step, and retries when there are errors, so your application executes in order and as expected
    - Step Functions logs the state of each step, so when things do go wrong, you can diagnose and debug problems quickly
    - You can change and add steps without even writing code, so you can easily evolve your application and innovate faster

<br>

- ### API Gateway 101:
    - Amazon API Gateway is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale
    - APIs act as the "front door" for applications to access data, business logic, or functionality from your backend services
    - Using API Gateway, you can create RESTful APIs and WebSocket APIs that enable real-time two-way communication applications
    - API Gateway supports containerized and serverless workloads, as well as web applications
    - API Gateway handles all the tasks involved in accepting and processing up to hundreds of thousands of concurrent API calls, including traffic management, CORS support, authorization and access control, throttling, monitoring, and API version management
    - API Gateway has no minimum fees or startup costs
    - You pay for the API calls you receive and the amount of data transferred out and, with the API Gateway tiered pricing model, you can reduce your cost as your API usage scales

<br>

- ### [AdvancedDemo] Build A Serverless App - Pet-Cuddle-o-Tron - PART2:
    Code which I used for this demo:

     Add a email lambda function to use SES to send emails for the serverless application
     ```python
    import boto3, os, json
    FROM_EMAIL_ADDRESS = 'REPLACE_ME'

    ses = boto3.client('ses')

    def lambda_handler(event, context):
        # Print event data to logs .. 
        print("Received event: " + json.dumps(event))
        # Publish message directly to email, provided by EmailOnly or EmailPar TASK
        ses.send_email( Source=FROM_EMAIL_ADDRESS,
            Destination={ 'ToAddresses': [ event['Input']['email'] ] }, 
            Message={ 'Subject': {'Data': 'Whiskers Commands You to attend!'},
                'Body': {'Text': {'Data': event['Input']['message']}}
            }
        )
        return 'Success!'
    ```

<br>

- ### Simple Queue Service(SQS):
    - Amazon Simple Queue Service (Amazon SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications
    - SQS eliminates the complexity and overhead associated with managing and operating message-oriented middleware, and empowers developers to focus on differentiating work
    - Using SQS, you can send, store, and receive messages between software components at any volume, without losing messages or requiring other services to be available
    - Get started with SQS in minutes using the AWS console, Command Line Interface or SDK of your choice, and three simple commands
    - SQS offers two types of message queues
        - Standard queues offer maximum throughput, best-effort ordering, and at-least-once delivery
        - SQS FIFO queues are designed to guarantee that messages are processed exactly once, in the exact order that they are sent
    - SQS is a cost-effective messaging solution that lets you decouple the components of a cloud application
    - You can use SQS to transmit any volume of data, without losing messages or requiring other services to be always available
    - There is no minimum fee or setup cost, and you only pay for what you use

<br>

- ### SQS Standard vs FIFO Queues:
    - Standard queues offer maximum throughput, best-effort ordering, and at-least-once delivery
    - SQS FIFO queues are designed to guarantee that messages are processed exactly once, in the exact order that they are sent
    - Standard queues provide at-least-once delivery, which means that each message is delivered at least once
    - Standard queues provide best-effort ordering which ensures that messages are generally delivered in the same order as they are sent
    - FIFO queues provide exactly-once processing, which means that each message is delivered once and remains available until a consumer processes it and deletes it
    - FIFO queues also support message groups that allow multiple ordered message groups within a single queue
    - FIFO queues are limited to 300 transactions per second (TPS)
    - Standard queues offer nearly unlimited transactions per second

<br>

- ### AWS Kinesis:
    - Kinesis makes it easy to collect, process, and analyze real-time, streaming data so you can get timely insights and react quickly to new information
    - Kinesis offers key capabilities to cost-effectively process streaming data at any scale, along with the flexibility to choose the tools that best suit the requirements of your application
    - Kinesis enables you to process and analyze data as it arrives and respond instantly instead of having to wait until all your data is collected before the processing can begin

<br>

- ### AWS Glue 101:
    - AWS Glue is a fully managed extract, transform, and load (ETL) service that makes it easy for customers to prepare and load their data for analytics
    - You can create and run an ETL job with a few clicks in the AWS Management Console
    - You simply point AWS Glue to your data stored on AWS, and AWS Glue discovers your data and stores the associated metadata (e.g. table definition and schema) in the AWS Glue Data Catalog
    - Once cataloged, your data is immediately searchable, queryable, and available for ETL
    - AWS Glue generates the code to execute your data transformations and data loading processes
    - AWS Glue generates Python code that is entirely customizable, reusable, and portable

<br>

- ### AWS MQ 101:
    - Amazon MQ is a managed message broker service for Apache ActiveMQ and RabbitMQ that makes it easy to set up and operate message brokers in the cloud
    - Message brokers allow different software systems–often using different programming languages, and on different platforms–to communicate and exchange information
    - Amazon MQ reduces your operational load by managing the provisioning, setup, and maintenance of message brokers for you
    - Amazon MQ automatically provisions the infrastructure required for high availability and durability, so that you can set up your message broker in minutes
    - Amazon MQ integrates with other AWS services and allows you to monitor and manage your brokers from a single console

<br>

- ### AWS AppFlow:
    - AWS AppFlow is a fully managed integration service that enables you to securely transfer data between Software-as-a-Service (SaaS) applications like Salesforce, Marketo, Slack, and ServiceNow, and AWS services like Amazon S3 and Amazon Redshift, in just a few clicks
    - With AWS AppFlow, you can use pre-built connectors to automate data flows between SaaS applications and AWS services, or build your own custom integrations with Amazon EventBridge
    - AWS AppFlow offers a serverless, fully managed, pay-as-you-go model, so there’s no infrastructure to manage, and you only pay for the data processed
