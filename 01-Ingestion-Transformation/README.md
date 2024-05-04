**Domain 1: Data Ingestion and Transformation**

_Task Statement 1.1: Perform data ingestion._

    Knowledge of:
    • Throughput and latency characteristics for AWS services that ingest data
    • Data ingestion patterns (for example, frequency and data history)
    • Streaming data ingestion
    • Batch data ingestion (for example, scheduled ingestion, event-driven
    ingestion)
    • Replayability of data ingestion pipelines
    • Stateful and stateless data transactions

    Skills in:
    • Reading data from streaming sources (for example, Amazon Kinesis,
    Amazon Managed Streaming for Apache Kafka [Amazon MSK], Amazon
    DynamoDB Streams, AWS Database Migration Service [AWS DMS], AWS
    Glue, Amazon Redshift)
    • Reading data from batch sources (for example, Amazon S3, AWS Glue,
    Amazon EMR, AWS DMS, Amazon Redshift, AWS Lambda, Amazon
    AppFlow)
    • Implementing appropriate configuration options for batch ingestion
    • Consuming data APIs
    • Setting up schedulers by using Amazon EventBridge, Apache Airflow, or
        time-based schedules for jobs and crawlers
    • Setting up event triggers (for example, Amazon S3 Event Notifications,
        EventBridge)
    • Calling a Lambda function from Amazon Kinesis
    • Creating allowlists for IP addresses to allow connections to data sources
    • Implementing throttling and overcoming rate limits (for example,
        DynamoDB, Amazon RDS, Kinesis)
    • Managing fan-in and fan-out for streaming data distribution

_Task Statement 1.2: Transform and process data._

    Knowledge of:
    • Creation of ETL pipelines based on business requirements
    • Volume, velocity, and variety of data (for example, structured data,
    unstructured data)
    • Cloud computing and distributed computing
    • How to use Apache Spark to process data
    • Intermediate data staging locations

    Skills in:
    • Optimizing container usage for performance needs (for example, Amazon
    Elastic Kubernetes Service [Amazon EKS], Amazon Elastic Container Service
    [Amazon ECS])
    • Connecting to different data sources (for example, Java Database
    Connectivity [JDBC], Open Database Connectivity [ODBC])
    • Integrating data from multiple sources
    • Optimizing costs while processing data
    • Implementing data transformation services based on requirements (for
    example, Amazon EMR, AWS Glue, Lambda, Amazon Redshift)
    • Transforming data between formats (for example, from .csv to Apache
    Parquet)
    • Troubleshooting and debugging common transformation failures and
    performance issues
    • Creating data APIs to make data available to other systems by using AWS
    services

_Task Statement 1.3: Orchestrate data pipelines._

    Knowledge of:
    • How to integrate various AWS services to create ETL pipelines
    • Event-driven architecture
    • How to configure AWS services for data pipelines based on schedules or
    dependencies
    • Serverless workflows

    Skills in:
    • Using orchestration services to build workflows for data ETL pipelines (for
    example, Lambda, EventBridge, Amazon Managed Workflows for Apache
    Airflow [Amazon MWAA], AWS Step Functions, AWS Glue workflows)
    • Building data pipelines for performance, availability, scalability, resiliency,
    and fault tolerance
    • Implementing and maintaining serverless workflows
    • Using notification services to send alerts (for example, Amazon Simple
    Notification Service [Amazon SNS], Amazon Simple Queue Service [Amazon
    SQS])

_Task Statement 1.4: Apply programming concepts._

    Knowledge of:
    • Continuous integration and continuous delivery (CI/CD) (implementation,
    testing, and deployment of data pipelines)
    • SQL queries (for data source queries and data transformations)
    • Infrastructure as code (IaC) for repeatable deployments (for example, AWS
    Cloud Development Kit [AWS CDK], AWS CloudFormation)
    • Distributed computing
    • Data structures and algorithms (for example, graph data structures and tree
    data structures)
    • SQL query optimization

    Skills in:
    • Optimizing code to reduce runtime for data ingestion and transformation
    • Configuring Lambda functions to meet concurrency and performance needs
    • Performing SQL queries to transform data (for example, Amazon Redshift
    stored procedures)
    • Structuring SQL queries to meet data pipeline requirements
    • Using Git commands to perform actions such as creating, updating, cloning,
    and branching repositories
    • Using the AWS Serverless Application Model (AWS SAM) to package and
    deploy serverless data pipelines (for example, Lambda functions, Step
    Functions, DynamoDB tables)
    • Using and mounting storage volumes from within Lambda functions
