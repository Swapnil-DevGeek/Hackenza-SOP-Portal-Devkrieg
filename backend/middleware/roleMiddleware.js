const determineUserRole = (req,res,next) => {
    const email  = req.body.email;
    const domain = email.substring(email.lastIndexOf('@') + 1);
    if(domain == 'goa.bits-pilani.ac.in'){
        if(firstChar == 'f' || firstChar == 'p'){
            req.user.role = 'bachstudent';
        }
        else {
            req.user.role = 'faculty';
        }
    }
    else{
        req.user.role = 'admin';
    }
    next();
}

module.exports = determineUserRole;