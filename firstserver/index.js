import express from 'express';
const app = express();

app.get('/',(req,res)=>{
    res.json(
        {   id: 99,
            message:"just update some minute stuffs"
        }
    );
});

app.listen(3000,()=>{
    console.log("server is running on port 3000");
});