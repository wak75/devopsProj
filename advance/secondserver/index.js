import express from 'express';
const app = express();

app.get('/',async(req,res)=>{
    try{
        await fetch("http://front:3000/")
        .then(res=>res.json())
        .then(data=>{
            let revesedString = data.message.split("").reverse().join("");
            data.message = revesedString;
            res.json(data);
        });
    }catch(err){
        res.json({
            message:"error"
        });
    }
});
app.listen(4000,()=>{
    console.log("server is running on port 4000");
});