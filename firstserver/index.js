import express from 'express';
const app = express();

app.get('/',(req,res)=>{
    res.json(
        {   id: 1,
            message:"Hello World"
        }
    );
});

app.listen(3000,()=>{
    console.log("server is running on port 3000");
});