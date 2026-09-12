const {onRequest} = require("firebase-functions/v2/https");

exports.getQuotes = onRequest(
    {cors: true},
    async (req, res) => {
      try {
        const response = await fetch(
            "https://zenquotes.io/api/quotes",
        );

        if (!response.ok) {
          return res.status(response.status).json({
            error: "ZenQuotes request failed",
          });
        }

        const data = await response.json();

        return res.status(200).json(data);
      } catch (error) {
        console.error(error);

        return res.status(500).json({
          error: "Server error",
        });
      }
    },
);
