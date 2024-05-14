import express from 'express';
const app = express();

app.get('/',(req,res)=>{
    res.json(
        {   id: 1,
            message:"Final data for the best practices step"
        }
    );
});

app.listen(3000,()=>{
    console.log("server is running on port 3000");
});