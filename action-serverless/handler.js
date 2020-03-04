/* handler.js */
const {
  graphql,
  GraphQLSchema,
  GraphQLObjectType,
  GraphQLString,
  GraphQLNonNull
} = require('graphql')

// This method just inserts the user's first name into the greeting message.
const getGreeting = firstName => `Hello, ${firstName}.`

// Here we declare the schema and resolvers for the query
const schema = new GraphQLSchema({
  query: new GraphQLObjectType({
    name: 'RootQueryType', // an arbitrary name
    fields: {
      // the query has a field called 'greeting'
      greeting: {
        // we need to know the user's name to greet them
        args: { firstName: { name: 'firstName', type: new GraphQLNonNull(GraphQLString) } },
        // the greeting message is a string
        type: GraphQLString,
        // resolve to a greeting message
        resolve: (parent, args) => getGreeting(args.firstName)
      }
    }
  }),
})

// We want to make a GET request with ?query=<graphql query>
// The event properties are specific to AWS. Other providers will differ.
module.exports.query = (event, context, callback) => graphql(schema, event.queryStringParameters.query)
  .then(
    result => callback(null, {statusCode: 200, body: JSON.stringify(result)}),
    err => callback(err)
  )
const AWS = require('aws-sdk');
const dynamoDb = new AWS.DynamoDB.DocumentClient();
const promisify = foo => new Promise((resolve, reject) => {
  foo((error, result) => {
    if(error) {
      reject(error)
    } else {
      resolve(result)
    }
  })
})

// replace previous implementation of getGreeting
const getGreeting = firstName => promisify(callback =>
  dynamoDb.get({
    TableName: process.env.DYNAMODB_TABLE,
    Key: { firstName },
  }, callback))
  .then(result => {
    if(!result.Item) {
      return firstName
    }
    return result.Item.nickname
  })
  .then(name => `Hello, ${name}.`)

  // add method for updates
const changeNickname = (firstName, nickname) => promisify(callback =>
  dynamoDb.update({
    TableName: process.env.DYNAMODB_TABLE,
    Key: { firstName },
    UpdateExpression: 'SET nickname = :nickname',
    ExpressionAttributeValues: {
      ':nickname': nickname
    }
  }, callback))
  .then(() => nickname)
