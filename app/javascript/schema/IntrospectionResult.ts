
      export interface IntrospectionResultData {
        __schema: {
          types: {
            kind: string;
            name: string;
            possibleTypes: {
              name: string;
            }[];
          }[];
        };
      }

      const result: IntrospectionResultData = {
  "__schema": {
    "types": [
      {
        "kind": "UNION",
        "name": "Likeable",
        "possibleTypes": [
          {
            "name": "Player"
          },
          {
            "name": "Team"
          }
        ]
      }
    ]
  }
};

      export default result;
    