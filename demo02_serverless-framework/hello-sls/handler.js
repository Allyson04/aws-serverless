"use strict";

module.exports.hello = async event => {
  console.log('EVENTO**',
  JSON.stringify(
	  event,
	  null,
	  2
  )
  )
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: "Got Serverless v2.0! Your function executed successfully!",
        input: event,
      },
      null,
      2
    ),
  };
};
